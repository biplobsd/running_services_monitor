package me.biplobsd.rsm

import android.content.Context
import android.os.ParcelFileDescriptor
import kotlin.system.exitProcess

class ShellService : IShellService.Stub {
    constructor() : super()

    @Suppress("UNUSED_PARAMETER") constructor(context: Context) : super()

    override fun executeCommand(command: String): String {
        val process = Runtime.getRuntime().exec(command)
        val output = StringBuilder()

        val inputReader = process.inputStream.bufferedReader()
        var line: String?
        while (inputReader.readLine().also { line = it } != null) {
            output.appendLine(line)
        }

        val errorReader = process.errorStream.bufferedReader()
        while (errorReader.readLine().also { line = it } != null) {
            output.appendLine(line)
        }

        process.waitFor()
        inputReader.close()
        errorReader.close()

        return output.toString()
    }

    override fun executeCommandWithFd(command: String): ParcelFileDescriptor {
        val pipes = ParcelFileDescriptor.createPipe()
        val readFd = pipes[0]
        val writeFd = pipes[1]

        Thread {
                    try {
                        val writer =
                                ParcelFileDescriptor.AutoCloseOutputStream(writeFd).bufferedWriter()
                        val process = Runtime.getRuntime().exec(command)
                        var line: String?

                        val inputReader = process.inputStream.bufferedReader()
                        while (inputReader.readLine().also { line = it } != null) {
                            writer.write(line)
                            writer.newLine()
                            writer.flush()
                        }

                        val errorReader = process.errorStream.bufferedReader()
                        while (errorReader.readLine().also { line = it } != null) {
                            writer.write(line)
                            writer.newLine()
                            writer.flush()
                        }

                        process.waitFor()
                        inputReader.close()
                        errorReader.close()
                        writer.close()
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
