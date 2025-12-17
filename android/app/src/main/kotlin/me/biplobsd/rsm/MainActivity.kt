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
import java.io.InputStream
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import rikka.shizuku.Shizuku

fun InputStream.forEachLineTo(handler: Handler, sink: PigeonEventSink<String>) {
    bufferedReader().forEachLine { line -> handler.post { sink.success(line) } }
}

class MainActivity : FlutterActivity(), Shizuku.OnRequestPermissionResultListener, ShizukuHostApi {
    val shizukuPermissionRequestCode = 1001
    var pendingPermissionCallback: ((Result<Boolean>) -> Unit)? = null
    val mainHandler = Handler(Looper.getMainLooper())
    var isRootAvailable: Boolean? = null
    var currentWorkingMode: String = "auto"
    var pendingStreamCommand: String? = null

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

    val streamHandler =
            object : StreamOutputStreamHandler() {
                var eventSink: PigeonEventSink<String>? = null

                override fun onListen(p0: Any?, sink: PigeonEventSink<String>) {
                    eventSink = sink
                    val command = pendingStreamCommand
                    if (command == null) {
                        sink.error(
                                "NO_COMMAND",
                                "No stream command set. Call setStreamCommand first.",
                                null
                        )
                        sink.endOfStream()
                        return
                    }

                    CoroutineScope(Dispatchers.IO).launch {
                        try {
                            executeCommandWithStream(command, currentWorkingMode, sink)
                            withContext(Dispatchers.Main) { sink.endOfStream() }
                        } catch (e: Exception) {
                            withContext(Dispatchers.Main) {
                                sink.error("EXECUTION_ERROR", e.message, null)
                                sink.endOfStream()
                            }
                        }
                    }
                }

                override fun onCancel(p0: Any?) {
                    eventSink = null
                }
            }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Shizuku.addRequestPermissionResultListener(this)
        ShizukuHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, this)
        StreamOutputStreamHandler.register(
                flutterEngine.dartExecutor.binaryMessenger,
                streamHandler
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
            pendingPermissionCallback?.invoke(Result.success(granted))
            pendingPermissionCallback = null
        }
    }

    override fun runCommand(request: CommandRequest, callback: (Result<CommandResult>) -> Unit) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val mode = request.mode ?: currentWorkingMode
                val output = executeCommand(request.command, mode)
                withContext(Dispatchers.Main) {
                    callback(Result.success(CommandResult(output = output)))
                }
            } catch (e: Exception) {
                e.printStackTrace()
                withContext(Dispatchers.Main) {
                    callback(Result.success(CommandResult(error = e.message)))
                }
            }
        }
    }

    override fun setWorkingMode(mode: String) {
        currentWorkingMode = mode
    }

    override fun getWorkingMode(): String = currentWorkingMode

    override fun pingBinder(): Boolean =
            try {
                Shizuku.pingBinder()
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }

    override fun checkRootPermission(callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.IO).launch {
            val hasRoot = checkRootAvailable()
            withContext(Dispatchers.Main) { callback(Result.success(hasRoot)) }
        }
    }

    override fun requestRootPermission(callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.IO).launch {
            val hasRoot = checkRootAvailable()
            withContext(Dispatchers.Main) { callback(Result.success(hasRoot)) }
        }
    }

    override fun checkPermission(): Boolean =
            try {
                !Shizuku.isPreV11() &&
                        Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED
            } catch (e: Exception) {
                e.printStackTrace()
                false
            }

    override fun requestPermission(callback: (Result<Boolean>) -> Unit) {
        try {
            if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) {
                callback(Result.success(true))
            } else {
                pendingPermissionCallback = callback
                Shizuku.requestPermission(shizukuPermissionRequestCode)
            }
        } catch (e: Exception) {
            callback(Result.failure(e))
        }
    }

    override fun setStreamCommand(command: String) {
        pendingStreamCommand = command
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

    fun executeCommand(command: String, mode: String): String =
            when (mode) {
                "root" ->
                        if (checkRootAvailable()) executeRootCommand(command)
                        else throw Exception("Root is not available")
                "shizuku" ->
                        if (Shizuku.pingBinder()) executeShizukuCommand(command)
                        else throw Exception("Shizuku is not running")
                else ->
                        when {
                            checkRootAvailable() -> executeRootCommand(command)
                            Shizuku.pingBinder() -> executeShizukuCommand(command)
                            else -> throw Exception("No execution mode available")
                        }
            }

    fun executeShizukuCommand(command: String): String {
        if (!bindShellService()) throw Exception("Failed to bind shell service")
        return shellService?.executeCommand(command)
                ?: throw Exception("Shell service is not available")
    }

    fun checkRootAvailable(): Boolean {
        if (isRootAvailable != null) return isRootAvailable!!
        isRootAvailable =
                try {
                    val process = Runtime.getRuntime().exec("su -c id")
                    val output = process.inputStream.readToString()
                    process.waitFor()
                    output.contains("uid=0")
                } catch (e: Exception) {
                    e.printStackTrace()
                    false
                }
        return isRootAvailable!!
    }

    fun executeRootCommand(command: String): String {
        val process = Runtime.getRuntime().exec(arrayOf("su", "-c", command))
        val output = process.inputStream.readToString()
        process.waitFor()
        return output
    }

    fun executeCommandWithStream(command: String, mode: String, sink: PigeonEventSink<String>) =
            when (mode) {
                "root" ->
                        if (checkRootAvailable()) executeRootCommandWithStream(command, sink)
                        else throw Exception("Root is not available")
                "shizuku" ->
                        if (Shizuku.pingBinder()) executeShizukuCommandWithStream(command, sink)
                        else throw Exception("Shizuku is not running")
                else ->
                        when {
                            checkRootAvailable() -> executeRootCommandWithStream(command, sink)
                            Shizuku.pingBinder() -> executeShizukuCommandWithStream(command, sink)
                            else -> throw Exception("No execution mode available")
                        }
            }

    fun executeRootCommandWithStream(command: String, sink: PigeonEventSink<String>) {
        val process = Runtime.getRuntime().exec(arrayOf("su", "-c", command))
        process.inputStream.forEachLineTo(mainHandler, sink)
        process.errorStream.forEachLineTo(mainHandler, sink)
        process.waitFor()
    }

    fun executeShizukuCommandWithStream(command: String, sink: PigeonEventSink<String>) {
        if (!bindShellService()) throw Exception("Failed to bind shell service")
        val pfd =
                shellService?.executeCommandWithFd(command)
                        ?: throw Exception("Shell service is not available")
        ParcelFileDescriptor.AutoCloseInputStream(pfd).forEachLineTo(mainHandler, sink)
    }
}
