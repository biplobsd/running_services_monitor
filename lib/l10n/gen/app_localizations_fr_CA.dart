// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French Canada ('fr_CA').
class AppLocalizationsFrCa extends AppLocalizations {
  AppLocalizationsFrCa([String locale = 'fr_CA']) : super(locale);

  @override
  String get appTitle => "Moniteur de services en cours d'exécution";

  @override
  String get enjoyingApp => "Vous aimez l'application? Offrez-moi un café!";

  @override
  String get donate => 'Faire un don';

  @override
  String get searchApps => 'Rechercher des applications...';

  @override
  String get all => 'Tout';

  @override
  String get user => 'Utilisateur';

  @override
  String get system => 'Système';

  @override
  String get closeSearch => 'Fermer la recherche';

  @override
  String get search => 'Rechercher';

  @override
  String get autoUpdate => 'Mise à jour auto (3s)';

  @override
  String get refresh => 'Actualiser';

  @override
  String get toggleTheme => 'Changer de thème';

  @override
  String get about => 'À propos';

  @override
  String get loading => 'Chargement...';

  @override
  String get developer => 'Développeur';

  @override
  String get email => 'Courriel';

  @override
  String get sourceCode => 'Code source';

  @override
  String get blogs => 'Blogues';

  @override
  String get buyMeCoffee => 'Offrez-moi un café';

  @override
  String get madeInBangladesh => 'Fabriqué au Bangladesh';

  @override
  String get runningApp => 'Application en cours';

  @override
  String get stopWarning =>
      "Cette application ne peut pas être arrêtée en toute sécurité. Si vous l'arrêtez, vous pourriez perdre une partie de votre travail actuel.";

  @override
  String get activeServices => 'Services actifs';

  @override
  String get shizukuRequired => 'Shizuku requis';

  @override
  String get shizukuRequiredMessage =>
      "Cette application nécessite Shizuku pour accéder aux informations sur les services en cours d'exécution.";

  @override
  String get setupSteps => 'Étapes de configuration:';

  @override
  String get step1 => "Installer l'application Shizuku depuis le Play Store ou GitHub";

  @override
  String get step2 => 'Ouvrir Shizuku et démarrer le service';

  @override
  String get step3 => 'Pour Android 11+: Utiliser le débogage sans fil';

  @override
  String get step4 => 'Pour Android 10 et inférieur: Se connecter au PC via ADB';

  @override
  String get step5 => 'Revenir à cette application et réessayer';

  @override
  String get quickStart => 'Démarrage rapide (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Activer les Options pour développeurs\n2. Activer le débogage sans fil\n3. Ouvrir Shizuku et appuyer sur "Associer"\n4. Suivre les instructions à l\'écran';

  @override
  String get exitApp => "Quitter l'application";

  @override
  String get retry => 'Réessayer';

  @override
  String get loadingServices => 'Chargement des services...';

  @override
  String get deviceMemory => "Mémoire de l'appareil";

  @override
  String get noMatchingApps => 'Aucune application correspondante';

  @override
  String get noAppsFound => 'Aucune application trouvée';

  @override
  String get ofRam => 'de RAM';

  @override
  String get processAnd => 'processus et';

  @override
  String get services => 'Services';

  @override
  String get apps => 'Applications';

  @override
  String get used => 'Utilisée';

  @override
  String get free => 'Libre';

  @override
  String get stopService => 'Arrêter le service';

  @override
  String get stopAllServices => 'Arrêter tous les services';

  @override
  String get stopServiceConfirm => 'Arrêter ce service?';

  @override
  String get stopAllServicesConfirm => 'Arrêter tous les services de cette application?';

  @override
  String get stopServiceWarning =>
      "Ceci forcera l'arrêt de l'application. Vous pourriez perdre des données non sauvegardées.";

  @override
  String get serviceStopped => 'Service arrêté';

  @override
  String get allServicesStopped => 'Tous les services arrêtés';

  @override
  String get stopServiceError => "Impossible d'arrêter le service";

  @override
  String get cancel => 'Annuler';

  @override
  String get stop => 'Arrêter';

  @override
  String get permissionRequired => 'Permission requise';

  @override
  String get permissionRequiredMessage =>
      "La permission Shizuku est requise pour accéder aux informations sur les services en cours d'exécution.";

  @override
  String get permissionSteps => 'Comment accorder la permission:';

