package com.runningservices.running_services_monitor

import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import rikka.shizuku.Shizuku
import java.io.BufferedReader
import java.io.InputStreamReader

class MainActivity : FlutterActivity(), Shizuku.OnRequestPermissionResultListener {
    private val CHANNEL = "com.runningservices/shizuku"
    private val SHIZUKU_PERMISSION_REQUEST_CODE = 1001
    private var pendingPermissionResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Register permission listener
        Shizuku.addRequestPermissionResultListener(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "runCommand" -> {
                    val command = call.argument<String>("command")
                    if (command != null) {
                        runCommandInBackground(command, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Command cannot be null", null)
                    }
                }
                "pingBinder" -> {
                    try {
                        result.success(Shizuku.pingBinder())
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "checkPermission" -> {
                    try {
                        if (Shizuku.isPreV11()) {
                            result.success(false) // Not supported pre-v11 for this check usually
                        } else {
                            result.success(Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED)
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
                            // User denied before, maybe show explanation? For now just request.
                            pendingPermissionResult = result
                            Shizuku.requestPermission(SHIZUKU_PERMISSION_REQUEST_CODE)
                        } else {
                            pendingPermissionResult = result
                            Shizuku.requestPermission(SHIZUKU_PERMISSION_REQUEST_CODE)
                        }
                    } catch (e: Exception) {
                        result.error("PERMISSION_ERROR", e.message, null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        Shizuku.removeRequestPermissionResultListener(this)
    }

    override fun onRequestPermissionResult(requestCode: Int, grantResult: Int) {
        if (requestCode == SHIZUKU_PERMISSION_REQUEST_CODE) {
            val granted = grantResult == PackageManager.PERMISSION_GRANTED
            pendingPermissionResult?.success(granted)
            pendingPermissionResult = null
        }
    }

    private fun runCommandInBackground(command: String, result: MethodChannel.Result) {
        CoroutineScope(Dispatchers.IO).launch {
            try {
                val output = executeShizukuCommand(command)
                withContext(Dispatchers.Main) {
                    result.success(output)
                }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) {
                    result.error("EXECUTION_ERROR", e.message, null)
                }
            }
        }
    }

    private fun executeShizukuCommand(command: String): String {
        if (!Shizuku.pingBinder()) {
            throw Exception("Shizuku is not running")
        }

        val process = Shizuku.newProcess(arrayOf("sh", "-c", command), null, null)
        val reader = BufferedReader(InputStreamReader(process.inputStream))
        val output = StringBuilder()
        var line: String?

        while (reader.readLine().also { line = it } != null) {
            output.append(line).append("\n")
        }

        process.waitFor()
        return output.toString()
    }
}
