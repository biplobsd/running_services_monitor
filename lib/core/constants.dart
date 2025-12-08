/// Application-wide constants
class AppConstants {
  AppConstants._();

  // Shizuku related constants
  static const String shizukuPackageName = 'moe.shizuku.privileged.api';
  static const String shizukuPlayStoreUrl = 'https://play.google.com/store/apps/details?id=$shizukuPackageName';
  static const String shizukuChannelName = 'com.runningservices/shizuku';
  static const String shizukuStreamChannelName = 'com.runningservices/shizuku_stream';

  // Android system commands
  static const String cmdDumpsysActivityServices = 'dumpsys activity services';
  static const String cmdDumpsysActivityLru = 'dumpsys activity lru';
  static const String cmdDumpsysMeminfo = 'dumpsys meminfo';
  static const String cmdMethodRunCommand = 'runCommand';

  // Developer info
  static const String developerName = 'Biplob Kumar Sutradhar';
  static const String developerEmail = 'biplobsd11@gmail.com';

  // App URLs
  static const String sourceCodeUrl = 'https://github.com/biplobsd/running_services_monitor';
  static const String blogsUrl = 'https://biplobsd.github.io';
  static const String buyMeCoffeeUrl = 'https://buymeacoffee.com/biplobsd';
}
