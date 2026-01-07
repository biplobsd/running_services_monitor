package me.biplobsd.rsm

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.os.Build
import android.os.IBinder
import android.os.ParcelFileDescriptor
import java.io.InputStream
import java.io.OutputStream
import kotlin.system.exitProcess

fun InputStream.readToString(): String = bufferedReader().use { it.readText() }

fun InputStream.pipeTo(output: OutputStream) {
    copyTo(output)
    close()
}

class ShellService : IShellService.Stub {
    var context: Context? = null
    var packageManager: Any? = null
    var initialized: Boolean = false

    constructor() : super()

    constructor(context: Context) : super() {
        this.context = context
        ensureInitialized()
    }

    @Synchronized
    fun ensureInitialized() {
        if (initialized) return
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                org.lsposed.hiddenapibypass.HiddenApiBypass.addHiddenApiExemptions("")
            }
            packageManager = getIPackageManager()
            initialized = true
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    fun getIPackageManager(): Any? {
        return try {
            val serviceManagerClass = Class.forName("android.os.ServiceManager")
            val getServiceMethod = serviceManagerClass.getMethod("getService", String::class.java)
            val binder = getServiceMethod.invoke(null, "package") as? IBinder ?: return null

            val iPackageManagerStub = Class.forName("android.content.pm.IPackageManager\$Stub")
            val asInterfaceMethod =
                    iPackageManagerStub.getMethod("asInterface", IBinder::class.java)
            asInterfaceMethod.invoke(null, binder)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    override fun executeCommand(command: String): ShellResult {
        val process = Runtime.getRuntime().exec(arrayOf("sh", "-c", command))
        val output = process.inputStream.readToString()
        val errorOutput = process.errorStream.readToString()
        val exitCode = process.waitFor()
        return ShellResult(exitCode, output + errorOutput)
    }

    override fun executeCommandWithFd(command: String): ParcelFileDescriptor {
        val pipes = ParcelFileDescriptor.createPipe()
        val readFd = pipes[0]
        val writeFd = pipes[1]

        Thread {
                    try {
                        ParcelFileDescriptor.AutoCloseOutputStream(writeFd).use { output ->
                            val process = Runtime.getRuntime().exec(arrayOf("sh", "-c", command))
                            process.inputStream.pipeTo(output)
                            process.waitFor()
                        }
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                }
                .start()

        return readFd
    }

    fun getInstalledPackagesMethod(pm: Any): java.lang.reflect.Method {
        return try {
            pm.javaClass.getMethod(
                    "getInstalledPackages",
                    Long::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType
            )
        } catch (e: NoSuchMethodException) {
            pm.javaClass.getMethod(
                    "getInstalledPackages",
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType
            )
        }
    }

    fun getPackageInfoMethod(pm: Any): java.lang.reflect.Method {
        return try {
            pm.javaClass.getMethod(
                    "getPackageInfo",
                    String::class.java,
                    Long::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType
            )
        } catch (e: NoSuchMethodException) {
            pm.javaClass.getMethod(
                    "getPackageInfo",
                    String::class.java,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType
            )
        }
    }

    override fun getInstalledApps(): List<AppInfoResult> {
        ensureInitialized()
        val pm = packageManager ?: throw Exception("PackageManager not available")
        
        return try {
            val method = getInstalledPackagesMethod(pm)
            val flags = if (method.parameterTypes[0] == Long::class.javaPrimitiveType) 0L else 0
            val parceledListSlice = method.invoke(pm, flags, 0) ?: return emptyList()
            
            val getListMethod = parceledListSlice.javaClass.getMethod("getList")
            @Suppress("UNCHECKED_CAST")
            val packages = getListMethod.invoke(parceledListSlice) as? List<PackageInfo> ?: return emptyList()

            packages.mapNotNull { packageInfo ->
                try {
                    val appInfo = packageInfo.applicationInfo ?: return@mapNotNull null
                    val isSystemApp = (appInfo.flags and ApplicationInfo.FLAG_SYSTEM) != 0
                    val label = AppUtils.getAppLabel(context, appInfo, packageInfo.packageName)
                    AppInfoResult(packageInfo.packageName, label, null, isSystemApp)
                } catch (e: Exception) {
                    e.printStackTrace()
                    null
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
            emptyList()
        }
    }

    override fun getAppInfo(packageName: String): AppInfoResult? {
        ensureInitialized()
        val pm = packageManager ?: return null
        
        return try {
            val method = getPackageInfoMethod(pm)
            val flags = if (method.parameterTypes[1] == Long::class.javaPrimitiveType) 0L else 0
            val packageInfo = method.invoke(pm, packageName, flags, 0) as? PackageInfo ?: return null

            val appInfo = packageInfo.applicationInfo ?: return null
            val isSystemApp = (appInfo.flags and ApplicationInfo.FLAG_SYSTEM) != 0
            val label = AppUtils.getAppLabel(context, appInfo, packageName)
            AppInfoResult(packageName, label, null, isSystemApp)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    override fun destroy() {
        exitProcess(0)
    }
}