  @override
  String get permissionStep1 => "Ouvrir l'application Shizuku";

  @override
  String get permissionStep2 => "Aller dans 'Applications autorisées' ou 'Permissions'";

  @override
  String get permissionStep3 => "Trouver 'Moniteur de services' et accorder la permission";

  @override
  String get permissionNote =>
      "Assurez-vous que le service Shizuku est en cours d'exécution avant d'accorder la permission.";

  @override
  String get openShizuku => 'Ouvrir Shizuku';

  @override
  String get systemAppWarning =>
      "⚠️ AVERTISSEMENT: Il s'agit d'une APPLICATION SYSTÈME. L'arrêter peut provoquer un dysfonctionnement ou une instabilité de votre appareil. Ne procédez que si vous savez ce que vous faites!";

  @override
  String get runningServicesTitle => "Services système en cours d'exécution";

  @override
  String get openRunningServicesTooltip =>
      'Ouvrir les services en cours dans les paramètres Android';

  @override
  String get error => 'Erreur';

  @override
  String get appInfoNotFound => "Informations sur l'application introuvables";

  @override
  String pageNotFound(String location) {
    return 'Page introuvable: $location';
  }

  @override
  String get package => 'Paquet';

  @override
  String get service => 'Service';

  @override
  String get process => 'Processus';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'Utilisation de la RAM';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => 'Premier plan';

  @override
  String get foregroundId => 'ID premier plan';

  @override
  String get startRequested => 'Démarrage demandé';

  @override
  String get createdFromFg => 'Créé depuis le premier plan';

  @override
  String get createTime => 'Heure de création';

  @override
  String get lastActivity => 'Dernière activité';

  @override
  String get baseDir => 'Répertoire de base';

  @override
  String get dataDir => 'Répertoire de données';

  @override
  String get type => 'Type';

  @override
  String get systemApp => 'Application système';

  @override
  String get userApp => 'Application utilisateur';

  @override
  String get rawOutput => 'Sortie brute';

  @override
  String get close => 'Fermer';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get connections => 'Connexions';

  @override
  String get flags => 'Indicateurs';

  @override
  String get bound => 'Lié';

  @override
  String get processRecord => 'Enregistrement de processus';

  @override
  String get visible => 'Visible';

  @override
  String get capabilities => 'Capacités';

  @override
  String get active => 'Actif';

  @override
  String get cached => 'En cache';

  @override
  String get noServicesFound => 'Aucun service trouvé';

  @override
  String get ramCalculation => 'Calcul de la RAM';

  @override
  String get totalRam => 'RAM totale';

  @override
  String get ramSources => 'Sources';

  @override
  String get noRamDataAvailable =>
      'Aucune donnée RAM disponible pour cette application dans le rapport de mémoire système.';

  @override
  String get ramCalculationExplanation =>
      "La RAM est calculée à partir des informations de mémoire système. PID = Recherche d'ID de processus, Processus = Recherche de nom de processus, LRU = Liste des processus récents.";

  @override
  String get playCommand => 'Exécuter la commande';

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get copy => 'Copier';

