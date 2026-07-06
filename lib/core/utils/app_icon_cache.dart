import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class AppIconCache {
  static String? cacheDirPath;

  static Future<void> initialize() async {
    final docDir = await getApplicationSupportDirectory();
    final cacheDir = Directory('${docDir.path}/app_icons');
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
    cacheDirPath = cacheDir.path;
  }

  static String getIconPath(String packageName) {
    return '$cacheDirPath/$packageName.png';
  }

  static File getIconFile(String packageName) {
    return File(getIconPath(packageName));
  }

  static Future<void> saveIcon(String packageName, Uint8List bytes) async {
    if (cacheDirPath == null) return;
    final file = getIconFile(packageName);
    await file.writeAsBytes(bytes, flush: true);
  }
}
