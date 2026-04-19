package me.biplobsd.rsm

import android.os.ParcelFileDescriptor
import java.io.InputStream
import java.io.OutputStream
import kotlin.system.exitProcess

fun InputStream.pipeTo(output: OutputStream) {
    copyTo(output)
    close()
}

class ShellService : IShellService.Stub() {

    override fun executeCommand(command: String): ShellResult {
        return ShellExecutor.executeShellCommand(command)
    }

    override fun executeCommandWithFd(command: String): ParcelFileDescriptor {
        val pipes = ParcelFileDescriptor.createPipe()
        val readFd = pipes[0]
        val writeFd = pipes[1]

        Thread {
                    try {
                        ParcelFileDescriptor.AutoCloseOutputStream(writeFd).use { output ->
                            val process = Runtime.getRuntime().exec(arrayOf("sh", "-c", command))
                            val stderrThread = Thread {
                                try {
                                    process.errorStream.copyTo(output)
                                } catch (_: Exception) {}
                            }
                            stderrThread.start()
                            try {
                                process.inputStream.copyTo(output)
                            } catch (_: Exception) {}
                            process.waitFor()
                            stderrThread.join(5000)
                        }
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                }
                .start()

        return readFd
    }

    override fun destroy() {
        exitProcess(0)
    }
}
