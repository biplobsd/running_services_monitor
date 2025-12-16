package me.biplobsd.rsm

import android.content.ComponentName
import android.content.ServiceConnection
import android.content.pm.PackageManager
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.ParcelFileDescriptor
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import rikka.shizuku.Shizuku

class MainActivity : FlutterActivity(), Shizuku.OnRequestPermissionResultListener {
    val channel = "com.runningservices/shizuku"
    val streamChannel = "com.runningservices/shizuku_stream"
    val shizukuPermissionRequestCode = 1001
    var pendingPermissionResult: MethodChannel.Result? = null
    val mainHandler = Handler(Looper.getMainLooper())
    var isRootAvailable: Boolean? = null
    var currentWorkingMode: String = "auto"

    var shellService: IShellService? = null
    var boundConnection: ServiceConnection? = null
    val userServiceArgs =
            Shizuku.UserServiceArgs(
                            ComponentName(BuildConfig.APPLICATION_ID, ShellService::class.java.name)
                    )
                    .daemon(true)
                    .processNameSuffix("shell_service")
                    .debuggable(BuildConfig.DEBUG)
                    .version(BuildConfig.VERSION_CODE)

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        Shizuku.addRequestPermissionResultListener(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call,
                result ->
            when (call.method) {
                "runCommand" -> {
                    val command = call.argument<String>("command")
                    val mode = call.argument<String>("mode") ?: currentWorkingMode
                    if (command != null) {
                        runCommandInBackground(command, mode, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Command cannot be null", null)
                    }
                }
                "setWorkingMode" -> {
                    val mode = call.argument<String>("mode")
                    if (mode != null) {
                        currentWorkingMode = mode
                        result.success(true)
                    } else {
                        result.error("INVALID_ARGUMENT", "Mode cannot be null", null)
                    }
                }
                "getWorkingMode" -> {
                    result.success(currentWorkingMode)
                }
                "pingBinder" -> {
                    try {
                        result.success(Shizuku.pingBinder())
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "checkRootPermission" -> {
                    CoroutineScope(Dispatchers.IO).launch {
                        val hasRoot = checkRootAvailable()
                        withContext(Dispatchers.Main) { result.success(hasRoot) }
                    }
                }
                "requestRootPermission" -> {
                    CoroutineScope(Dispatchers.IO).launch {
                        val hasRoot = checkRootAvailable()
                        withContext(Dispatchers.Main) { result.success(hasRoot) }
                    }
                }
                "checkPermission" -> {
                    try {
                        if (Shizuku.isPreV11()) {
                            result.success(false)
                        } else {
                            result.success(
                                    Shizuku.checkSelfPermission() ==
                                            PackageManager.PERMISSION_GRANTED
                            )
                        }
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "requestPermission" -> {
                    try {
                        if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) {
                            result.success(true)
                        } else if (Shizuku.shouldShowRequestPermissionRationale()) {
                            pendingPermissionResult = result
                            Shizuku.requestPermission(shizukuPermissionRequestCode)
                        } else {
                            pendingPermissionResult = result
                            Shizuku.requestPermission(shizukuPermissionRequestCode)
                        }
                    } catch (e: Exception) {
                        result.error("PERMISSION_ERROR", e.message, null)
                    }
                }
                else -> result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, streamChannel)
                .setStreamHandler(
                        object : EventChannel.StreamHandler {
                            override fun onListen(
                                    arguments: Any?,
                                    events: EventChannel.EventSink?
                            ) {
                                if (events == null) return

                                val command = arguments as? String
                                if (command == null) {
                                    events.error("INVALID_ARGUMENT", "Command cannot be null", null)
                                    events.endOfStream()
                                    return
                                }

                                CoroutineScope(Dispatchers.IO).launch {
                                    try {
                                        executeCommandWithStream(
                                                command,
                                                currentWorkingMode,
                                                events
                                        )
                                        withContext(Dispatchers.Main) { events.endOfStream() }
                                    } catch (e: Exception) {
                                        withContext(Dispatchers.Main) {
                                            events.error("EXECUTION_ERROR", e.message, null)
                                            events.endOfStream()
                                        }
                                    }
                                }
                            }

                            override fun onCancel(arguments: Any?) {}
                        }
                )
    }

    override fun onDestroy() {
        super.onDestroy()
        Shizuku.removeRequestPermissionResultListener(this)
        unbindShellService()
    }

    override fun onRequestPermissionResult(requestCode: Int, grantResult: Int) {
        if (requestCode == shizukuPermissionRequestCode) {
            val granted = grantResult == PackageManager.PERMISSION_GRANTED
            pendingPermissionResult?.success(granted)
            pendingPermissionResult = null
        }
    }

    fun bindShellService(): Boolean {
        if (shellService != null) return true

        try {
            val latch = CountDownLatch(1)
            val connection =
                    object : ServiceConnection {
                        override fun onServiceConnected(name: ComponentName?, service: IBinder?) {
                            shellService = IShellService.Stub.asInterface(service)
                            latch.countDown()
                        }

                        override fun onServiceDisconnected(name: ComponentName?) {
                            shellService = null
                            boundConnection = null
                        }
                    }

            boundConnection = connection
            Shizuku.bindUserService(userServiceArgs, connection)
            return latch.await(10, TimeUnit.SECONDS)
        } catch (e: Exception) {
            e.printStackTrace()
            return false
        }
    }

    fun unbindShellService() {
        try {
            boundConnection?.let { conn -> Shizuku.unbindUserService(userServiceArgs, conn, true) }
            shellService = null
            boundConnection = null
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    fun runCommandInBackground(command: String, mode: String, result: MethodChannel.Result) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val output = executeCommand(command, mode)
                withContext(Dispatchers.Main) { result.success(output) }
            } catch (e: Exception) {
                e.printStackTrace()
                withContext(Dispatchers.Main) { result.error("EXECUTION_ERROR", e.message, null) }
            }
        }
    }

    fun executeCommand(command: String, mode: String): String {
        return when (mode) {
            "root" -> {
                if (checkRootAvailable()) {
                    executeRootCommand(command)
                } else {
                    throw Exception("Root is not available")
                }
            }
            "shizuku" -> {
                if (Shizuku.pingBinder()) {
                    executeShizukuCommand(command)
                } else {
                    throw Exception("Shizuku is not running")
                }
            }
            else -> {
                if (checkRootAvailable()) {
                    executeRootCommand(command)
                } else if (Shizuku.pingBinder()) {
                    executeShizukuCommand(command)
                } else {
                    throw Exception("No execution mode available")
                }
            }
        }
    }

    fun executeShizukuCommand(command: String): String {
        if (!bindShellService()) {
            throw Exception("Failed to bind shell service")
        }

        val service = shellService ?: throw Exception("Shell service is not available")
        return service.executeCommand(command)
    }

    fun checkRootAvailable(): Boolean {
        if (isRootAvailable != null) {
            return isRootAvailable!!
        }

        isRootAvailable =
                try {
                    val process = Runtime.getRuntime().exec("su -c id")
                    val buffer = ByteArray(256)
                    val bytesRead = process.inputStream.read(buffer)
                    process.waitFor()
                    process.inputStream.close()
                    if (bytesRead > 0) String(buffer, 0, bytesRead).contains("uid=0") else false
                } catch (e: Exception) {
                    false
                }

        return isRootAvailable!!
    }

    fun executeRootCommand(command: String): String {
        val process = Runtime.getRuntime().exec(command)
        val output = StringBuilder()

        val inputReader = process.inputStream.bufferedReader()
        var line: String?
        while (inputReader.readLine().also { line = it } != null) {
            output.appendLine(line)
        }

        process.waitFor()
        inputReader.close()
        return output.toString()
    }

    fun executeCommandWithStream(command: String, mode: String, events: EventChannel.EventSink) {
        when (mode) {
            "root" -> {
                if (checkRootAvailable()) {
                    executeRootCommandWithStream(command, events)
                } else {
                    throw Exception("Root is not available")
                }
            }
            "shizuku" -> {
                if (Shizuku.pingBinder()) {
                    executeShizukuCommandWithStream(command, events)
                } else {
                    throw Exception("Shizuku is not running")
                }
            }
            else -> {
                if (checkRootAvailable()) {
                    executeRootCommandWithStream(command, events)
                } else if (Shizuku.pingBinder()) {
                    executeShizukuCommandWithStream(command, events)
                } else {
                    throw Exception("No execution mode available")
                }
            }
        }
    }

    fun executeRootCommandWithStream(command: String, events: EventChannel.EventSink) {
        val process = Runtime.getRuntime().exec(arrayOf("su", "-c", command))
        streamProcessOutput(process, events)
    }

    fun executeShizukuCommandWithStream(command: String, events: EventChannel.EventSink) {
        if (!bindShellService()) {
            throw Exception("Failed to bind shell service")
        }

        val service = shellService ?: throw Exception("Shell service is not available")
        val pfd = service.executeCommandWithFd(command)

        val reader = ParcelFileDescriptor.AutoCloseInputStream(pfd).bufferedReader()
        var line: String?

        while (reader.readLine().also { line = it } != null) {
            val lineValue = line
            mainHandler.post { events.success(lineValue) }
        }

        reader.close()
    }

    fun streamProcessOutput(process: Process, events: EventChannel.EventSink) {
        var line: String?

        val inputReader = process.inputStream.bufferedReader()
        while (inputReader.readLine().also { line = it } != null) {
            val lineValue = line
            mainHandler.post { events.success(lineValue) }
        }

        val errorReader = process.errorStream.bufferedReader()
        while (errorReader.readLine().also { line = it } != null) {
            val lineValue = line
            mainHandler.post { events.success(lineValue) }
        }

        process.waitFor()
        inputReader.close()
        errorReader.close()
    }
}
