// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '运行服务监控器';

  @override
  String get enjoyingApp => '喜欢这款应用吗？考虑给我买杯咖啡吧！';

  @override
  String get donate => '捐赠';

  @override
  String get searchApps => '搜索应用...';

  @override
  String get all => '全部';

  @override
  String get user => '用户';

  @override
  String get system => '系统';

  @override
  String get closeSearch => '关闭搜索';

  @override
  String get search => '搜索';

  @override
  String get autoUpdate => '自动更新 (3秒)';

  @override
  String get refresh => '刷新';

  @override
  String get toggleTheme => '切换主题';

  @override
  String get about => '关于';

  @override
  String get loading => '加载中...';

  @override
  String get developer => '开发者';

  @override
  String get email => '电子邮件';

  @override
  String get sourceCode => '源代码';

  @override
  String get blogs => '博客';

  @override
  String get buyMeCoffee => '给我点杯咖啡';

  @override
  String get madeInBangladesh => '孟加拉制造';

  @override
  String get runningApp => '正在运行的应用';

  @override
  String get stopWarning => '此应用无法安全停止。如果强制停止，您可能会丢失部分当前正在运行的工作。';

  @override
  String get activeServices => '活动中的服务';

  @override
  String get shizukuRequired => '需要 Shizuku';

  @override
  String get shizukuRequiredMessage => '此应用需要 Shizuku 权限来访问正在运行的服务信息。';

  @override
  String get setupSteps => '设置步骤：';

  @override
  String get step1 => '从 Play 商店或 GitHub 安装 Shizuku 应用';

  @override
  String get step2 => '打开 Shizuku 并启动服务';

  @override
  String get step3 => '对于 Android 11+：使用无线调试';

  @override
  String get step4 => '对于 Android 10 及以下：通过 ADB 连接电脑';

  @override
  String get step5 => '返回此应用并重试';

  @override
  String get quickStart => '快速启动 (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. 启用开发者选项\n2. 启用无线调试\n3. 打开 Shizuku 并点击“配对”\n4. 按照屏幕提示操作';

  @override
  String get exitApp => '退出应用';

  @override
  String get retry => '重试';

  @override
  String get loadingServices => '加载服务中...';

  @override
  String get deviceMemory => '设备内存';

  @override
  String get noMatchingApps => '没有匹配的应用';

  @override
  String get noAppsFound => '未找到应用';

  @override
  String get ofRam => '内存';

  @override
  String get processAnd => '进程和';

  @override
  String get services => '服务';

  @override
  String get apps => '应用';

  @override
  String get used => '已用';

  @override
  String get free => '可用';

  @override
  String get stopService => '停止服务';

  @override
  String get stopAllServices => '停止所有服务';

  @override
  String get stopServiceConfirm => '停止此服务？';

  @override
  String get stopAllServicesConfirm => '停止此应用的所有服务？';

  @override
  String get stopServiceWarning => '这将强制停止应用。您可能会丢失未保存的数据。';

  @override
  String get serviceStopped => '服务已停止';

  @override
  String get allServicesStopped => '所有服务已停止';

  @override
  String get stopServiceError => '停止服务失败';

  @override
  String get cancel => '取消';

  @override
  String get stop => '停止';

  @override
  String get permissionRequired => '需要权限';

  @override
  String get permissionRequiredMessage => '需要 Shizuku 权限才能访问正在运行的服务信息。';

  @override
  String get permissionSteps => '如何授予权限：';

  @override
  String get permissionStep1 => '打开 Shizuku 应用';

  @override
  String get permissionStep2 => '前往“已授权应用”或“权限”';

  @override
  String get permissionStep3 => '找到“Running Services Monitor”并授予权限';

  @override
  String get permissionNote => '授予权限前，请确保 Shizuku 服务正在运行。';

  @override
  String get openShizuku => '打开 Shizuku';

  @override
  String get systemAppWarning =>
      '⚠️ 警告：这是**系统应用**。强制停止可能会导致您的设备出现故障或不稳定。请仅在您知道自己在做什么的情况下继续！';

  @override
  String get runningServicesTitle => '系统运行服务';

  @override
  String get openRunningServicesTooltip => '在安卓设置中打开运行服务';

  @override
  String get error => '错误';

  @override
  String get appInfoNotFound => '未找到应用信息';

  @override
  String pageNotFound(String location) {
    return '未找到页面：$location';
  }

  @override
  String get package => '包名';

  @override
  String get service => '服务';

  @override
  String get process => '进程';

  @override
  String get pid => '进程ID (PID)';

  @override
  String get uid => '用户ID (UID)';

  @override
  String get ramUsage => '内存占用';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => '前台';

  @override
  String get foregroundId => '前台ID';

  @override
  String get startRequested => '已请求启动';

  @override
  String get createdFromFg => '从前台创建';

  @override
  String get createTime => '创建时间';

  @override
  String get lastActivity => '最后活动时间';

  @override
  String get baseDir => '基础目录';

  @override
  String get dataDir => '数据目录';

  @override
  String get type => '类型';

  @override
  String get systemApp => '系统应用';

  @override
  String get userApp => '用户应用';

  @override
  String get rawOutput => 'Raw 输出';

  @override
  String get close => '关闭';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get connections => '连接';

  @override
  String get flags => '标志';

  @override
  String get visible => '可见';

  @override
  String get capabilities => '能力';

  @override
  String get active => '活动';

  @override
  String get cached => '缓存';

  @override
  String get noServicesFound => '未找到服务';

  @override
  String get ramCalculation => '内存计算';

  @override
  String get totalRam => '总内存';

  @override
  String get ramSources => '来源';

  @override
  String get noRamDataAvailable => '在系统内存报告中，此应用没有可用的内存数据。';

  @override
  String get ramCalculationExplanation =>
      '内存数据来自系统内存信息。PID = 进程ID查找，Process = 进程名称查找，LRU = 最近进程列表。';

  @override
  String get verifyCommand => '验证命令';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get copy => '复制';

  @override
  String get and => '和';

  @override
  String service_string(int count) {
    return '$count个服务';
  }

  @override
  String process_string(int count) {
    return '$count个进程';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    return '$processCount个进程和$serviceCount个服务';
  }

  @override
  String get info => '信息';

  @override
  String get followSystem => '跟随系统';
}
