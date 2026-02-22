// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Монитор запущенных сервисов';

  @override
  String get enjoyingApp => 'Нравится приложение? Угостите меня кофе!';

  @override
  String get donate => 'Пожертвовать';

  @override
  String get searchApps => 'Поиск приложений...';

  @override
  String get all => 'Все';

  @override
  String get user => 'Пользовательские';

  @override
  String get system => 'Системные';

  @override
  String get closeSearch => 'Закрыть поиск';

  @override
  String get search => 'Поиск';

  @override
  String get autoUpdate => 'Автообновление (3с)';

  @override
  String get refresh => 'Обновить';

  @override
  String get toggleTheme => 'Сменить тему';

  @override
  String get about => 'О приложении';

  @override
  String get loading => 'Загрузка...';

  @override
  String get developer => 'Разработчик';

  @override
  String get email => 'Эл. почта';

  @override
  String get sourceCode => 'Исходный код';

  @override
  String get blogs => 'Блоги';

  @override
  String get buyMeCoffee => 'Купите мне кофе';

  @override
  String get madeInBangladesh => 'Сделано в Бангладеш';

  @override
  String get runningApp => 'Запущенное приложение';

  @override
  String get stopWarning =>
      'Это приложение нельзя безопасно остановить. Если вы остановите его, вы можете потерять текущую работу.';

  @override
  String get activeServices => 'Активные сервисы';

  @override
  String get shizukuRequired => 'Требуется Shizuku';

  @override
  String get shizukuRequiredMessage =>
      'Для доступа к информации о запущенных сервисах требуется Shizuku.';

  @override
  String get setupSteps => 'Шаги настройки:';

  @override
  String get step1 => 'Установите приложение Shizuku из Play Store или GitHub';

  @override
  String get step2 => 'Откройте Shizuku и запустите сервис';

  @override
  String get step3 => 'Для Android 11+: используйте беспроводную отладку';

  @override
  String get step4 => 'Для Android 10 и ниже: подключитесь к ПК через ADB';

  @override
  String get step5 => 'Вернитесь в это приложение и повторите попытку';

  @override
  String get quickStart => 'Быстрый старт (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Включите параметры разработчика\n2. Включите беспроводную отладку\n3. Откройте Shizuku и нажмите \"Сопряжение\"\n4. Следуйте инструкциям на экране';

  @override
  String get exitApp => 'Выйти';

  @override
  String get retry => 'Повторить';

  @override
  String get loadingServices => 'Загрузка сервисов...';

  @override
  String get deviceMemory => 'Память устройства';

  @override
  String get noMatchingApps => 'Нет подходящих приложений';

  @override
  String get noAppsFound => 'Приложения не найдены';

  @override
  String get ofRam => 'ОЗУ';

  @override
  String get processAnd => 'процесс и';

  @override
  String get services => 'Сервисы';

  @override
  String get apps => 'Приложения';

  @override
  String get used => 'Использовано';

  @override
  String get free => 'Свободно';

  @override
  String get stopService => 'Остановить сервис';

  @override
  String get stopAllServices => 'Остановить все сервисы';

  @override
  String get stopServiceConfirm => 'Остановить этот сервис?';

  @override
  String get stopAllServicesConfirm =>
      'Остановить все сервисы этого приложения?';

  @override
  String get stopServiceWarning =>
      'Это принудительно остановит приложение. Вы можете потерять несохранённые данные.';

  @override
  String get serviceStopped => 'Сервис остановлен';

  @override
  String get allServicesStopped => 'Все сервисы остановлены';

  @override
  String get stopServiceError => 'Не удалось остановить сервис';

  @override
  String get cancel => 'Отмена';

  @override
  String get stop => 'Остановить';

  @override
  String get permissionRequired => 'Требуется разрешение';

  @override
  String get permissionRequiredMessage =>
      'Для доступа к информации о запущенных сервисах требуется разрешение Shizuku.';

  @override
  String get permissionSteps => 'Как предоставить разрешение:';

  @override
  String get permissionStep1 => 'Откройте приложение Shizuku';

  @override
  String get permissionStep2 =>
      'Перейдите в «Авторизованные приложения» или «Разрешения»';

  @override
  String get permissionStep3 =>
      'Найдите «Монитор запущенных сервисов» и предоставьте разрешение';

  @override
  String get permissionNote =>
      'Убедитесь, что сервис Shizuku запущен перед предоставлением разрешения.';

  @override
  String get openShizuku => 'Открыть Shizuku';

  @override
  String get systemAppWarning =>
      '⚠️ ВНИМАНИЕ: Это СИСТЕМНОЕ ПРИЛОЖЕНИЕ. Его остановка может привести к сбоям или нестабильной работе устройства. Продолжайте, только если знаете, что делаете!';

  @override
  String get runningServicesTitle => 'Системные запущенные сервисы';

  @override
  String get openRunningServicesTooltip =>
      'Открыть запущенные сервисы в настройках Android';

  @override
  String get error => 'Ошибка';

  @override
  String get appInfoNotFound => 'Информация о приложении не найдена';

  @override
  String pageNotFound(String location) {
    return 'Страница не найдена: $location';
  }

  @override
  String get package => 'Пакет';

  @override
  String get service => 'Сервис';

  @override
  String get process => 'Процесс';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'Использование ОЗУ';

  @override
  String get intent => 'Интент';

  @override
  String get foreground => 'Передний план';

  @override
  String get foregroundId => 'ID переднего плана';

  @override
  String get startRequested => 'Запрос на запуск';

  @override
  String get createdFromFg => 'Создан из ПП';

  @override
  String get createTime => 'Время создания';

  @override
  String get lastActivity => 'Последняя активность';

  @override
  String get baseDir => 'Базовая директория';

  @override
  String get dataDir => 'Директория данных';

  @override
  String get type => 'Тип';

  @override
  String get systemApp => 'Системное приложение';

  @override
  String get userApp => 'Пользовательское приложение';

  @override
  String get rawOutput => 'Необработанный вывод';

  @override
  String get close => 'Закрыть';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get connections => 'Соединения';

  @override
  String get flags => 'Флаги';

  @override
  String get bound => 'Привязан';

  @override
  String get processRecord => 'Запись процесса';

  @override
  String get visible => 'Видимый';

  @override
  String get capabilities => 'Возможности';

  @override
  String get active => 'Активные';

  @override
  String get cached => 'Кэшированные';

  @override
  String get noServicesFound => 'Сервисы не найдены';

  @override
  String get ramCalculation => 'Расчёт ОЗУ';

  @override
  String get totalRam => 'Всего ОЗУ';

  @override
  String get ramSources => 'Источники';

  @override
  String get noRamDataAvailable =>
      'Нет данных об ОЗУ для этого приложения в системном отчёте о памяти.';

  @override
  String get ramCalculationExplanation =>
      'ОЗУ рассчитывается из системной информации о памяти. PID = поиск по ID процесса, Process = поиск по имени процесса, LRU = список недавних процессов.';

  @override
  String get playCommand => 'Выполнить команду';

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get copy => 'Копировать';

  @override
  String get and => 'и';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сервисов',
      few: '$count сервиса',
      one: '1 сервис',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count процессов',
      few: '$count процесса',
      one: '1 процесс',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount процессов',
      few: '$processCount процесса',
      one: '1 процесс',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount сервисов',
      few: '$serviceCount сервиса',
      one: '1 сервис',
    );
    return '$_temp0 и $_temp1';
  }

  @override
  String get info => 'Инфо';

  @override
  String get followSystem => 'Система';

  @override
  String get contributors => 'Участники';

  @override
  String contributionsCount(Object count) {
    return '$count вкладов';
  }

  @override
  String get checkingPermissions => 'Проверка разрешений...';

  @override
  String get shizukuNotRunning =>
      'Shizuku не запущен. Пожалуйста, запустите приложение Shizuku.';

  @override
  String get permissionDeniedShizuku =>
      'Разрешение отклонено. Пожалуйста, предоставьте разрешение Shizuku.';

  @override
  String get failedToInitialize =>
      'Не удалось инициализировать. Пожалуйста, предоставьте разрешение.';

  @override
  String get errorInitializingShizuku => 'Ошибка инициализации Shizuku';

  @override
  String get loadingApps => 'Загрузка приложений...';

  @override
  String get refreshedSuccessfully => 'Успешно обновлено';

  @override
  String get errorLoadingData => 'Ошибка загрузки данных';

  @override
  String get failedToStopAllServices => 'Не удалось остановить все сервисы';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'Не удалось остановить сервис $serviceName';
  }

  @override
  String errorPrefix(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get language => 'Язык';

  @override
  String get openGithubProfile => 'Открыть профиль GitHub';

  @override
  String get appInfoTooltip => 'О приложении';

  @override
  String get ok => 'ОК';

  @override
  String get recentCallingUid => 'Последний вызывающий UID';

  @override
  String get appDetails => 'Детали приложения';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'Состояние процесса';

  @override
  String get processStateFg =>
      'Передний план — приложение активно на переднем плане';

  @override
  String get processStateVis =>
      'Видимый — приложение видимо, но не на переднем плане';

  @override
  String get processStatePrev => 'Предыдущий — ранее использованное приложение';

  @override
  String get processStatePrcp =>
      'Воспринимаемый — приложение выполняет заметное действие';

  @override
  String get processStateSvcb =>
      'Сервис B — приложение имеет привязанный сервис';

  @override
  String get processStateHome => 'Главный экран — приложение домашнего экрана';

  @override
  String get processStateHvy => 'Тяжёлый — тяжеловесный процесс';

  @override
  String get processStatePsvc =>
      'Постоянный сервис — приложение с постоянным сервисом';

  @override
  String get processStatePers => 'Постоянный — системный постоянный процесс';

  @override
  String get processStateCchEmpty =>
      'Кэш (пустой) — кэшированный процесс без активностей';

  @override
  String get processStateCchAct =>
      'Кэш (активность) — кэшированный процесс с активностями';

  @override
  String get processStateCchClient =>
      'Кэш (клиент) — кэшированный процесс как клиент сервиса';

  @override
  String get processStateCch => 'Кэшированный — процесс в кэше памяти';

  @override
  String get processStateBfgs =>
      'Привязанный сервис ПП — привязан к сервису переднего плана';

  @override
  String get processStateRcvr =>
      'Приёмник — выполняется обработчик широковещательных сообщений';

  @override
  String get processStateTop =>
      'Верхний — приложение наверху стека активностей';

  @override
  String get processStateBtop =>
      'Привязанный верхний — привязан к верхнему приложению';

  @override
  String get processStateImpf => 'Важный ПП — важный процесс переднего плана';

  @override
  String get processStateImpb => 'Важный фон — важный фоновый процесс';

  @override
  String processStateUnknown(String state) {
    return 'Состояние процесса: $state';
  }

  @override
  String get workingMode => 'Режим работы';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Выберите режим работы';

  @override
  String get available => 'Доступно';

  @override
  String get notAvailable => 'Недоступно';

  @override
  String get modeNotAvailable => 'Этот режим недоступен';

  @override
  String get noModeAvailable => 'Нет доступного режима разрешений';

  @override
  String get commandLogs => 'Журнал команд';

  @override
  String get commandOutput => 'Вывод команды';

  @override
  String get noCommandLogs => 'Команды ещё не выполнялись';

  @override
  String get clearLogs => 'Очистить журнал';

  @override
  String get clearLogsConfirm =>
      'Вы уверены, что хотите очистить все журналы команд?';

  @override
  String get executedAt => 'Выполнено в';

  @override
  String get command => 'Команда';

  @override
  String get noOutput => 'Нет вывода';

  @override
  String get executeCommand => 'Выполнить';

  @override
  String get processes => 'Процессы';

  @override
  String get processesDescription =>
      'Все запущенные процессы этого приложения из информации о памяти.';

  @override
  String get noProcessesFound => 'Процессы не найдены';

  @override
  String get usedBreakdown => 'Разбивка использованного';

  @override
  String get freeBreakdown => 'Разбивка свободного';

  @override
  String get other => 'Другое';

  @override
  String get usedPss => 'Использованный PSS';

  @override
  String get kernel => 'Ядро';

  @override
  String get cachedPss => 'Кэшированный PSS';

  @override
  String get cachedKernel => 'Кэшированное ядро';

  @override
  String get actualFree => 'Фактически свободно';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'Потерянная ОЗУ';

  @override
  String get zramPhysical => 'ZRAM физическая';

  @override
  String get zramSwapUsed => 'ZRAM подкачка использована';

  @override
  String get zramTotalSwap => 'ZRAM общая подкачка';

  @override
  String get oomThreshold => 'Порог OOM';

  @override
  String get restoreLimit => 'Лимит восстановления';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Пороги памяти';

  @override
  String get boundServiceCannotStop =>
      'Этот сервис привязан другим процессом и не может быть остановлен напрямую. Вместо этого можно остановить всё приложение.';

  @override
  String get memoryInfo => 'Информация о памяти';

  @override
  String get viewRawOutput => 'Показать сырые данные';

  @override
  String get hideRawOutput => 'Скрыть сырые данные';

  @override
  String get compareWithOther => 'Сравнить';

  @override
  String get memoryCategories => 'Категории памяти';

  @override
  String get appSummary => 'Сводка приложения';

  @override
  String get objects => 'Объекты';

  @override
  String get memoryComparison => 'Сравнение памяти';

  @override
  String get selectAppToCompare => 'Выберите приложение для сравнения';

  @override
  String get selectApp => 'Выберите приложение...';

  @override
  String get totalPss => 'Всего PSS';

  @override
  String get totalRss => 'Всего RSS';

  @override
  String get javaHeap => 'Java Heap';

  @override
  String get nativeHeap => 'Native Heap';

  @override
  String get code => 'Код';

  @override
  String get graphics => 'Графика';

  @override
  String get current => 'Текущий';

  @override
  String get allApps => 'Все';

  @override
  String get userApps => 'Пользовательские';

  @override
  String get systemApps => 'Системные';

  @override
  String get compareWith => 'Сравнить с';

  @override
  String get stats => 'Статистика';

  @override
  String get statsLiveRamArea => 'ОЗУ системы в реальном времени';

  @override
  String get statsLiveRamAreaSubtitle => 'Использование ОЗУ во времени';

  @override
  String get statsRamDistribution => 'Распределение ОЗУ системы';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Всего: $size';
  }

  @override
  String get statsRamLabel => 'ОЗУ';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam =>
      'ОЗУ пользовательских и системных приложений';

  @override
  String get statsAppStateDistribution => 'Распределение состояний приложений';

  @override
  String get statsActive => 'Активные';

  @override
  String get statsBackground => 'Фоновые';

  @override
  String get statsCached => 'Кэшированные';

  @override
  String statsAppsCount(int count) {
    return '$count приложений';
  }

  @override
  String get statsSystemVsUserAnalysis => 'Анализ системных и пользовательских';

  @override
  String get statsAppCount => 'Количество приложений';

  @override
  String get statsTotalRam => 'Всего ОЗУ';

  @override
  String get statsPerformance => 'Производительность';

  @override
  String get statsRamDistributionScatter => 'Точечное распределение ОЗУ';

  @override
  String get statsRamDistributionScatterSubtitle =>
      'Y: ОЗУ, X: Индекс приложения';

  @override
  String get statsTopRamConsumers => 'Топ потребителей ОЗУ';

  @override
  String get statsServicesVsRamCorrelation => 'Корреляция сервисов и ОЗУ';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: ОЗУ, X: Количество сервисов, Пузырёк: Количество процессов';

  @override
  String get statsRamHistogram => 'Гистограмма частоты ОЗУ';

  @override
  String get statsRamHistogramSubtitle =>
      'Количество приложений по размеру памяти';

  @override
  String get statsMemoryHeatmap => 'Тепловая карта памяти';

  @override
  String get statsMemoryHeatmapSubtitle =>
      'Все приложения, отсортированные по интенсивности ОЗУ';

  @override
  String get statsTopAppsRelativeImpact =>
      'Относительное влияние топ-приложений';

  @override
  String get statsGanttSubtitle => 'Визуализация доли ОЗУ в стиле Ганта';

  @override
  String get statsStackedAreaChart => 'Разбивка ОЗУ во времени';

  @override
  String get statsStackedAreaSubtitle =>
      'Пользовательская, системная и ОЗУ ядра';

  @override
  String get statsPolarChart => 'Распределение состояний процессов';

  @override
  String get statsPolarSubtitle => 'Полярный вид состояний приложений';

  @override
  String get statsTreemap => 'Древовидная карта распределения ОЗУ';

  @override
  String get statsTreemapSubtitle =>
      'Пропорциональное использование ОЗУ по приложениям';

  @override
  String get statsFunnelChart => 'Уровни использования ОЗУ';

  @override
  String get statsFunnelSubtitle =>
      'Приложения, сгруппированные по размеру памяти';

  @override
  String get statsWaterfallChart => 'Каскадная диаграмма распределения ОЗУ';

  @override
  String get statsWaterfallSubtitle => 'Разбивка от общего к компонентам';

  @override
  String get statsGaugeChart => 'Индикатор использования ОЗУ';

  @override
  String get statsGaugeSubtitle => 'Общее использование системной памяти';

  @override
  String get statsTiny => 'Крошечный';

  @override
  String get statsSmall => 'Маленький';

  @override
  String get statsMedium => 'Средний';

  @override
  String get statsLarge => 'Большой';

  @override
  String get statsHuge => 'Огромный';

  @override
  String get statsNoData => 'Нет данных';

  @override
  String get statsWaitingForData => 'Ожидание данных...';

  @override
  String get statsRamDistributionPie => 'Распределение ОЗУ системы';

  @override
  String get statsRamDistributionSubtitle => 'Использованная, свободная и ZRAM';

  @override
  String get statsUsed => 'Использовано';

  @override
  String get statsFree => 'Свободно';

  @override
  String get statsUserVsSystemPie => 'ОЗУ пользовательских и системных';

  @override
  String get statsUserVsSystemSubtitle =>
      'Сравнение памяти пользовательских и системных приложений';

  @override
  String get statsProcessStateBar => 'Распределение состояний приложений';

  @override
  String get statsProcessStateSubtitle =>
      'Активные, фоновые и кэшированные приложения';

  @override
  String get statsScatterChart => 'Точечное распределение ОЗУ';

  @override
  String get statsScatterSubtitle => 'Y: ОЗУ (МБ), X: Индекс приложения';

  @override
  String get core => 'Ядро';

  @override
  String get coreAppInfoLimited =>
      'Ограниченная информация для системных процессов';

  @override
  String get showCoreApps => 'Показать основные приложения';

  @override
  String get usefulCommands => 'Полезные команды';

  @override
  String get commands => 'Команды';

  @override
  String get addCommand => 'Добавить команду';

  @override
  String get placeholders => 'Заполнители';

  @override
  String get commandTitle => 'Название';

  @override
  String get commandDescription => 'Описание';

  @override
  String get reExecute => 'Выполнить снова';

  @override
  String get statsProcessVsRamLine => 'Корреляция процессов и ОЗУ';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Синий: ОЗУ, Пунктир: Количество процессов';

  @override
  String get statsUserVsSystemBar => 'Сравнение пользовательских и системных';

  @override
  String get statsUserVsSystemBarSubtitle =>
      'Количество, общая ОЗУ, средняя ОЗУ';

  @override
  String get statsRamTrendScatter => 'Анализ тренда ОЗУ';

  @override
  String get statsRamTrendScatterSubtitle => 'Сервисы и ОЗУ с линией тренда';

  @override
  String get statsServicesVsProcesses => 'Сервисы и процессы';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Корреляция количества сервисов и процессов';

  @override
  String get statsProcessStateRam => 'ОЗУ по состоянию процесса';

  @override
  String get statsProcessStateRamSubtitle =>
      'Среднее использование ОЗУ по состоянию процесса';

  @override
  String get myCommands => 'Мои команды';

  @override
  String get defaultCommands => 'Команды по умолчанию';

  @override
  String get resetDefaults => 'Сбросить по умолчанию';

  @override
  String get memoryDistribution => 'Распределение памяти';

  @override
  String get memoryProfileComparison => 'Сравнение профилей памяти';

  @override
  String get stack => 'Стек';

  @override
  String get privateOther => 'Личное другое';

  @override
  String get unknown => 'Неизвестно';

  @override
  String totalPssLabel(String size) {
    return 'Всего PSS: $size';
  }
}
