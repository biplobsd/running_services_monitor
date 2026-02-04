import 'dart:ui';
import 'package:running_services_monitor/models/lang.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Running Services Monitor';

  static const String shizukuPackageName = 'moe.shizuku.privileged.api';
  static const String shizukuPlayStoreUrl = 'https://play.google.com/store/apps/details?id=$shizukuPackageName';

  static const String cmdDumpsysActivityServices = 'dumpsys -t 120 activity services';
  static const String cmdDumpsysActivityLru = 'dumpsys -t 120 activity lru';
  static const String cmdDumpsysMeminfo = 'dumpsys -t 120 meminfo';

  static const String developerEmail = 'biplobsd11@gmail.com';

  static const String sourceCodeUrl = 'https://github.com/biplobsd/running_services_monitor';
  static const String buyMeCoffeeUrl = 'https://buymeacoffee.com/biplobsd';

  static const List<Lang> languages = [Lang(Locale('en'), 'English'), Lang(Locale('bn'), 'বাংলা'), Lang(Locale('zh'), '简体中文')];
}
