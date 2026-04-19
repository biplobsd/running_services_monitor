// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Monitor de Servicios en Ejecución';

  @override
  String get enjoyingApp => '¿Te gusta la app? ¡Considera invitarme un café!';

  @override
  String get donate => 'Donar';

  @override
  String get searchApps => 'Buscar apps...';

  @override
  String get all => 'Todo';

  @override
  String get user => 'Usuario';

  @override
  String get system => 'Sistema';

  @override
  String get closeSearch => 'Cerrar búsqueda';

  @override
  String get search => 'Buscar';

  @override
  String get autoUpdate => 'Actualización automática (3s)';

  @override
  String get refresh => 'Actualizar';

  @override
  String get toggleTheme => 'Cambiar tema';

  @override
  String get about => 'Acerca de';

  @override
  String get loading => 'Cargando...';

  @override
  String get developer => 'Desarrollador';

  @override
  String get email => 'Correo';

  @override
  String get sourceCode => 'Código fuente';

  @override
  String get blogs => 'Blogs';

  @override
  String get buyMeCoffee => 'Invítame un café';

  @override
  String get madeInBangladesh => 'Hecho en Bangladesh';

  @override
  String get runningApp => 'App en ejecución';

  @override
  String get stopWarning =>
      'Esta app no puede detenerse de forma segura. Si la detienes, puedes perder parte de tu trabajo actual.';

  @override
  String get activeServices => 'Servicios activos';

  @override
  String get shizukuRequired => 'Se requiere Shizuku';

  @override
  String get shizukuRequiredMessage =>
      'Esta app requiere Shizuku para acceder a la información de servicios en ejecución.';

  @override
  String get setupSteps => 'Pasos de configuración:';

  @override
  String get step1 => 'Instala la app Shizuku desde Play Store o GitHub';

  @override
  String get step2 => 'Abre Shizuku e inicia el servicio';

  @override
  String get step3 => 'Para Android 11+: usa Depuración inalámbrica';

  @override
  String get step4 => 'Para Android 10 o inferior: conéctate a PC por ADB';

  @override
  String get step5 => 'Vuelve a esta app e inténtalo de nuevo';

  @override
  String get quickStart => 'Inicio rápido (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Habilita Opciones de desarrollador\n2. Habilita Depuración inalámbrica\n3. Abre Shizuku y toca \"Emparejar\"\n4. Sigue las instrucciones en pantalla';

  @override
  String get exitApp => 'Salir de la app';

  @override
  String get retry => 'Reintentar';

  @override
  String get loadingServices => 'Cargando servicios...';

  @override
  String get deviceMemory => 'Memoria del dispositivo';

  @override
  String get noMatchingApps => 'No hay apps coincidentes';

  @override
  String get noAppsFound => 'No se encontraron apps';

  @override
  String get ofRam => 'de RAM';

  @override
  String get processAnd => 'proceso y';

  @override
  String get services => 'Servicios';

  @override
  String get apps => 'Apps';

  @override
  String get used => 'Usado';

  @override
  String get free => 'Libre';

  @override
  String get stopService => 'Detener servicio';

  @override
  String get stopAllServices => 'Detener todos los servicios';

  @override
  String get stopServiceConfirm => '¿Detener este servicio?';

  @override
  String get stopAllServicesConfirm =>
      '¿Detener todos los servicios de esta app?';

  @override
  String get stopServiceWarning =>
      'Esto forzará el cierre de la app. Puedes perder datos no guardados.';

  @override
  String get serviceStopped => 'Servicio detenido';

  @override
  String get allServicesStopped => 'Todos los servicios detenidos';

  @override
  String get stopServiceError => 'Error al detener el servicio';

  @override
  String get cancel => 'Cancelar';

  @override
  String get stop => 'Detener';

  @override
  String get permissionRequired => 'Permiso requerido';

  @override
  String get permissionRequiredMessage =>
      'Se requiere permiso de Shizuku para acceder a la información de servicios en ejecución.';

  @override
  String get permissionSteps => 'Cómo conceder el permiso:';

  @override
  String get permissionStep1 => 'Abre la app Shizuku';

  @override
  String get permissionStep2 => 'Ve a \'Apps autorizadas\' o \'Permisos\'';

  @override
  String get permissionStep3 =>
      'Busca \'Running Services Monitor\' y concede el permiso';

  @override
  String get permissionNote =>
      'Asegúrate de que el servicio Shizuku esté en ejecución antes de conceder el permiso.';

  @override
  String get openShizuku => 'Abrir Shizuku';

  @override
  String get systemAppWarning =>
      '⚠️ ADVERTENCIA: Esta es una APP DEL SISTEMA. Detenerla puede provocar fallos o inestabilidad en tu dispositivo. ¡Solo continúa si sabes lo que haces!';

  @override
  String get runningServicesTitle => 'Servicios del sistema en ejecución';

  @override
  String get openRunningServicesTooltip =>
      'Abrir Servicios en ejecución en Ajustes de Android';

  @override
  String get error => 'Error';

  @override
  String get appInfoNotFound => 'No se encontró la información de la app';

  @override
  String pageNotFound(String location) {
    return 'Página no encontrada: $location';
  }

  @override
  String get package => 'Paquete';

  @override
  String get service => 'Servicio';

  @override
  String get process => 'Proceso';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'Uso de RAM';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => 'Primer plano';

  @override
  String get foregroundId => 'ID de primer plano';

  @override
  String get startRequested => 'Inicio solicitado';

  @override
  String get createdFromFg => 'Creado desde FG';

  @override
  String get createTime => 'Hora de creación';

  @override
  String get lastActivity => 'Última actividad';

  @override
  String get baseDir => 'Directorio base';

  @override
  String get dataDir => 'Directorio de datos';

  @override
  String get type => 'Tipo';

  @override
  String get systemApp => 'App del sistema';

  @override
  String get userApp => 'App de usuario';

  @override
  String get rawOutput => 'Salida sin procesar';

  @override
  String get close => 'Cerrar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get connections => 'Conexiones';

  @override
  String get flags => 'Indicadores';

  @override
  String get bound => 'Vinculado';

  @override
  String get processRecord => 'Registro del proceso';

  @override
  String get visible => 'Visible';

  @override
  String get capabilities => 'Capacidades';

  @override
  String get active => 'Activo';

  @override
  String get cached => 'En caché';

  @override
  String get noServicesFound => 'No se encontraron servicios';

  @override
  String get ramCalculation => 'Cálculo de RAM';

  @override
  String get totalRam => 'RAM total';

  @override
  String get ramSources => 'Fuentes';

  @override
  String get noRamDataAvailable =>
      'No hay datos de RAM disponibles para esta app en el informe de memoria del sistema.';

  @override
  String get ramCalculationExplanation =>
      'La RAM se calcula desde la información de memoria del sistema. PID = búsqueda por ID de proceso, Proceso = búsqueda por nombre de proceso, LRU = lista de procesos recientes.';

  @override
  String get playCommand => 'Ejecutar comando';

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get copy => 'Copiar';

  @override
  String get and => 'y';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count servicios',
      one: '1 servicio',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count procesos',
      one: '1 proceso',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount procesos',
      one: '1 proceso',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount servicios',
      one: '1 servicio',
    );
    return '$_temp0 y $_temp1';
  }

  @override
  String get info => 'Info';

  @override
  String get followSystem => 'Sistema';

  @override
  String get contributors => 'Colaboradores';

  @override
  String contributionsCount(Object count) {
    return '$count contribuciones';
  }

  @override
  String get checkingPermissions => 'Comprobando permisos...';

  @override
  String get shizukuNotRunning =>
      'Shizuku no está en ejecución. Inicia la app Shizuku.';

  @override
  String get permissionDeniedShizuku =>
      'Permiso denegado. Concede permiso a Shizuku.';

  @override
  String get failedToInitialize => 'Error al inicializar. Concede el permiso.';

  @override
  String get errorInitializingShizuku => 'Error al inicializar Shizuku';

  @override
  String get loadingApps => 'Cargando apps...';

  @override
  String get refreshedSuccessfully => 'Actualizado correctamente';

  @override
  String get errorLoadingData => 'Error al cargar datos';

  @override
  String get failedToStopAllServices => 'Error al detener todos los servicios';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'No se pudo detener el servicio $serviceName';
  }

  @override
  String errorPrefix(String error) {
    return 'Error: $error';
  }

  @override
  String get language => 'Idioma';

  @override
  String get openGithubProfile => 'Abrir perfil de GitHub';

  @override
  String get appInfoTooltip => 'Información de la app';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => 'UID de llamada reciente';

  @override
  String get appDetails => 'Detalles de la app';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'Estado del proceso';

  @override
  String get processStateFg =>
      'Primer plano - La app está actualmente en primer plano';

  @override
  String get processStateVis =>
      'Visible - La app tiene una actividad visible pero no está en primer plano';

  @override
  String get processStatePrev =>
      'Anterior - App usada previamente en primer plano';

  @override
  String get processStatePrcp =>
      'Perceptible - La app está haciendo algo de lo que el usuario es consciente';

  @override
  String get processStateSvcb =>
      'Servicio B - La app tiene un servicio vinculado';

  @override
  String get processStateHome => 'Inicio - App de inicio/lanzador';

  @override
  String get processStateHvy => 'Peso pesado - Proceso de app de alto consumo';

  @override
  String get processStatePsvc =>
      'Servicio persistente - La app tiene un servicio persistente';

  @override
  String get processStatePers =>
      'Persistente - Proceso persistente del sistema';

  @override
  String get processStateCchEmpty =>
      'Caché vacía - Proceso en caché sin actividades';

  @override
  String get processStateCchAct =>
      'Actividad en caché - Proceso en caché con actividades';

  @override
  String get processStateCchClient =>
      'Cliente en caché - Proceso en caché como cliente de servicio';

  @override
  String get processStateCch =>
      'En caché - El proceso está en caché en memoria';

  @override
  String get processStateBfgs =>
      'Servicio vinculado en primer plano - Vinculado a un servicio en primer plano';

  @override
  String get processStateRcvr =>
      'Receptor - La app está ejecutando un receptor de broadcast';

  @override
  String get processStateTop =>
      'Superior - La app está en la parte superior de la pila de actividades';

  @override
  String get processStateBtop =>
      'Vinculado superior - Vinculado a una app superior';

  @override
  String get processStateImpf =>
      'Primer plano importante - Proceso importante en primer plano';

  @override
  String get processStateImpb =>
      'Fondo importante - Proceso importante en segundo plano';

  @override
  String processStateUnknown(String state) {
    return 'Estado del proceso: $state';
  }

  @override
  String get workingMode => 'Modo de trabajo';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Seleccionar modo de trabajo';

  @override
  String get available => 'Disponible';

  @override
  String get notAvailable => 'No disponible';

  @override
  String get modeNotAvailable => 'Este modo no está disponible';

  @override
  String get noModeAvailable => 'No hay modo de permisos disponible';

  @override
  String get commandLogs => 'Registros de comandos';

  @override
  String get commandOutput => 'Salida del comando';


  @override
  String get searchOutput => 'Search in output...';

  @override
  String matchCount(int current, int total) {
    return '$current of $total';
  }

  @override
  String get noMatches => 'No matches';

  @override
  String get nextMatch => 'Next match';

  @override
  String get previousMatch => 'Previous match';

  @override
  String get noCommandLogs => 'Aún no se han ejecutado comandos';

  @override
  String get clearLogs => 'Limpiar registros';

  @override
  String get clearLogsConfirm =>
      '¿Seguro que quieres borrar todos los registros de comandos?';

  @override
  String get executedAt => 'Ejecutado en';

  @override
  String get command => 'Comando';

  @override
  String get noOutput => 'Sin salida';

  @override
  String get executeCommand => 'Ejecutar';

  @override
  String get processes => 'Procesos';

  @override
  String get processesDescription =>
      'Todos los procesos en ejecución para esta app según la información de memoria.';

  @override
  String get noProcessesFound => 'No se encontraron procesos';

  @override
  String get usedBreakdown => 'Desglose de usado';

  @override
  String get freeBreakdown => 'Desglose de libre';

  @override
  String get other => 'Otro';

  @override
  String get usedPss => 'PSS usado';

  @override
  String get kernel => 'Kernel';

  @override
  String get cachedPss => 'PSS en caché';

  @override
  String get cachedKernel => 'Kernel en caché';

  @override
  String get actualFree => 'Libre real';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'RAM perdida';

  @override
  String get zramPhysical => 'ZRAM físico';

  @override
  String get zramSwapUsed => 'Swap ZRAM usado';

  @override
  String get zramTotalSwap => 'Swap total ZRAM';

  @override
  String get oomThreshold => 'Umbral OOM';

  @override
  String get restoreLimit => 'Límite de restauración';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Umbrales de memoria';

  @override
  String get boundServiceCannotStop =>
      'Este servicio está vinculado por otro proceso y no puede detenerse directamente. Puedes detener toda la app en su lugar.';

  @override
  String get memoryInfo => 'Información de memoria';

  @override
  String get viewRawOutput => 'Ver salida sin procesar';

  @override
  String get hideRawOutput => 'Ocultar salida sin procesar';

  @override
  String get compareWithOther => 'Comparar';

  @override
  String get memoryCategories => 'Categorías de memoria';

  @override
  String get appSummary => 'Resumen de la app';

  @override
  String get objects => 'Objetos';

  @override
  String get memoryComparison => 'Comparación de memoria';

  @override
  String get selectAppToCompare => 'Selecciona una app para comparar';

  @override
  String get selectApp => 'Seleccionar app...';

  @override
  String get totalPss => 'PSS total';

  @override
  String get totalRss => 'RSS total';

  @override
  String get javaHeap => 'Heap Java';

  @override
  String get nativeHeap => 'Heap nativo';

  @override
  String get code => 'Código';

  @override
  String get graphics => 'Gráficos';

  @override
  String get current => 'Actual';

  @override
  String get allApps => 'Todo';

  @override
  String get userApps => 'Usuario';

  @override
  String get systemApps => 'Sistema';

  @override
  String get compareWith => 'Comparar con';

  @override
  String get stats => 'Estadísticas';

  @override
  String get statsLiveRamArea => 'RAM del sistema en vivo';

  @override
  String get statsLiveRamAreaSubtitle => 'RAM usada a lo largo del tiempo';

  @override
  String get statsRamDistribution => 'Distribución de RAM del sistema';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Total: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'RAM de apps de usuario vs sistema';

  @override
  String get statsAppStateDistribution => 'Distribución de estado de apps';

  @override
  String get statsActive => 'Activo';

  @override
  String get statsBackground => 'Segundo plano';

  @override
  String get statsCached => 'En caché';

  @override
  String statsAppsCount(int count) {
    return '$count apps';
  }

  @override
  String get statsSystemVsUserAnalysis => 'Análisis sistema vs usuario';

  @override
  String get statsAppCount => 'Cantidad de apps';

  @override
  String get statsTotalRam => 'RAM total';

  @override
  String get statsPerformance => 'Rendimiento';

  @override
  String get statsRamDistributionScatter => 'Dispersión de distribución de RAM';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: índice de app';

  @override
  String get statsTopRamConsumers => 'Mayores consumidores de RAM';

  @override
  String get statsServicesVsRamCorrelation => 'Correlación servicios vs RAM';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: cantidad de servicios, Burbuja: cantidad de procesos';

  @override
  String get statsRamHistogram => 'Histograma de frecuencia de RAM';

  @override
  String get statsRamHistogramSubtitle =>
      'Cantidad de apps por tamaño de memoria';

  @override
  String get statsMemoryHeatmap => 'Mapa de calor de memoria';

  @override
  String get statsMemoryHeatmapSubtitle =>
      'Todas las apps ordenadas por intensidad de RAM';

  @override
  String get statsTopAppsRelativeImpact =>
      'Impacto relativo de apps principales';

  @override
  String get statsGanttSubtitle =>
      'Visualización estilo Gantt de la cuota de RAM';

  @override
  String get statsStackedAreaChart => 'Desglose de RAM en el tiempo';

  @override
  String get statsStackedAreaSubtitle => 'RAM de usuario, sistema y kernel';

  @override
  String get statsPolarChart => 'Distribución de estado de procesos';

  @override
  String get statsPolarSubtitle => 'Vista polar de estados de apps';

  @override
  String get statsTreemap => 'Treemap de distribución de RAM';

  @override
  String get statsTreemapSubtitle => 'Uso proporcional de RAM por app';

  @override
  String get statsFunnelChart => 'Niveles de uso de RAM';

  @override
  String get statsFunnelSubtitle => 'Apps agrupadas por tamaño de memoria';

  @override
  String get statsWaterfallChart => 'Cascada de asignación de RAM';

  @override
  String get statsWaterfallSubtitle => 'Desglose del total a componentes';

  @override
  String get statsGaugeChart => 'Medidor de uso de RAM';

  @override
  String get statsGaugeSubtitle => 'Utilización general de memoria del sistema';

  @override
  String get statsTiny => 'Muy pequeña';

  @override
  String get statsSmall => 'Pequeña';

  @override
  String get statsMedium => 'Mediana';

  @override
  String get statsLarge => 'Grande';

  @override
  String get statsHuge => 'Enorme';

  @override
  String get statsNoData => 'No hay datos disponibles';

  @override
  String get statsWaitingForData => 'Esperando datos...';

  @override
  String get statsRamDistributionPie => 'Distribución de RAM del sistema';

  @override
  String get statsRamDistributionSubtitle => 'Usada, libre y ZRAM';

  @override
  String get statsUsed => 'Usada';

  @override
  String get statsFree => 'Libre';

  @override
  String get statsUserVsSystemPie => 'RAM de apps de usuario vs sistema';

  @override
  String get statsUserVsSystemSubtitle =>
      'Compara memoria de apps de usuario y del sistema';

  @override
  String get statsProcessStateBar => 'Distribución de estado de apps';

  @override
  String get statsProcessStateSubtitle =>
      'Apps activas, en segundo plano y en caché';

  @override
  String get statsScatterChart => 'Dispersión de distribución de RAM';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: índice de app';

  @override
  String get core => 'Núcleo';

  @override
  String get coreAppInfoLimited =>
      'Información limitada disponible para procesos del sistema';

  @override
  String get showCoreApps => 'Mostrar apps del núcleo';

  @override
  String get usefulCommands => 'Comandos útiles';

  @override
  String get commands => 'Comandos';

  @override
  String get addCommand => 'Agregar comando';

  @override
  String get placeholders => 'Marcadores';

  @override
  String get commandTitle => 'Título';

  @override
  String get commandDescription => 'Descripción';

  @override
  String get reExecute => 'Reejecutar';

  @override
  String get statsProcessVsRamLine => 'Correlación procesos vs RAM';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Azul: RAM, Discontinua: cantidad de procesos';

  @override
  String get statsUserVsSystemBar => 'Comparación usuario vs sistema';

  @override
  String get statsUserVsSystemBarSubtitle =>
      'Cantidad de apps, RAM total, RAM promedio';

  @override
  String get statsRamTrendScatter => 'Análisis de tendencia de RAM';

  @override
  String get statsRamTrendScatterSubtitle =>
      'Servicios vs RAM con línea de tendencia';

  @override
  String get statsServicesVsProcesses => 'Servicios vs procesos';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Correlación entre cantidad de servicios y procesos';

  @override
  String get statsProcessStateRam => 'RAM por estado de proceso';

  @override
  String get statsProcessStateRamSubtitle =>
      'Uso promedio de RAM por estado de proceso';

  @override
  String get myCommands => 'Mis comandos';

  @override
  String get defaultCommands => 'Comandos predeterminados';

  @override
  String get resetDefaults => 'Restablecer predeterminados';

  @override
  String get memoryDistribution => 'Distribución de memoria';

  @override
  String get memoryProfileComparison => 'Comparación de perfil de memoria';

  @override
  String get stack => 'Pila';

  @override
  String get privateOther => 'Privado otro';

  @override
  String get unknown => 'Desconocido';

  @override
  String totalPssLabel(String size) {
    return 'PSS total: $size';
  }

  @override
  String get tipsAndSupport => 'Soporte';

  @override
  String get tipsRateTitle => 'Califícanos';

  @override
  String get tipsRateDescription =>
      'Danos una reseña de 5 estrellas y comparte tus comentarios.';

  @override
  String get tipsRateAction => 'Abrir Play Store';

  @override
  String get tipsCoffeeTitle => 'Cómprame un café';

  @override
  String get tipsCoffeeDescription =>
      'Motívame a mantener esta aplicación actualizada.';

  @override
  String get tipsCoffeeAction => 'Cómprame un café';

  @override
  String get tipsContributeTitle => 'Contribuir';

  @override
  String get tipsContributeDescription =>
      'Ayuda a traducir o contribuye a mejorar la aplicación.';

  @override
  String get tipsContributeAction => 'Ver en GitHub';

  @override
  String get placeholdersNoAutoFill =>
      'Placeholders won\'t be auto-filled here. Enter values manually in the command (e.g., %p = package name, %pid = process id).';

  @override
  String get placeholderPackageName => 'Package name (e.g., com.example.app)';

  @override
  String get placeholderProcessId => 'Process ID';

  @override
  String get placeholderAllPids => 'All PIDs (comma-separated)';

  @override
  String get placeholderTotalRamFormatted => 'Total RAM (formatted)';

  @override
  String get placeholderTotalRamKb => 'Total RAM in KB';

  @override
  String get placeholderProcessState => 'Process state';

  @override
  String get placeholderCachedMemoryKb => 'Cached memory in KB';

  @override
  String get placeholderServicesCount => 'Services count';

  @override
  String get placeholderProcessCount => 'Process count';

  @override
  String get commandHintExample => 'dumpsys meminfo com.example.app';

  @override
  String get editCommand => 'Edit Command';
}
