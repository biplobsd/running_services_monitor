package me.biplobsd.rsm

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.BitmapDrawable
import android.util.Base64
import java.io.ByteArrayOutputStream

object AppUtils {

    fun getAppLabel(context: Context?, appInfo: ApplicationInfo, packageName: String): String {
        return try {
            context?.packageManager?.getApplicationLabel(appInfo)?.toString()?.takeIf {
                it.isNotBlank()
            }
                    ?: appInfo.nonLocalizedLabel?.toString()?.takeIf { it.isNotBlank() }
                            ?: packageName.substringAfterLast(".")
        } catch (e: Exception) {
            packageName.substringAfterLast(".")
        }
    }

    fun getAppIconBytes(pm: PackageManager, appInfo: ApplicationInfo): ByteArray? {
        return try {
            val drawable = appInfo.loadIcon(pm)
            val bitmap =
                    if (drawable is BitmapDrawable) {
                        drawable.bitmap
                    } else {
                        val width = if (drawable.intrinsicWidth > 0) drawable.intrinsicWidth else 96
                        val height =
                                if (drawable.intrinsicHeight > 0) drawable.intrinsicHeight else 96
                        val bmp = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
                        val canvas = Canvas(bmp)
                        drawable.setBounds(0, 0, canvas.width, canvas.height)
                        drawable.draw(canvas)
                        bmp
                    }
            val stream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
            stream.toByteArray()
        } catch (e: Exception) {
            null
        }
    }

    fun getAppIconBase64(pm: PackageManager, appInfo: ApplicationInfo): String? {
        val bytes = getAppIconBytes(pm, appInfo)
        return bytes?.let { Base64.encodeToString(it, Base64.NO_WRAP) }
    }
}
