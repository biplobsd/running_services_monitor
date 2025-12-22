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
  String get playCommand => '执行命令';

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

  @override
  String get contributors => '贡献者';

  @override
  String contributionsCount(Object count) {
    return '$count 次贡献';
  }

  @override
  String get checkingPermissions => '正在检查权限...';

  @override
  String get shizukuNotRunning => 'Shizuku 未运行。请启动 Shizuku 应用。';

  @override
  String get permissionDeniedShizuku => '权限被拒绝。请授予 Shizuku 权限。';

  @override
  String get failedToInitialize => '初始化失败。请授予权限。';

  @override
  String get errorInitializingShizuku => '初始化 Shizuku 时出错';

  @override
  String get loadingApps => '正在加载应用...';

  @override
  String get refreshedSuccessfully => '刷新成功';

  @override
  String get errorLoadingData => '加载数据时出错';

  @override
  String get failedToStopAllServices => '停止所有服务失败';

  @override
  String failedToStopServiceName(String serviceName) {
    return '停止服务 $serviceName 失败';
  }

  @override
  String errorPrefix(String error) {
    return '错误: $error';
  }

  @override
  String get language => '语言';

  @override
  String get openGithubProfile => '打开 GitHub 个人资料';

  @override
  String get appInfoTooltip => '应用信息';

  @override
  String get ok => '确定';

  @override
  String get recentCallingUid => '最近调用的 UID';

  @override
  String get appDetails => '应用详情';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => '进程状态';

  @override
  String get processStateFg => '前台 - 应用当前在前台运行';

  @override
  String get processStateVis => '可见 - 应用有可见的活动但不在前台';

  @override
  String get processStatePrev => '上一个 - 之前使用的前台应用';

  @override
  String get processStatePrcp => '可感知 - 应用正在执行用户可感知的操作';

  @override
  String get processStateSvcb => '绑定服务 - 应用有绑定服务';

  @override
  String get processStateHome => '主页 - 主屏幕/启动器应用';

  @override
  String get processStateHvy => '重量级 - 重量级应用进程';

  @override
  String get processStatePsvc => '持久服务 - 应用有持久服务';

  @override
  String get processStatePers => '持久 - 系统持久进程';

  @override
  String get processStateCchEmpty => '空缓存 - 没有活动的缓存进程';

  @override
  String get processStateCchAct => '活动缓存 - 有活动的缓存进程';

  @override
  String get processStateCchClient => '客户端缓存 - 作为服务客户端的缓存进程';

  @override
  String get processStateCch => '缓存 - 进程已缓存在内存中';

  @override
  String get processStateBfgs => '绑定前台服务 - 绑定到前台服务';

  @override
  String get processStateRcvr => '接收器 - 应用正在运行广播接收器';

  @override
  String get processStateTop => '顶部 - 应用在活动栈顶部';

  @override
  String get processStateBtop => '绑定顶部 - 绑定到顶部应用';

  @override
  String get processStateImpf => '重要前台 - 重要的前台进程';

  @override
  String get processStateImpb => '重要后台 - 重要的后台进程';

  @override
  String processStateUnknown(String state) {
    return '进程状态: $state';
  }

  @override
  String get workingMode => '工作模式';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => '选择工作模式';

  @override
  String get available => '可用';

  @override
  String get notAvailable => '不可用';

  @override
  String get modeNotAvailable => '此模式不可用';

  @override
  String get noModeAvailable => '没有可用的权限模式';

  @override
  String get commandLogs => '命令日志';

  @override
  String get commandOutput => '命令输出';

  @override
  String get noCommandLogs => '尚未执行任何命令';

  @override
  String get clearLogs => '清除日志';

  @override
  String get clearLogsConfirm => '确定要清除所有命令日志吗？';

  @override
  String get executedAt => '执行时间';

  @override
  String get command => '命令';

  @override
  String get noOutput => '无输出';

  @override
  String get executeCommand => '执行';

  @override
  String get processes => '进程';

  @override
  String get processesDescription => '该应用从内存信息中获取的所有运行进程。';

  @override
  String get noProcessesFound => '未找到进程';

  @override
  String get usedBreakdown => '已用内存分解';

  @override
  String get freeBreakdown => '可用内存分解';

  @override
  String get other => '其他';

  @override
  String get usedPss => '已用 PSS';

  @override
  String get kernel => '内核';

  @override
  String get cachedPss => '缓存 PSS';

  @override
  String get cachedKernel => '缓存内核';

  @override
  String get actualFree => '实际可用';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => '丢失内存';

  @override
  String get zramPhysical => 'ZRAM 物理';

  @override
  String get zramSwapUsed => 'ZRAM 交换已用';

  @override
  String get zramTotalSwap => 'ZRAM 总交换';

  @override
  String get oomThreshold => 'OOM 阈值';

  @override
  String get restoreLimit => '恢复限制';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => '内存阈值';

  @override
  String get boundServiceCannotStop => '此服务被另一个进程绑定，无法直接停止。您可以改用停止整个应用。';

  @override
  String get memoryInfo => 'Memory Info';

  @override
  String get viewRawOutput => 'View Raw';

  @override
  String get hideRawOutput => 'Hide Raw';

  @override
  String get compareWithOther => 'Compare';

  @override
  String get memoryCategories => 'Memory Categories';

  @override
  String get appSummary => 'App Summary';

  @override
  String get objects => 'Objects';

  @override
  String get memoryComparison => 'Memory Comparison';

  @override
  String get selectAppToCompare => 'Select an app to compare';

  @override
  String get selectApp => 'Select app...';

  @override
  String get totalPss => 'Total PSS';

  @override
  String get totalRss => 'Total RSS';

  @override
  String get javaHeap => 'Java Heap';

  @override
  String get nativeHeap => 'Native Heap';

  @override
  String get code => 'Code';

  @override
  String get graphics => 'Graphics';

  @override
  String get current => 'Current';

  @override
  String get allApps => 'All';

  @override
  String get userApps => 'User';

  @override
  String get systemApps => 'System';

  @override
  String get compareWith => 'Compare with';

  @override
  String get stats => 'Stats';

  @override
  String get statsLiveRamArea => 'Live System RAM';

  @override
  String get statsLiveRamAreaSubtitle => 'Used RAM over time';

  @override
  String get statsRamDistribution => 'System RAM Distribution';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Total: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'User vs System Apps RAM';

  @override
  String get statsAppStateDistribution => 'App State Distribution';

  @override
  String get statsActive => 'Active';

  @override
  String get statsBackground => 'Background';

  @override
  String get statsCached => 'Cached';

  @override
  String statsAppsCount(int count) {
    return '$count Apps';
  }

  @override
  String get statsSystemVsUserAnalysis => 'System vs User Analysis';

  @override
  String get statsAppCount => 'App Count';

  @override
  String get statsTotalRam => 'Total RAM';

  @override
  String get statsPerformance => 'Performance';

  @override
  String get statsRamDistributionScatter => 'RAM Distribution Scatter';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: App Index';

  @override
  String get statsTopRamConsumers => 'Top RAM Consumers';

  @override
  String get statsServicesVsRamCorrelation => 'Services vs RAM Correlation';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: Service Count, Bubble: Process Count';

  @override
  String get statsRamHistogram => 'RAM Frequency Histogram';

  @override
  String get statsRamHistogramSubtitle => 'Count of Apps by Memory Size';

  @override
  String get statsMemoryHeatmap => 'Memory Heatmap';

  @override
  String get statsMemoryHeatmapSubtitle => 'All Apps Sorted by RAM Intensity';

  @override
  String get statsTopAppsRelativeImpact => 'Top Apps Relative Impact';

  @override
  String get statsGanttSubtitle => 'Gantt-style Visualization of RAM Share';

  @override
  String get statsStackedAreaChart => 'RAM Breakdown Over Time';

  @override
  String get statsStackedAreaSubtitle => 'User, System, and Kernel RAM';

  @override
  String get statsPolarChart => 'Process State Distribution';

  @override
  String get statsPolarSubtitle => 'Polar view of app states';

  @override
  String get statsTreemap => 'RAM Distribution Treemap';

  @override
  String get statsTreemapSubtitle => 'Proportional RAM usage by app';

  @override
  String get statsFunnelChart => 'RAM Usage Tiers';

  @override
  String get statsFunnelSubtitle => 'Apps grouped by memory size';

  @override
  String get statsWaterfallChart => 'RAM Allocation Waterfall';

  @override
  String get statsWaterfallSubtitle => 'Breakdown from total to components';

  @override
  String get statsGaugeChart => 'RAM Usage Gauge';

  @override
  String get statsGaugeSubtitle => 'Overall system memory utilization';

  @override
  String get statsTiny => 'Tiny';

  @override
  String get statsSmall => 'Small';

  @override
  String get statsMedium => 'Medium';

  @override
  String get statsLarge => 'Large';

  @override
  String get statsHuge => 'Huge';

  @override
  String get statsNoData => 'No data available';

  @override
  String get statsWaitingForData => 'Waiting for data...';

  @override
  String get statsRamDistributionPie => 'System RAM Distribution';

  @override
  String get statsRamDistributionSubtitle => 'Used, Free, and ZRAM';

  @override
  String get statsUsed => 'Used';

  @override
  String get statsFree => 'Free';

  @override
  String get statsUserVsSystemPie => 'User vs System Apps RAM';

  @override
  String get statsUserVsSystemSubtitle => 'Compare user and system app memory';

  @override
  String get statsProcessStateBar => 'App State Distribution';

  @override
  String get statsProcessStateSubtitle => 'Active, Background, and Cached apps';

  @override
  String get statsScatterChart => 'RAM Distribution Scatter';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: App Index';

  @override
  String get core => '核心';

  @override
  String get coreAppInfoLimited => '系统进程可用信息有限';

  @override
  String get showCoreApps => '显示核心进程';
}
