package me.biplobsd.rsm

import java.io.InputStream

object ShellExecutor {

    fun InputStream.readAsString(): String = bufferedReader().use { it.readText() }

    fun executeShellCommand(command: String): ShellResult {
        val process = Runtime.getRuntime().exec(arrayOf("sh", "-c", command))
        val output = process.inputStream.readAsString()
        val errorOutput = process.errorStream.readAsString()
        val exitCode = process.waitFor()
        return ShellResult(exitCode, output + errorOutput)
    }

    fun executeRootCommand(command: String): ShellResult {
        val process = Runtime.getRuntime().exec(arrayOf("su", "-c", command))
        val output = process.inputStream.readAsString()
        val errorOutput = process.errorStream.readAsString()
        val exitCode = process.waitFor()
        return ShellResult(exitCode, output + errorOutput)
    }

    fun getInstalledPackages(executeCommand: (String) -> ShellResult): List<AppInfoResult> {
        return try {
            val systemPackages = mutableSetOf<String>()
            val systemResult = executeCommand("pm list packages -s")
            if (systemResult.exitCode == 0) {
                systemResult.output.lines()
                    .filter { it.startsWith("package:") }
                    .forEach { systemPackages.add(it.removePrefix("package:").trim()) }
            }

            val listResult = executeCommand("pm list packages")
            if (listResult.exitCode != 0) return emptyList()

            listResult.output.lines()
                .filter { it.startsWith("package:") }
                .mapNotNull { line ->
                    try {
                        val packageName = line.removePrefix("package:").trim()
                        if (packageName.isNotEmpty()) {
                            val isSystemApp = systemPackages.contains(packageName)
                            AppInfoResult(packageName, packageName.substringAfterLast("."), null, isSystemApp)
                        } else null
                    } catch (e: Exception) {
                        null
                    }
                }
        } catch (e: Exception) {
            e.printStackTrace()
            emptyList()
        }
    }

    fun getPackageInfo(packageName: String, executeCommand: (String) -> ShellResult): AppInfoResult? {
        return try {
            val result = executeCommand("pm list packages -s | grep -w 'package:$packageName'")
            val isSystemApp = result.exitCode == 0 && result.output.contains(packageName)
            AppInfoResult(packageName, packageName.substringAfterLast("."), null, isSystemApp)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
}
