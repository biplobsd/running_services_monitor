import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/services/shizuku_api.g.dart',
    kotlinOut: 'android/app/src/main/kotlin/me/biplobsd/rsm/ShizukuApi.kt',
    kotlinOptions: KotlinOptions(package: 'me.biplobsd.rsm'),
  ),
)
class CommandRequest {
  CommandRequest({required this.command, this.mode});
  String command;
  String? mode;
}

class CommandResult {
  CommandResult({this.exitCode, this.output, this.error});
  int? exitCode;
  String? output;
  String? error;
}

class AppInfoData {
  AppInfoData({required this.packageName, required this.appName, this.icon, required this.isSystemApp});
  String packageName;
  String appName;
  Uint8List? icon;
  bool isSystemApp;
}

class InstalledAppsResult {
  InstalledAppsResult({required this.apps});
  List<AppInfoData> apps;
}

@HostApi()
abstract class ShizukuHostApi {
  @async
  CommandResult runCommand(CommandRequest request);

  bool pingBinder();

  @async
  bool checkRootPermission();

  @async
  bool requestRootPermission();

  bool checkPermission();

  @async
  bool requestPermission();

  void setStreamCommand(String command, String? mode);

  void startAppInfoStream(String? mode);

  @async
  AppInfoData? getAppInfo(String packageName, String? mode);

  String getAppVersion();
}

@EventChannelApi()
abstract class ShizukuStreamApi {
  String streamOutput();
  AppInfoData appInfoOutput();
}