  @override
  String get and => 'et';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count services',
      one: '1 service',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count processus',
      one: '1 processus',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount processus',
      one: '1 processus',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount services',
      one: '1 service',
    );
    return '$_temp0 et $_temp1';
  }

  @override
  String get info => 'Info';

  @override
  String get followSystem => 'Système';

  @override
  String get contributors => 'Contributeurs';

  @override
  String contributionsCount(Object count) {
    return '$count contributions';
  }

  @override
  String get checkingPermissions => 'Vérification des permissions...';

  @override
  String get shizukuNotRunning =>
      "Shizuku n'est pas en cours d'exécution. Veuillez démarrer l'application Shizuku.";

  @override
  String get permissionDeniedShizuku =>
      'Permission refusée. Veuillez accorder la permission Shizuku.';

  @override
  String get failedToInitialize =>
      "Échec de l'initialisation. Veuillez accorder la permission.";

  @override
  String get errorInitializingShizuku => "Erreur lors de l'initialisation de Shizuku";

  @override
  String get loadingApps => 'Chargement des applications...';

  @override
  String get refreshedSuccessfully => 'Actualisé avec succès';

  @override
  String get errorLoadingData => 'Erreur lors du chargement des données';

  @override
  String get failedToStopAllServices => "Impossible d'arrêter tous les services";

  @override
  String failedToStopServiceName(String serviceName) {
    return "Impossible d'arrêter le service $serviceName";
  }

  @override
  String errorPrefix(String error) {
    return 'Erreur: $error';
  }

  @override
  String get language => 'Langue';

  @override
  String get openGithubProfile => 'Ouvrir le profil GitHub';

  @override
  String get appInfoTooltip => 'Info application';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => 'UID appelant récent';

  @override
  String get appDetails => "Détails de l'application";

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'État du processus';

  @override
  String get processStateFg =>
      "Premier plan - L'application est actuellement au premier plan";

  @override
  String get processStateVis =>
      "Visible - L'application a une activité visible mais pas au premier plan";

  @override
  String get processStatePrev => 'Précédent - Application au premier plan utilisée précédemment';

  @override
  String get processStatePrcp =>
      "Perceptible - L'application fait quelque chose dont l'utilisateur est conscient";

  @override
  String get processStateSvcb => "Service B - L'application a un service lié";

  @override
  String get processStateHome => 'Accueil - Application Accueil/Lanceur';

  @override
  String get processStateHvy => "Poids lourd - Processus d'application lourd";

  @override
  String get processStatePsvc =>
      "Service persistant - L'application a un service persistant";

  @override
  String get processStatePers => 'Persistant - Processus système persistant';

  @override
  String get processStateCchEmpty =>
      'Cache vide - Processus en cache sans activités';

  @override
  String get processStateCchAct =>
      'Activité en cache - Processus en cache avec activités';

  @override
  String get processStateCchClient =>
      'Client en cache - Processus en cache comme client de service';

  @override
  String get processStateCch =>
      'En cache - Le processus est mis en cache en mémoire';

  @override
  String get processStateBfgs =>
      'Service au premier plan lié - Lié à un service au premier plan';

  @override
  String get processStateRcvr =>
      "Récepteur - L'application exécute un récepteur de diffusion";

  @override
  String get processStateTop =>
      "Sommet - L'application est au sommet de la pile d'activités";

  @override
  String get processStateBtop => 'Lié au sommet - Lié à une application au sommet';

  @override
  String get processStateImpf =>
      'Premier plan important - Processus de premier plan important';

  @override
  String get processStateImpb =>
      "Arrière-plan important - Processus d'arrière-plan important";

  @override
  String processStateUnknown(String state) {
    return 'État du processus: $state';
  }

  @override
  String get workingMode => 'Mode de fonctionnement';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Sélectionner le mode de fonctionnement';

  @override
  String get available => 'Disponible';

  @override
  String get notAvailable => 'Non disponible';

  @override
  String get modeNotAvailable => "Ce mode n'est pas disponible";

  @override
  String get noModeAvailable => 'Aucun mode de permission disponible';

  @override
  String get commandLogs => 'Journaux de commandes';

  @override
  String get commandOutput => 'Sortie de commande';

  @override
  String get noCommandLogs => "Aucune commande exécutée pour l'instant";

  @override
  String get clearLogs => 'Effacer les journaux';

  @override
  String get clearLogsConfirm =>
      'Voulez-vous vraiment effacer tous les journaux de commandes?';

  @override
  String get executedAt => 'Exécuté à';

  @override
  String get command => 'Commande';

  @override
  String get noOutput => 'Aucune sortie';

  @override
  String get executeCommand => 'Exécuter';

  @override
  String get processes => 'Processus';

  @override
  String get processesDescription =>
      "Tous les processus en cours d'exécution pour cette application à partir des informations de mémoire.";

  @override
  String get noProcessesFound => 'Aucun processus trouvé';

  @override
  String get usedBreakdown => "Détail de l'utilisation";

  @override
  String get freeBreakdown => 'Détail du libre';

  @override
  String get other => 'Autre';

  @override
  String get usedPss => 'PSS utilisé';

  @override
  String get kernel => 'Noyau';

  @override
  String get cachedPss => 'PSS en cache';

  @override
  String get cachedKernel => 'Noyau en cache';

  @override
  String get actualFree => 'Réellement libre';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'RAM perdue';

  @override
  String get zramPhysical => 'ZRAM physique';

  @override
  String get zramSwapUsed => 'ZRAM swap utilisé';

  @override
  String get zramTotalSwap => 'ZRAM swap total';

  @override
  String get oomThreshold => 'Seuil OOM';

  @override
  String get restoreLimit => 'Limite de restauration';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Seuils de mémoire';

  @override
  String get boundServiceCannotStop =>
      "Ce service est lié par un autre processus et ne peut pas être arrêté directement. Vous pouvez arrêter toute l'application à la place.";

  @override
  String get memoryInfo => 'Info mémoire';

  @override
  String get viewRawOutput => 'Voir brut';

  @override
  String get hideRawOutput => 'Masquer brut';

  @override
  String get compareWithOther => 'Comparer';

  @override
  String get memoryCategories => 'Catégories de mémoire';

  @override
  String get appSummary => "Résumé de l'application";

  @override
  String get objects => 'Objets';

  @override
  String get memoryComparison => 'Comparaison de mémoire';

  @override
  String get selectAppToCompare => 'Sélectionner une application à comparer';

  @override
  String get selectApp => 'Sélectionner une application...';

  @override
  String get totalPss => 'PSS total';

  @override
  String get totalRss => 'RSS total';

  @override
  String get javaHeap => 'Tas Java';

  @override
  String get nativeHeap => 'Tas natif';

  @override
  String get code => 'Code';

  @override
  String get graphics => 'Graphiques';

  @override
  String get current => 'Actuel';

  @override
  String get allApps => 'Tout';

  @override
  String get userApps => 'Utilisateur';

  @override
  String get systemApps => 'Système';

  @override
  String get compareWith => 'Comparer avec';

  @override
  String get stats => 'Statistiques';

  @override
  String get statsLiveRamArea => 'RAM système en direct';

  @override
  String get statsLiveRamAreaSubtitle => 'RAM utilisée dans le temps';

  @override
  String get statsRamDistribution => 'Distribution de la RAM système';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Total: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'RAM: Applications utilisateur vs système';

  @override
  String get statsAppStateDistribution => "Distribution des états d'application";

  @override
  String get statsActive => 'Actives';

  @override
  String get statsBackground => 'Arrière-plan';

  @override
  String get statsCached => 'En cache';

  @override
  String statsAppsCount(int count) {
    return '$count applications';
  }

  @override
  String get statsSystemVsUserAnalysis => 'Analyse système vs utilisateur';

  @override
  String get statsAppCount => "Nombre d'applications";

  @override
  String get statsTotalRam => 'RAM totale';

  @override
  String get statsPerformance => 'Performance';

  @override
  String get statsRamDistributionScatter => 'Nuage de points de distribution RAM';

  @override
  String get statsRamDistributionScatterSubtitle => "Y: RAM, X: Index d'application";

  @override
  String get statsTopRamConsumers => 'Principaux consommateurs de RAM';

  @override
  String get statsServicesVsRamCorrelation => 'Corrélation services vs RAM';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: Nombre de services, Bulle: Nombre de processus';

  @override
  String get statsRamHistogram => 'Histogramme de fréquence RAM';

  @override
  String get statsRamHistogramSubtitle => "Nombre d'applications par taille de mémoire";

  @override
  String get statsMemoryHeatmap => 'Carte thermique de mémoire';

  @override
  String get statsMemoryHeatmapSubtitle =>
      'Toutes les applications triées par intensité RAM';

  @override
  String get statsTopAppsRelativeImpact => 'Impact relatif des meilleures applications';

  @override
  String get statsGanttSubtitle => 'Visualisation de type Gantt de la part RAM';

  @override
  String get statsStackedAreaChart => 'Décomposition de la RAM dans le temps';

  @override
  String get statsStackedAreaSubtitle => 'RAM utilisateur, système et noyau';

  @override
  String get statsPolarChart => 'Distribution des états de processus';

  @override
  String get statsPolarSubtitle => "Vue polaire des états d'application";

  @override
  String get statsTreemap => 'Carte arborescente de distribution RAM';

  @override
  String get statsTreemapSubtitle => 'Utilisation proportionnelle de la RAM par application';

  @override
  String get statsFunnelChart => "Niveaux d'utilisation de la RAM";

  @override
  String get statsFunnelSubtitle => 'Applications regroupées par taille de mémoire';

  @override
  String get statsWaterfallChart => "Cascade d'allocation de la RAM";

  @override
  String get statsWaterfallSubtitle => 'Décomposition du total aux composants';

  @override
  String get statsGaugeChart => "Jauge d'utilisation de la RAM";

  @override
  String get statsGaugeSubtitle => 'Utilisation globale de la mémoire système';

  @override
  String get statsTiny => 'Minuscule';

  @override
  String get statsSmall => 'Petite';

  @override
  String get statsMedium => 'Moyenne';

  @override
  String get statsLarge => 'Grande';

  @override
  String get statsHuge => 'Énorme';

  @override
  String get statsNoData => 'Aucune donnée disponible';

  @override
  String get statsWaitingForData => 'En attente de données...';

  @override
  String get statsRamDistributionPie => 'Distribution de la RAM système';

  @override
  String get statsRamDistributionSubtitle => 'Utilisée, Libre et ZRAM';

  @override
  String get statsUsed => 'Utilisée';

  @override
  String get statsFree => 'Libre';

  @override
  String get statsUserVsSystemPie => 'RAM: Applications utilisateur vs système';

  @override
  String get statsUserVsSystemSubtitle =>
      'Comparer la mémoire des applications utilisateur et système';

  @override
  String get statsProcessStateBar => "Distribution des états d'application";

  @override
  String get statsProcessStateSubtitle =>
      'Applications actives, en arrière-plan et en cache';

  @override
  String get statsScatterChart => 'Nuage de points de distribution RAM';

  @override
  String get statsScatterSubtitle => "Y: RAM (Mo), X: Index d'application";

  @override
  String get core => 'Cœur';

  @override
  String get coreAppInfoLimited =>
      'Informations limitées disponibles pour les processus système';

  @override
  String get showCoreApps => 'Afficher les applications cœur';

  @override
  String get usefulCommands => 'Commandes utiles';

  @override
  String get commands => 'Commandes';

  @override
  String get addCommand => 'Ajouter une commande';

  @override
  String get placeholders => 'Espaces réservés';

  @override
  String get commandTitle => 'Titre';

  @override
  String get commandDescription => 'Description';

  @override
  String get reExecute => 'Réexécuter';

  @override
  String get statsProcessVsRamLine => 'Corrélation processus vs RAM';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Bleu: RAM, Pointillé: Nombre de processus';

  @override
  String get statsUserVsSystemBar => 'Comparaison utilisateur vs système';

  @override
  String get statsUserVsSystemBarSubtitle =>
      "Nombre d'applis, RAM totale, RAM moyenne";

  @override
  String get statsRamTrendScatter => 'Analyse de tendance RAM';

  @override
  String get statsRamTrendScatterSubtitle => 'Services vs RAM avec ligne de tendance';

  @override
  String get statsServicesVsProcesses => 'Services vs processus';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Corrélation entre les nombres de services et de processus';

  @override
  String get statsProcessStateRam => 'RAM par état de processus';

  @override
  String get statsProcessStateRamSubtitle =>
      'Utilisation moyenne de la RAM par état de processus';

  @override
  String get myCommands => 'Mes commandes';

  @override
  String get defaultCommands => 'Commandes par défaut';

  @override
  String get resetDefaults => 'Rétablir les paramètres par défaut';

  @override
  String get memoryDistribution => 'Distribution de la mémoire';

  @override
  String get memoryProfileComparison => 'Comparaison de profil mémoire';

  @override
  String get stack => 'Pile';

  @override
  String get privateOther => 'Autre privé';

  @override
  String get unknown => 'Inconnu';

  @override
  String totalPssLabel(String size) {
    return 'PSS total: $size';
  }

  @override
  String get tipsAndSupport => 'Assistance';

  @override
  String get tipsRateTitle => 'Évaluez-nous';

  @override
  String get tipsRateDescription =>
      'Donnez une évaluation 5 étoiles et partagez vos commentaires.';

  @override
  String get tipsRateAction => 'Ouvrir le Play Store';

  @override
  String get tipsCoffeeTitle => 'Offrez-moi un café';

  @override
  String get tipsCoffeeDescription => 'Motivez-moi à garder cette application à jour.';

  @override
  String get tipsCoffeeAction => 'Offrez-moi un café';

  @override
  String get tipsContributeTitle => 'Contribuer';

  @override
  String get tipsContributeDescription =>
      "Aidez à traduire ou contribuez à améliorer l'application.";

  @override
  String get tipsContributeAction => 'Voir sur GitHub';

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
