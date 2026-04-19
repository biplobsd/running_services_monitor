// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Monitor Servizi in Esecuzione';

  @override
  String get enjoyingApp =>
      'Ti piace l\'app? Considera di offrirmi un caffè!';

  @override
  String get donate => 'Dona';

  @override
  String get searchApps => 'Cerca app...';

  @override
  String get all => 'Tutti';

  @override
  String get user => 'Utente';

  @override
  String get system => 'Sistema';

  @override
  String get closeSearch => 'Chiudi ricerca';

  @override
  String get search => 'Cerca';

  @override
  String get autoUpdate => 'Aggiornamento automatico (3s)';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get toggleTheme => 'Cambia tema';

  @override
  String get about => 'Informazioni';

  @override
  String get loading => 'Caricamento...';

  @override
  String get developer => 'Sviluppatore';

  @override
  String get email => 'Email';

  @override
  String get sourceCode => 'Codice sorgente';

  @override
  String get blogs => 'Blog';

  @override
  String get buyMeCoffee => 'Offrimi un caffè';

  @override
  String get madeInBangladesh => 'Fatto in Bangladesh';

  @override
  String get runningApp => 'App in esecuzione';

  @override
  String get stopWarning =>
      'Questa app non può essere arrestata in modo sicuro. Se la fermi, potresti perdere parte del lavoro corrente.';

  @override
  String get activeServices => 'Servizi attivi';

  @override
  String get shizukuRequired => 'Shizuku richiesto';

  @override
  String get shizukuRequiredMessage =>
      'Questa app richiede Shizuku per accedere alle informazioni sui servizi in esecuzione.';

  @override
  String get setupSteps => 'Passaggi di configurazione:';

  @override
  String get step1 => 'Installa l\'app Shizuku dal Play Store o da GitHub';

  @override
  String get step2 => 'Apri Shizuku e avvia il servizio';

  @override
  String get step3 => 'Per Android 11+: Usa il debug wireless';

  @override
  String get step4 => 'Per Android 10 e precedenti: Connetti al PC via ADB';

  @override
  String get step5 => 'Torna a questa app e riprova';

  @override
  String get quickStart => 'Avvio rapido (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Abilita le Opzioni sviluppatore\n2. Abilita il debug wireless\n3. Apri Shizuku e tocca "Associa"\n4. Segui le istruzioni sullo schermo';

  @override
  String get exitApp => 'Esci dall\'app';

  @override
  String get retry => 'Riprova';

  @override
  String get loadingServices => 'Caricamento servizi...';

  @override
  String get deviceMemory => 'Memoria dispositivo';

  @override
  String get noMatchingApps => 'Nessuna app corrispondente';

  @override
  String get noAppsFound => 'Nessuna app trovata';

  @override
  String get ofRam => 'di RAM';

  @override
  String get processAnd => 'processo e';

  @override
  String get services => 'Servizi';

  @override
  String get apps => 'App';

  @override
  String get used => 'Usata';

  @override
  String get free => 'Libera';

  @override
  String get stopService => 'Ferma servizio';

  @override
  String get stopAllServices => 'Ferma tutti i servizi';

  @override
  String get stopServiceConfirm => 'Fermare questo servizio?';

  @override
  String get stopAllServicesConfirm =>
      'Fermare tutti i servizi per questa app?';

  @override
  String get stopServiceWarning =>
      'Questo forzerà l\'arresto dell\'app. Potresti perdere dati non salvati.';

  @override
  String get serviceStopped => 'Servizio fermato';

  @override
  String get allServicesStopped => 'Tutti i servizi fermati';

  @override
  String get stopServiceError => 'Impossibile fermare il servizio';

  @override
  String get cancel => 'Annulla';

  @override
  String get stop => 'Ferma';

  @override
  String get permissionRequired => 'Autorizzazione richiesta';

  @override
  String get permissionRequiredMessage =>
      'L\'autorizzazione Shizuku è necessaria per accedere alle informazioni sui servizi in esecuzione.';

  @override
  String get permissionSteps => 'Come concedere l\'autorizzazione:';

  @override
  String get permissionStep1 => 'Apri l\'app Shizuku';

  @override
  String get permissionStep2 =>
      'Vai su \'App autorizzate\' o \'Autorizzazioni\'';

  @override
  String get permissionStep3 =>
      'Trova \'Monitor Servizi in Esecuzione\' e concedi l\'autorizzazione';

  @override
  String get permissionNote =>
      'Assicurati che il servizio Shizuku sia in esecuzione prima di concedere l\'autorizzazione.';

  @override
  String get openShizuku => 'Apri Shizuku';

  @override
  String get systemAppWarning =>
      '⚠️ ATTENZIONE: Questa è un\'APP DI SISTEMA. Fermarla potrebbe causare malfunzionamenti o instabilità del dispositivo. Procedi solo se sai cosa stai facendo!';

  @override
  String get runningServicesTitle => 'Servizi di sistema in esecuzione';

  @override
  String get openRunningServicesTooltip =>
      'Apri Servizi in esecuzione nelle impostazioni Android';

  @override
  String get error => 'Errore';

  @override
  String get appInfoNotFound => 'Informazioni sull\'app non trovate';

  @override
  String pageNotFound(String location) {
    return 'Pagina non trovata: $location';
  }

  @override
  String get package => 'Pacchetto';

  @override
  String get service => 'Servizio';

  @override
  String get process => 'Processo';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'Utilizzo RAM';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => 'Primo piano';

  @override
  String get foregroundId => 'ID primo piano';

  @override
  String get startRequested => 'Avvio richiesto';

  @override
  String get createdFromFg => 'Creato dal primo piano';

  @override
  String get createTime => 'Ora di creazione';

  @override
  String get lastActivity => 'Ultima attività';

  @override
  String get baseDir => 'Directory base';

  @override
  String get dataDir => 'Directory dati';

  @override
  String get type => 'Tipo';

  @override
  String get systemApp => 'App di sistema';

  @override
  String get userApp => 'App utente';

  @override
  String get rawOutput => 'Output grezzo';

  @override
  String get close => 'Chiudi';

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get connections => 'Connessioni';

  @override
  String get flags => 'Flag';

  @override
  String get bound => 'Collegato';

  @override
  String get processRecord => 'Record processo';

  @override
  String get visible => 'Visibile';

  @override
  String get capabilities => 'Capacità';

  @override
  String get active => 'Attivo';

  @override
  String get cached => 'In cache';

  @override
  String get noServicesFound => 'Nessun servizio trovato';

  @override
  String get ramCalculation => 'Calcolo RAM';

  @override
  String get totalRam => 'RAM totale';

  @override
  String get ramSources => 'Fonti';

  @override
  String get noRamDataAvailable =>
      'Nessun dato RAM disponibile per questa app nel rapporto memoria di sistema.';

  @override
  String get ramCalculationExplanation =>
      'La RAM viene calcolata dalle informazioni sulla memoria di sistema. PID = Ricerca ID processo, Processo = Ricerca nome processo, LRU = Lista processi recenti.';

  @override
  String get playCommand => 'Esegui comando';

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get copy => 'Copia';

  @override
  String get and => 'e';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count servizi',
      one: '1 servizio',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count processi',
      one: '1 processo',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount processi',
      one: '1 processo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount servizi',
      one: '1 servizio',
    );
    return '$_temp0 e $_temp1';
  }

  @override
  String get info => 'Info';

  @override
  String get followSystem => 'Sistema';

  @override
  String get contributors => 'Contributori';

  @override
  String contributionsCount(Object count) {
    return '$count contributi';
  }

  @override
  String get checkingPermissions => 'Verifica autorizzazioni...';

  @override
  String get shizukuNotRunning =>
      'Shizuku non è in esecuzione. Avvia l\'app Shizuku.';

  @override
  String get permissionDeniedShizuku =>
      'Autorizzazione negata. Concedi l\'autorizzazione Shizuku.';

  @override
  String get failedToInitialize =>
      'Inizializzazione fallita. Concedi l\'autorizzazione.';

  @override
  String get errorInitializingShizuku =>
      'Errore durante l\'inizializzazione di Shizuku';

  @override
  String get loadingApps => 'Caricamento app...';

  @override
  String get refreshedSuccessfully => 'Aggiornato con successo';

  @override
  String get errorLoadingData => 'Errore nel caricamento dei dati';

  @override
  String get failedToStopAllServices =>
      'Impossibile fermare tutti i servizi';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'Impossibile fermare il servizio $serviceName';
  }

  @override
  String errorPrefix(String error) {
    return 'Errore: $error';
  }

  @override
  String get language => 'Lingua';

  @override
  String get openGithubProfile => 'Apri profilo GitHub';

  @override
  String get appInfoTooltip => 'Info app';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => 'UID chiamante recente';

  @override
  String get appDetails => 'Dettagli app';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'Stato processo';

  @override
  String get processStateFg =>
      'Primo piano - L\'app è attualmente in primo piano';

  @override
  String get processStateVis =>
      'Visibile - L\'app ha un\'attività visibile ma non in primo piano';

  @override
  String get processStatePrev =>
      'Precedente - App in primo piano usata in precedenza';

  @override
  String get processStatePrcp =>
      'Percepibile - L\'app sta facendo qualcosa di cui l\'utente è consapevole';

  @override
  String get processStateSvcb =>
      'Servizio B - L\'app ha un servizio collegato';

  @override
  String get processStateHome => 'Home - App Home/Launcher';

  @override
  String get processStateHvy => 'Peso elevato - Processo app pesante';

  @override
  String get processStatePsvc =>
      'Servizio persistente - L\'app ha un servizio persistente';

  @override
  String get processStatePers =>
      'Persistente - Processo di sistema persistente';

  @override
  String get processStateCchEmpty =>
      'Cache vuota - Processo in cache senza attività';

  @override
  String get processStateCchAct =>
      'Attività in cache - Processo in cache con attività';

  @override
  String get processStateCchClient =>
      'Client in cache - Processo in cache come client di servizio';

  @override
  String get processStateCch =>
      'In cache - Il processo è memorizzato nella cache';

  @override
  String get processStateBfgs =>
      'Servizio in primo piano collegato - Collegato a un servizio in primo piano';

  @override
  String get processStateRcvr =>
      'Ricevitore - L\'app esegue un broadcast receiver';

  @override
  String get processStateTop =>
      'In cima - L\'app è in cima allo stack delle attività';

  @override
  String get processStateBtop =>
      'Collegato in cima - Collegato a un\'app in cima';

  @override
  String get processStateImpf =>
      'Primo piano importante - Processo in primo piano importante';

  @override
  String get processStateImpb =>
      'Sfondo importante - Processo in background importante';

  @override
  String processStateUnknown(String state) {
    return 'Stato processo: $state';
  }

  @override
  String get workingMode => 'Modalità di lavoro';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Seleziona modalità di lavoro';

  @override
  String get available => 'Disponibile';

  @override
  String get notAvailable => 'Non disponibile';

  @override
  String get modeNotAvailable => 'Questa modalità non è disponibile';

  @override
  String get noModeAvailable => 'Nessuna modalità di autorizzazione disponibile';

  @override
  String get commandLogs => 'Log comandi';

  @override
  String get commandOutput => 'Output comando';


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
  String get noCommandLogs => 'Nessun comando eseguito ancora';

  @override
  String get clearLogs => 'Cancella log';

  @override
  String get clearLogsConfirm =>
      'Sei sicuro di voler cancellare tutti i log dei comandi?';

  @override
  String get executedAt => 'Eseguito alle';

  @override
  String get command => 'Comando';

  @override
  String get noOutput => 'Nessun output';

  @override
  String get executeCommand => 'Esegui';

  @override
  String get processes => 'Processi';

  @override
  String get processesDescription =>
      'Tutti i processi in esecuzione per questa app dalle informazioni sulla memoria.';

  @override
  String get noProcessesFound => 'Nessun processo trovato';

  @override
  String get usedBreakdown => 'Dettaglio utilizzo';

  @override
  String get freeBreakdown => 'Dettaglio libero';

  @override
  String get other => 'Altro';

  @override
  String get usedPss => 'PSS utilizzato';

  @override
  String get kernel => 'Kernel';

  @override
  String get cachedPss => 'PSS in cache';

  @override
  String get cachedKernel => 'Kernel in cache';

  @override
  String get actualFree => 'Libero effettivo';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'RAM persa';

  @override
  String get zramPhysical => 'ZRAM fisico';

  @override
  String get zramSwapUsed => 'ZRAM swap utilizzato';

  @override
  String get zramTotalSwap => 'ZRAM swap totale';

  @override
  String get oomThreshold => 'Soglia OOM';

  @override
  String get restoreLimit => 'Limite di ripristino';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Soglie di memoria';

  @override
  String get boundServiceCannotStop =>
      'Questo servizio è collegato da un altro processo e non può essere fermato direttamente. Puoi fermare l\'intera app.';

  @override
  String get memoryInfo => 'Info memoria';

  @override
  String get viewRawOutput => 'Vedi grezzo';

  @override
  String get hideRawOutput => 'Nascondi grezzo';

  @override
  String get compareWithOther => 'Confronta';

  @override
  String get memoryCategories => 'Categorie di memoria';

  @override
  String get appSummary => 'Riepilogo app';

  @override
  String get objects => 'Oggetti';

  @override
  String get memoryComparison => 'Confronto memoria';

  @override
  String get selectAppToCompare => 'Seleziona un\'app da confrontare';

  @override
  String get selectApp => 'Seleziona app...';

  @override
  String get totalPss => 'PSS totale';

  @override
  String get totalRss => 'RSS totale';

  @override
  String get javaHeap => 'Heap Java';

  @override
  String get nativeHeap => 'Heap nativo';

  @override
  String get code => 'Codice';

  @override
  String get graphics => 'Grafica';

  @override
  String get current => 'Corrente';

  @override
  String get allApps => 'Tutti';

  @override
  String get userApps => 'Utente';

  @override
  String get systemApps => 'Sistema';

  @override
  String get compareWith => 'Confronta con';

  @override
  String get stats => 'Statistiche';

  @override
  String get statsLiveRamArea => 'RAM di sistema live';

  @override
  String get statsLiveRamAreaSubtitle => 'RAM utilizzata nel tempo';

  @override
  String get statsRamDistribution => 'Distribuzione RAM di sistema';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Totale: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'RAM app utente vs sistema';

  @override
  String get statsAppStateDistribution => 'Distribuzione stato app';

  @override
  String get statsActive => 'Attive';

  @override
  String get statsBackground => 'In background';

  @override
  String get statsCached => 'In cache';

  @override
  String statsAppsCount(int count) {
    return '$count App';
  }

  @override
  String get statsSystemVsUserAnalysis => 'Analisi sistema vs utente';

  @override
  String get statsAppCount => 'Numero app';

  @override
  String get statsTotalRam => 'RAM totale';

  @override
  String get statsPerformance => 'Prestazioni';

  @override
  String get statsRamDistributionScatter => 'Scatter distribuzione RAM';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: Indice app';

  @override
  String get statsTopRamConsumers => 'Principali consumatori RAM';

  @override
  String get statsServicesVsRamCorrelation => 'Correlazione servizi vs RAM';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: Numero servizi, Bolla: Numero processi';

  @override
  String get statsRamHistogram => 'Istogramma frequenza RAM';

  @override
  String get statsRamHistogramSubtitle =>
      'Numero di app per dimensione memoria';

  @override
  String get statsMemoryHeatmap => 'Mappa termica memoria';

  @override
  String get statsMemoryHeatmapSubtitle =>
      'Tutte le app ordinate per intensità RAM';

  @override
  String get statsTopAppsRelativeImpact =>
      'Impatto relativo delle app principali';

  @override
  String get statsGanttSubtitle =>
      'Visualizzazione Gantt della quota RAM';

  @override
  String get statsStackedAreaChart => 'Evoluzione RAM nel tempo';

  @override
  String get statsStackedAreaSubtitle => 'RAM utente, sistema e kernel';

  @override
  String get statsPolarChart => 'Distribuzione stato processo';

  @override
  String get statsPolarSubtitle => 'Vista polare degli stati delle app';

  @override
  String get statsTreemap => 'Mappa ad albero distribuzione RAM';

  @override
  String get statsTreemapSubtitle => 'Utilizzo RAM proporzionale per app';

  @override
  String get statsFunnelChart => 'Livelli utilizzo RAM';

  @override
  String get statsFunnelSubtitle => 'App raggruppate per dimensione memoria';

  @override
  String get statsWaterfallChart => 'Cascata allocazione RAM';

  @override
  String get statsWaterfallSubtitle => 'Dettaglio dal totale ai componenti';

  @override
  String get statsGaugeChart => 'Indicatore utilizzo RAM';

  @override
  String get statsGaugeSubtitle =>
      'Utilizzo memoria di sistema complessivo';

  @override
  String get statsTiny => 'Minuscolo';

  @override
  String get statsSmall => 'Piccolo';

  @override
  String get statsMedium => 'Medio';

  @override
  String get statsLarge => 'Grande';

  @override
  String get statsHuge => 'Enorme';

  @override
  String get statsNoData => 'Nessun dato disponibile';

  @override
  String get statsWaitingForData => 'In attesa di dati...';

  @override
  String get statsRamDistributionPie => 'Distribuzione RAM di sistema';

  @override
  String get statsRamDistributionSubtitle => 'Usata, libera e ZRAM';

  @override
  String get statsUsed => 'Usata';

  @override
  String get statsFree => 'Libera';

  @override
  String get statsUserVsSystemPie => 'RAM app utente vs sistema';

  @override
  String get statsUserVsSystemSubtitle =>
      'Confronta la memoria delle app utente e di sistema';

  @override
  String get statsProcessStateBar => 'Distribuzione stato app';

  @override
  String get statsProcessStateSubtitle =>
      'App attive, in background e in cache';

  @override
  String get statsScatterChart => 'Scatter distribuzione RAM';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: Indice app';

  @override
  String get core => 'Core';

  @override
  String get coreAppInfoLimited =>
      'Informazioni limitate disponibili per i processi di sistema';

  @override
  String get showCoreApps => 'Mostra app core';

  @override
  String get usefulCommands => 'Comandi utili';

  @override
  String get commands => 'Comandi';

  @override
  String get addCommand => 'Aggiungi comando';

  @override
  String get placeholders => 'Segnaposto';

  @override
  String get commandTitle => 'Titolo';

  @override
  String get commandDescription => 'Descrizione';

  @override
  String get reExecute => 'Riesegui';

  @override
  String get statsProcessVsRamLine => 'Correlazione processo vs RAM';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Blu: RAM, Tratteggiato: Numero processi';

  @override
  String get statsUserVsSystemBar => 'Confronto utente vs sistema';

  @override
  String get statsUserVsSystemBarSubtitle =>
      'Numero app, RAM totale, RAM media';

  @override
  String get statsRamTrendScatter => 'Analisi tendenza RAM';

  @override
  String get statsRamTrendScatterSubtitle =>
      'Servizi vs RAM con linea di tendenza';

  @override
  String get statsServicesVsProcesses => 'Servizi vs processi';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Correlazione tra numero di servizi e processi';

  @override
  String get statsProcessStateRam => 'RAM per stato processo';

  @override
  String get statsProcessStateRamSubtitle =>
      'Utilizzo medio RAM per stato processo';

  @override
  String get myCommands => 'I miei comandi';

  @override
  String get defaultCommands => 'Comandi predefiniti';

  @override
  String get resetDefaults => 'Ripristina predefiniti';

  @override
  String get memoryDistribution => 'Distribuzione memoria';

  @override
  String get memoryProfileComparison => 'Confronto profilo memoria';

  @override
  String get stack => 'Stack';

  @override
  String get privateOther => 'Altro privato';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String totalPssLabel(String size) {
    return 'PSS totale: $size';
  }

  @override
  String get tipsAndSupport => 'Supporto';

  @override
  String get tipsRateTitle => 'Valutaci';

  @override
  String get tipsRateDescription =>
      'Lascia una recensione a 5 stelle e condividi il tuo feedback.';

  @override
  String get tipsRateAction => 'Apri Play Store';

  @override
  String get tipsCoffeeTitle => 'Offrimi un caffè';

  @override
  String get tipsCoffeeDescription =>
      'Motivami a mantenere questa app aggiornata.';

  @override
  String get tipsCoffeeAction => 'Offrimi un caffè';

  @override
  String get tipsContributeTitle => 'Contribuisci';

  @override
  String get tipsContributeDescription =>
      'Aiuta a tradurre o contribuisci a migliorare l\'app.';

  @override
  String get tipsContributeAction => 'Visualizza su GitHub';

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
