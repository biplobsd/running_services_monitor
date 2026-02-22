// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '実行中サービスモニター';

  @override
  String get enjoyingApp => 'アプリを楽しんでいますか？コーヒーをおごってください！';

  @override
  String get donate => '寄付';

  @override
  String get searchApps => 'アプリを検索...';

  @override
  String get all => 'すべて';

  @override
  String get user => 'ユーザー';

  @override
  String get system => 'システム';

  @override
  String get closeSearch => '検索を閉じる';

  @override
  String get search => '検索';

  @override
  String get autoUpdate => '自動更新 (3秒)';

  @override
  String get refresh => '更新';

  @override
  String get toggleTheme => 'テーマ切替';

  @override
  String get about => 'アプリについて';

  @override
  String get loading => '読み込み中...';

  @override
  String get developer => '開発者';

  @override
  String get email => 'メール';

  @override
  String get sourceCode => 'ソースコード';

  @override
  String get blogs => 'ブログ';

  @override
  String get buyMeCoffee => 'コーヒーをおごる';

  @override
  String get madeInBangladesh => 'バングラデシュ製';

  @override
  String get runningApp => '実行中のアプリ';

  @override
  String get stopWarning => 'このアプリは安全に停止できません。停止すると、現在の作業が失われる場合があります。';

  @override
  String get activeServices => 'アクティブなサービス';

  @override
  String get shizukuRequired => 'Shizukuが必要です';

  @override
  String get shizukuRequiredMessage => '実行中のサービス情報にアクセスするにはShizukuが必要です。';

  @override
  String get setupSteps => 'セットアップ手順：';

  @override
  String get step1 => 'Play StoreまたはGitHubからShizukuアプリをインストール';

  @override
  String get step2 => 'Shizukuを開いてサービスを開始';

  @override
  String get step3 => 'Android 11以上：ワイヤレスデバッグを使用';

  @override
  String get step4 => 'Android 10以下：ADB経由でPCに接続';

  @override
  String get step5 => 'このアプリに戻って再試行';

  @override
  String get quickStart => 'クイックスタート (Android 11以上)';

  @override
  String get quickStartSteps =>
      '1. 開発者オプションを有効化\n2. ワイヤレスデバッグを有効化\n3. Shizukuを開いて「ペアリング」をタップ\n4. 画面の指示に従う';

  @override
  String get exitApp => '終了';

  @override
  String get retry => '再試行';

  @override
  String get loadingServices => 'サービスを読み込み中...';

  @override
  String get deviceMemory => 'デバイスメモリ';

  @override
  String get noMatchingApps => '一致するアプリがありません';

  @override
  String get noAppsFound => 'アプリが見つかりません';

  @override
  String get ofRam => 'のRAM';

  @override
  String get processAnd => 'プロセスと';

  @override
  String get services => 'サービス';

  @override
  String get apps => 'アプリ';

  @override
  String get used => '使用済み';

  @override
  String get free => '空き';

  @override
  String get stopService => 'サービスを停止';

  @override
  String get stopAllServices => 'すべてのサービスを停止';

  @override
  String get stopServiceConfirm => 'このサービスを停止しますか？';

  @override
  String get stopAllServicesConfirm => 'このアプリのすべてのサービスを停止しますか？';

  @override
  String get stopServiceWarning => 'アプリが強制停止されます。未保存のデータが失われる場合があります。';

  @override
  String get serviceStopped => 'サービスが停止しました';

  @override
  String get allServicesStopped => 'すべてのサービスが停止しました';

  @override
  String get stopServiceError => 'サービスの停止に失敗しました';

  @override
  String get cancel => 'キャンセル';

  @override
  String get stop => '停止';

  @override
  String get permissionRequired => '権限が必要です';

  @override
  String get permissionRequiredMessage => '実行中のサービス情報にアクセスするにはShizukuの権限が必要です。';

  @override
  String get permissionSteps => '権限の付与方法：';

  @override
  String get permissionStep1 => 'Shizukuアプリを開く';

  @override
  String get permissionStep2 => '「認証済みアプリ」または「権限」に移動';

  @override
  String get permissionStep3 => '「実行中サービスモニター」を見つけて権限を付与';

  @override
  String get permissionNote => '権限を付与する前にShizukuサービスが実行中であることを確認してください。';

  @override
  String get openShizuku => 'Shizukuを開く';

  @override
  String get systemAppWarning =>
      '⚠️ 警告：これはシステムアプリです。停止するとデバイスが正常に動作しなくなる可能性があります。自己責任で実行してください！';

  @override
  String get runningServicesTitle => 'システム実行中サービス';

  @override
  String get openRunningServicesTooltip => 'Android設定で実行中のサービスを開く';

  @override
  String get error => 'エラー';

  @override
  String get appInfoNotFound => 'アプリ情報が見つかりません';

  @override
  String pageNotFound(String location) {
    return 'ページが見つかりません: $location';
  }

  @override
  String get package => 'パッケージ';

  @override
  String get service => 'サービス';

  @override
  String get process => 'プロセス';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'RAM使用量';

  @override
  String get intent => 'インテント';

  @override
  String get foreground => 'フォアグラウンド';

  @override
  String get foregroundId => 'フォアグラウンドID';

  @override
  String get startRequested => '開始リクエスト';

  @override
  String get createdFromFg => 'FGから作成';

  @override
  String get createTime => '作成時刻';

  @override
  String get lastActivity => '最終アクティビティ';

  @override
  String get baseDir => 'ベースディレクトリ';

  @override
  String get dataDir => 'データディレクトリ';

  @override
  String get type => 'タイプ';

  @override
  String get systemApp => 'システムアプリ';

  @override
  String get userApp => 'ユーザーアプリ';

  @override
  String get rawOutput => '生の出力';

  @override
  String get close => '閉じる';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get connections => '接続';

  @override
  String get flags => 'フラグ';

  @override
  String get bound => 'バインド済み';

  @override
  String get processRecord => 'プロセスレコード';

  @override
  String get visible => '可視';

  @override
  String get capabilities => '機能';

  @override
  String get active => 'アクティブ';

  @override
  String get cached => 'キャッシュ済み';

  @override
  String get noServicesFound => 'サービスが見つかりません';

  @override
  String get ramCalculation => 'RAM計算';

  @override
  String get totalRam => '合計RAM';

  @override
  String get ramSources => 'ソース';

  @override
  String get noRamDataAvailable => 'システムメモリレポートにこのアプリのRAMデータがありません。';

  @override
  String get ramCalculationExplanation =>
      'RAMはシステムメモリ情報から計算されます。PID = プロセスID検索、Process = プロセス名検索、LRU = 最近のプロセスリスト。';

  @override
  String get playCommand => 'コマンドを実行';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get copy => 'コピー';

  @override
  String get and => 'と';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countサービス',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countプロセス',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCountプロセス',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCountサービス',
    );
    return '$_temp0と$_temp1';
  }

  @override
  String get info => '情報';

  @override
  String get followSystem => 'システム';

  @override
  String get contributors => '貢献者';

  @override
  String contributionsCount(Object count) {
    return '$count件の貢献';
  }

  @override
  String get checkingPermissions => '権限を確認中...';

  @override
  String get shizukuNotRunning => 'Shizukuが実行されていません。Shizukuアプリを起動してください。';

  @override
  String get permissionDeniedShizuku => '権限が拒否されました。Shizukuの権限を付与してください。';

  @override
  String get failedToInitialize => '初期化に失敗しました。権限を付与してください。';

  @override
  String get errorInitializingShizuku => 'Shizukuの初期化エラー';

  @override
  String get loadingApps => 'アプリを読み込み中...';

  @override
  String get refreshedSuccessfully => '正常に更新されました';

  @override
  String get errorLoadingData => 'データの読み込みエラー';

  @override
  String get failedToStopAllServices => 'すべてのサービスの停止に失敗しました';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'サービス$serviceNameの停止に失敗しました';
  }

  @override
  String errorPrefix(String error) {
    return 'エラー: $error';
  }

  @override
  String get language => '言語';

  @override
  String get openGithubProfile => 'GitHubプロフィールを開く';

  @override
  String get appInfoTooltip => 'アプリ情報';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => '最近の呼び出しUID';

  @override
  String get appDetails => 'アプリの詳細';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'プロセス状態';

  @override
  String get processStateFg => 'フォアグラウンド — アプリが前面で実行中';

  @override
  String get processStateVis => '可視 — アプリは表示されているが前面ではない';

  @override
  String get processStatePrev => '前回 — 以前使用されたフォアグラウンドアプリ';

  @override
  String get processStatePrcp => '知覚可能 — ユーザーが認識できる処理を実行中';

  @override
  String get processStateSvcb => 'サービスB — バインドされたサービスを持つアプリ';

  @override
  String get processStateHome => 'ホーム — ホーム/ランチャーアプリ';

  @override
  String get processStateHvy => 'ヘビーウェイト — 重量級アプリプロセス';

  @override
  String get processStatePsvc => '永続サービス — 永続サービスを持つアプリ';

  @override
  String get processStatePers => '永続 — システム永続プロセス';

  @override
  String get processStateCchEmpty => 'キャッシュ（空） — アクティビティなしのキャッシュプロセス';

  @override
  String get processStateCchAct => 'キャッシュ（アクティビティ） — アクティビティありのキャッシュプロセス';

  @override
  String get processStateCchClient => 'キャッシュ（クライアント） — サービスクライアントとしてのキャッシュプロセス';

  @override
  String get processStateCch => 'キャッシュ済み — メモリにキャッシュされたプロセス';

  @override
  String get processStateBfgs => 'バインドFGサービス — フォアグラウンドサービスにバインド';

  @override
  String get processStateRcvr => 'レシーバー — ブロードキャストレシーバーを実行中';

  @override
  String get processStateTop => 'トップ — アクティビティスタックの最上位';

  @override
  String get processStateBtop => 'バインドトップ — トップアプリにバインド';

  @override
  String get processStateImpf => '重要FG — 重要なフォアグラウンドプロセス';

  @override
  String get processStateImpb => '重要BG — 重要なバックグラウンドプロセス';

  @override
  String processStateUnknown(String state) {
    return 'プロセス状態: $state';
  }

  @override
  String get workingMode => '動作モード';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => '動作モードを選択';

  @override
  String get available => '利用可能';

  @override
  String get notAvailable => '利用不可';

  @override
  String get modeNotAvailable => 'このモードは利用できません';

  @override
  String get noModeAvailable => '利用可能な権限モードがありません';

  @override
  String get commandLogs => 'コマンドログ';

  @override
  String get commandOutput => 'コマンド出力';

  @override
  String get noCommandLogs => 'まだコマンドが実行されていません';

  @override
  String get clearLogs => 'ログを消去';

  @override
  String get clearLogsConfirm => 'すべてのコマンドログを消去しますか？';

  @override
  String get executedAt => '実行時刻';

  @override
  String get command => 'コマンド';

  @override
  String get noOutput => '出力なし';

  @override
  String get executeCommand => '実行';

  @override
  String get processes => 'プロセス';

  @override
  String get processesDescription => 'メモリ情報からのこのアプリのすべての実行中プロセス。';

  @override
  String get noProcessesFound => 'プロセスが見つかりません';

  @override
  String get usedBreakdown => '使用済みの内訳';

  @override
  String get freeBreakdown => '空きの内訳';

  @override
  String get other => 'その他';

  @override
  String get usedPss => '使用済みPSS';

  @override
  String get kernel => 'カーネル';

  @override
  String get cachedPss => 'キャッシュPSS';

  @override
  String get cachedKernel => 'キャッシュカーネル';

  @override
  String get actualFree => '実際の空き';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'ロストRAM';

  @override
  String get zramPhysical => 'ZRAM物理';

  @override
  String get zramSwapUsed => 'ZRAMスワップ使用量';

  @override
  String get zramTotalSwap => 'ZRAM合計スワップ';

  @override
  String get oomThreshold => 'OOMしきい値';

  @override
  String get restoreLimit => '復元制限';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'メモリしきい値';

  @override
  String get boundServiceCannotStop =>
      'このサービスは別のプロセスにバインドされており、直接停止できません。アプリ全体を停止することができます。';

  @override
  String get memoryInfo => 'メモリ情報';

  @override
  String get viewRawOutput => '生データを表示';

  @override
  String get hideRawOutput => '生データを非表示';

  @override
  String get compareWithOther => '比較';

  @override
  String get memoryCategories => 'メモリカテゴリ';

  @override
  String get appSummary => 'アプリサマリー';

  @override
  String get objects => 'オブジェクト';

  @override
  String get memoryComparison => 'メモリ比較';

  @override
  String get selectAppToCompare => '比較するアプリを選択';

  @override
  String get selectApp => 'アプリを選択...';

  @override
  String get totalPss => '合計PSS';

  @override
  String get totalRss => '合計RSS';

  @override
  String get javaHeap => 'Javaヒープ';

  @override
  String get nativeHeap => 'ネイティブヒープ';

  @override
  String get code => 'コード';

  @override
  String get graphics => 'グラフィックス';

  @override
  String get current => '現在';

  @override
  String get allApps => 'すべて';

  @override
  String get userApps => 'ユーザー';

  @override
  String get systemApps => 'システム';

  @override
  String get compareWith => '比較対象';

  @override
  String get stats => '統計';

  @override
  String get statsLiveRamArea => 'リアルタイムシステムRAM';

  @override
  String get statsLiveRamAreaSubtitle => '時間経過のRAM使用量';

  @override
  String get statsRamDistribution => 'システムRAM分布';

  @override
  String statsRamDistributionTotal(String size) {
    return '合計: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'ユーザーアプリ vs システムアプリ RAM';

  @override
  String get statsAppStateDistribution => 'アプリ状態の分布';

  @override
  String get statsActive => 'アクティブ';

  @override
  String get statsBackground => 'バックグラウンド';

  @override
  String get statsCached => 'キャッシュ済み';

  @override
  String statsAppsCount(int count) {
    return '$countアプリ';
  }

  @override
  String get statsSystemVsUserAnalysis => 'システム vs ユーザー分析';

  @override
  String get statsAppCount => 'アプリ数';

  @override
  String get statsTotalRam => '合計RAM';

  @override
  String get statsPerformance => 'パフォーマンス';

  @override
  String get statsRamDistributionScatter => 'RAM分布散布図';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: アプリインデックス';

  @override
  String get statsTopRamConsumers => 'RAM消費量トップ';

  @override
  String get statsServicesVsRamCorrelation => 'サービス vs RAM相関';

  @override
  String get statsServicesVsRamSubtitle => 'Y: RAM, X: サービス数, バブル: プロセス数';

  @override
  String get statsRamHistogram => 'RAM頻度ヒストグラム';

  @override
  String get statsRamHistogramSubtitle => 'メモリサイズ別アプリ数';

  @override
  String get statsMemoryHeatmap => 'メモリヒートマップ';

  @override
  String get statsMemoryHeatmapSubtitle => 'RAM強度順の全アプリ';

  @override
  String get statsTopAppsRelativeImpact => 'トップアプリの相対的影響';

  @override
  String get statsGanttSubtitle => 'ガントスタイルのRAMシェア可視化';

  @override
  String get statsStackedAreaChart => 'RAM内訳の時系列';

  @override
  String get statsStackedAreaSubtitle => 'ユーザー、システム、カーネルRAM';

  @override
  String get statsPolarChart => 'プロセス状態の分布';

  @override
  String get statsPolarSubtitle => 'アプリ状態のポーラービュー';

  @override
  String get statsTreemap => 'RAM分布ツリーマップ';

  @override
  String get statsTreemapSubtitle => 'アプリ別の比例RAM使用量';

  @override
  String get statsFunnelChart => 'RAM使用量ティア';

  @override
  String get statsFunnelSubtitle => 'メモリサイズ別にグループ化されたアプリ';

  @override
  String get statsWaterfallChart => 'RAM割り当てウォーターフォール';

  @override
  String get statsWaterfallSubtitle => '合計からコンポーネントへの内訳';

  @override
  String get statsGaugeChart => 'RAM使用量ゲージ';

  @override
  String get statsGaugeSubtitle => 'システム全体のメモリ使用率';

  @override
  String get statsTiny => '極小';

  @override
  String get statsSmall => '小';

  @override
  String get statsMedium => '中';

  @override
  String get statsLarge => '大';

  @override
  String get statsHuge => '巨大';

  @override
  String get statsNoData => 'データなし';

  @override
  String get statsWaitingForData => 'データを待機中...';

  @override
  String get statsRamDistributionPie => 'システムRAM分布';

  @override
  String get statsRamDistributionSubtitle => '使用済み、空き、ZRAM';

  @override
  String get statsUsed => '使用済み';

  @override
  String get statsFree => '空き';

  @override
  String get statsUserVsSystemPie => 'ユーザー vs システムアプリ RAM';

  @override
  String get statsUserVsSystemSubtitle => 'ユーザーアプリとシステムアプリのメモリ比較';

  @override
  String get statsProcessStateBar => 'アプリ状態の分布';

  @override
  String get statsProcessStateSubtitle => 'アクティブ、バックグラウンド、キャッシュ済みアプリ';

  @override
  String get statsScatterChart => 'RAM分布散布図';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: アプリインデックス';

  @override
  String get core => 'コア';

  @override
  String get coreAppInfoLimited => 'システムプロセスの情報は制限されています';

  @override
  String get showCoreApps => 'コアアプリを表示';

  @override
  String get usefulCommands => '便利なコマンド';

  @override
  String get commands => 'コマンド';

  @override
  String get addCommand => 'コマンドを追加';

  @override
  String get placeholders => 'プレースホルダー';

  @override
  String get commandTitle => 'タイトル';

  @override
  String get commandDescription => '説明';

  @override
  String get reExecute => '再実行';

  @override
  String get statsProcessVsRamLine => 'プロセス vs RAM相関';

  @override
  String get statsProcessVsRamLineSubtitle => '青: RAM, 破線: プロセス数';

  @override
  String get statsUserVsSystemBar => 'ユーザー vs システム比較';

  @override
  String get statsUserVsSystemBarSubtitle => 'アプリ数、合計RAM、平均RAM';

  @override
  String get statsRamTrendScatter => 'RAMトレンド分析';

  @override
  String get statsRamTrendScatterSubtitle => 'サービス vs RAMとトレンドライン';

  @override
  String get statsServicesVsProcesses => 'サービス vs プロセス';

  @override
  String get statsServicesVsProcessesSubtitle => 'サービス数とプロセス数の相関';

  @override
  String get statsProcessStateRam => 'プロセス状態別RAM';

  @override
  String get statsProcessStateRamSubtitle => 'プロセス状態別の平均RAM使用量';

  @override
  String get myCommands => 'マイコマンド';

  @override
  String get defaultCommands => 'デフォルトコマンド';

  @override
  String get resetDefaults => 'デフォルトに戻す';

  @override
  String get memoryDistribution => 'メモリ分布';

  @override
  String get memoryProfileComparison => 'メモリプロファイルの比較';

  @override
  String get stack => 'スタック';

  @override
  String get privateOther => 'プライベートその他';

  @override
  String get unknown => '不明';

  @override
  String totalPssLabel(String size) {
    return '合計PSS: $size';
  }
}
