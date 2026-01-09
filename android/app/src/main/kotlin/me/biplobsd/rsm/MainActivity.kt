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
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import kotlinx.coroutines.coroutineScope
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
    var pendingStreamCommand: String? = null
    var pendingStreamMode: String? = null
    var pendingAppInfoStream: Boolean = false

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
                            executeCommandWithStream(command, pendingStreamMode ?: "auto", sink)
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

    val appInfoStreamHandler =
            object : AppInfoOutputStreamHandler() {
                var eventSink: PigeonEventSink<AppInfoData>? = null

                override fun onListen(p0: Any?, sink: PigeonEventSink<AppInfoData>) {
                    eventSink = sink
                    if (!pendingAppInfoStream) {
                        sink.error(
                                "NO_STREAM_REQUESTED",
                                "No app info stream requested. Call startAppInfoStream first.",
                                null
                        )
                        sink.endOfStream()
                        return
                    }
                    pendingAppInfoStream = false

                    CoroutineScope(Dispatchers.IO).launch {
                        try {
                            streamAppInfo(sink)
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
        AppInfoOutputStreamHandler.register(
                flutterEngine.dartExecutor.binaryMessenger,
                appInfoStreamHandler
        )
    }

    override fun onDestroy() {
        super.onDestroy()
        Shizuku.removeRequestPermissionResultListener(this)
        CoroutineScope(Dispatchers.IO).launch { unbindShellService() }
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
                val mode = request.mode ?: "auto"
                val result = executeCommand(request.command, mode)
                withContext(Dispatchers.Main) {
                    callback(
                            Result.success(
                                    CommandResult(
                                            exitCode = result.exitCode.toLong(),
                                            output = result.output
                                    )
                            )
                    )
                }
            } catch (e: Exception) {
                e.printStackTrace()
                withContext(Dispatchers.Main) {
                    callback(Result.success(CommandResult(error = e.message)))
                }
            }
        }
    }

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
                pendingPermissionCallback = { result ->
                    if (result.getOrNull() == true) {
                        unbindShellService()
                    }
                    callback(result)
                }
                Shizuku.requestPermission(shizukuPermissionRequestCode)
            }
        } catch (e: Exception) {
            callback(Result.failure(e))
        }
    }

    override fun setStreamCommand(command: String, mode: String?) {
        pendingStreamCommand = command
        pendingStreamMode = mode
    }

    override fun startAppInfoStream() {
        pendingAppInfoStream = true
    }

    suspend fun streamAppInfo(sink: PigeonEventSink<AppInfoData>) {
        try {
            val pm = packageManager
            val apps: List<Pair<String, Boolean>>

            if (bindShellService()) {
                val shellApps = shellService?.getInstalledApps() ?: emptyList()
                apps = shellApps.map { Pair(it.packageName, it.isSystemApp) }
            } else {
                val installedPackages = pm.getInstalledPackages(0)
                apps =
                        installedPackages.map { pkg ->
                            val isSystemApp =
                                    (pkg.applicationInfo?.flags
                                            ?: 0) and
                                            android.content.pm.ApplicationInfo.FLAG_SYSTEM != 0
                            Pair(pkg.packageName, isSystemApp)
                        }
            }

            if (apps.isEmpty()) {
                mainHandler.post { sink.error("NO_APPS", "No apps returned", null) }
                return
            }

            val parallelism = 20
            coroutineScope {
                apps.chunked(parallelism).forEach { chunk ->
                    val results = chunk.map { (packageName, isSystemApp) ->
                        async(Dispatchers.IO) {
                            try {
                                var appName = packageName.substringAfterLast(".")
                                var icon: ByteArray? = null
                                try {
                                    val appInfo = pm.getApplicationInfo(packageName, 0)
                                    appName = AppUtils.getAppLabel(this@MainActivity, appInfo, packageName)
                                    icon = AppUtils.getAppIconBytes(pm, appInfo)
                                } catch (e: Exception) {}
                                AppInfoData(packageName, appName, icon, isSystemApp)
                            } catch (e: Exception) {
                                e.printStackTrace()
                                null
                            }
                        }
                    }.awaitAll()
                    
                    results.filterNotNull().forEach { appInfoData ->
                        mainHandler.post { sink.success(appInfoData) }
                    }
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
            mainHandler.post { sink.error("STREAM_ERROR", e.message, null) }
        }
    }

    override fun getAppInfo(packageName: String, callback: (Result<AppInfoData?>) -> Unit) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val pm = packageManager
                var appName = packageName.substringAfterLast(".")
                var icon: ByteArray? = null
                var isSystemApp = false

                if (bindShellService()) {
                    val app = shellService?.getAppInfo(packageName)
                    if (app != null) {
                        appName = app.appName
                        isSystemApp = app.isSystemApp
                    }
                }

                try {
                    val appInfo = pm.getApplicationInfo(packageName, 0)
                    appName = AppUtils.getAppLabel(this@MainActivity, appInfo, packageName)
                    icon = AppUtils.getAppIconBytes(pm, appInfo)
                    isSystemApp =
                            (appInfo.flags and android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0
                } catch (e: Exception) {}

                val appInfoData = AppInfoData(packageName, appName, icon, isSystemApp)
                withContext(Dispatchers.Main) { callback(Result.success(appInfoData)) }
            } catch (e: Exception) {
                e.printStackTrace()
                withContext(Dispatchers.Main) { callback(Result.success(null)) }
            }
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

    fun executeCommand(command: String, mode: String): ShellResult =
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

    fun executeShizukuCommand(command: String): ShellResult {
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

    fun executeRootCommand(command: String): ShellResult {
        val process = Runtime.getRuntime().exec(arrayOf("su", "-c", command))
        val output = process.inputStream.readToString()
        val errorOutput = process.errorStream.readToString()
        val exitCode = process.waitFor()

        return ShellResult(exitCode, output + errorOutput)
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
