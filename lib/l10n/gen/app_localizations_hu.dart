// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian ('hu').
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Futó Szolgáltatások Figyelő';

  @override
  String get enjoyingApp => 'Tetszik az alkalmazás? Vegyél nekem egy kávét!';

  @override
  String get donate => 'Adományozás';

  @override
  String get searchApps => 'Alkalmazások keresése...';

  @override
  String get all => 'Mind';

  @override
  String get user => 'Felhasználói';

  @override
  String get system => 'Rendszer';

  @override
  String get closeSearch => 'Keresés bezárása';

  @override
  String get search => 'Keresés';

  @override
  String get autoUpdate => 'Automatikus frissítés (3s)';

  @override
  String get refresh => 'Frissítés';

  @override
  String get toggleTheme => 'Téma váltása';

  @override
  String get about => 'Névjegy';

  @override
  String get loading => 'Betöltés...';

  @override
  String get developer => 'Fejlesztő';

  @override
  String get email => 'E-mail';

  @override
  String get sourceCode => 'Forráskód';

  @override
  String get blogs => 'Blogok';

  @override
  String get buyMeCoffee => 'Vegyél nekem egy kávét';

  @override
  String get madeInBangladesh => 'Bangladesben készült';

  @override
  String get runningApp => 'Futó alkalmazás';

  @override
  String get stopWarning =>
      'Ez az alkalmazás nem állítható le biztonságosan. Ha leállítja, elveszítheti jelenlegi munkájának egy részét.';

  @override
  String get activeServices => 'Aktív szolgáltatások';

  @override
  String get shizukuRequired => 'Shizuku szükséges';

  @override
  String get shizukuRequiredMessage =>
      'Az alkalmazásnak Shizuku-ra van szüksége a futó szolgáltatások adatainak eléréséhez.';

  @override
  String get setupSteps => 'Beállítási lépések:';

  @override
  String get step1 => 'Telepítse a Shizuku alkalmazást a Play Áruházból vagy a GitHubról';

  @override
  String get step2 => 'Nyissa meg a Shizuku-t és indítsa el a szolgáltatást';

  @override
  String get step3 => 'Android 11+: Használjon vezeték nélküli hibakeresést';

  @override
  String get step4 => 'Android 10 és régebbi: Csatlakozzon PC-hez ADB-n keresztül';

  @override
  String get step5 => 'Térjen vissza ehhez az alkalmazáshoz és próbálja újra';

  @override
  String get quickStart => 'Gyors indítás (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Fejlesztői beállítások engedélyezése\n2. Vezeték nélküli hibakeresés engedélyezése\n3. Nyissa meg a Shizuku-t és koppintson a "Párosítás"-ra\n4. Kövesse a képernyőn megjelenő utasításokat';

  @override
  String get exitApp => 'Kilépés';

  @override
  String get retry => 'Újra';

  @override
  String get loadingServices => 'Szolgáltatások betöltése...';

  @override
  String get deviceMemory => 'Eszközmemória';

  @override
  String get noMatchingApps => 'Nincs egyező alkalmazás';

  @override
  String get noAppsFound => 'Nem találhatók alkalmazások';

  @override
  String get ofRam => 'RAM-ból';

  @override
  String get processAnd => 'folyamat és';

  @override
  String get services => 'Szolgáltatások';

  @override
  String get apps => 'Alkalmazások';

  @override
  String get used => 'Használt';

  @override
  String get free => 'Szabad';

  @override
  String get stopService => 'Szolgáltatás leállítása';

  @override
  String get stopAllServices => 'Összes szolgáltatás leállítása';

  @override
  String get stopServiceConfirm => 'Leállítja ezt a szolgáltatást?';

  @override
  String get stopAllServicesConfirm => 'Leállítja az alkalmazás összes szolgáltatását?';

  @override
  String get stopServiceWarning =>
      'Ez kényszerbezárja az alkalmazást. Elveszítheti a nem mentett adatokat.';

  @override
  String get serviceStopped => 'Szolgáltatás leállítva';

  @override
  String get allServicesStopped => 'Összes szolgáltatás leállítva';

  @override
  String get stopServiceError => 'Nem sikerült leállítani a szolgáltatást';

  @override
  String get cancel => 'Mégse';

  @override
  String get stop => 'Leállítás';

  @override
  String get permissionRequired => 'Engedély szükséges';

  @override
  String get permissionRequiredMessage =>
      'Shizuku engedély szükséges a futó szolgáltatások adatainak eléréséhez.';

  @override
  String get permissionSteps => 'Hogyan adja meg az engedélyt:';

  @override
  String get permissionStep1 => 'Nyissa meg a Shizuku alkalmazást';

  @override
  String get permissionStep2 => "Lépjen az 'Engedélyezett alkalmazások' vagy 'Engedélyek' menübe";

  @override
  String get permissionStep3 =>
      "Keresse meg a 'Futó Szolgáltatások Figyelő'-t és adja meg az engedélyt";

  @override
  String get permissionNote =>
      'Az engedély megadása előtt győződjön meg arról, hogy a Shizuku szolgáltatás fut.';

  @override
  String get openShizuku => 'Shizuku megnyitása';

  @override
  String get systemAppWarning =>
      '⚠️ FIGYELMEZTETÉS: Ez egy RENDSZERALKALMAZÁS. Leállítása meghibásodást vagy instabilitást okozhat az eszközön. Csak akkor folytassa, ha tudja, mit csinál!';

  @override
  String get runningServicesTitle => 'Futó rendszerszolgáltatások';

  @override
  String get openRunningServicesTooltip =>
      'Futó szolgáltatások megnyitása az Android beállításokban';

  @override
  String get error => 'Hiba';

  @override
  String get appInfoNotFound => 'Az alkalmazás adatai nem találhatók';

  @override
  String pageNotFound(String location) {
    return 'Az oldal nem található: $location';
  }

  @override
  String get package => 'Csomag';

  @override
  String get service => 'Szolgáltatás';

  @override
  String get process => 'Folyamat';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'RAM-használat';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => 'Előtér';

  @override
  String get foregroundId => 'Előtér azonosítója';

  @override
  String get startRequested => 'Indítás kérve';

  @override
  String get createdFromFg => 'Előtérből létrehozva';

  @override
  String get createTime => 'Létrehozás ideje';

  @override
  String get lastActivity => 'Utolsó tevékenység';

  @override
  String get baseDir => 'Alapkönyvtár';

  @override
  String get dataDir => 'Adatkönyvtár';

  @override
  String get type => 'Típus';

  @override
  String get systemApp => 'Rendszeralkalmazás';

  @override
  String get userApp => 'Felhasználói alkalmazás';

  @override
  String get rawOutput => 'Nyers kimenet';

  @override
  String get close => 'Bezárás';

  @override
  String get yes => 'Igen';

  @override
  String get no => 'Nem';

  @override
  String get connections => 'Kapcsolatok';

  @override
  String get flags => 'Jelzők';

  @override
  String get bound => 'Kötött';

  @override
  String get processRecord => 'Folyamatrekord';

  @override
  String get visible => 'Látható';

  @override
  String get capabilities => 'Képességek';

  @override
  String get active => 'Aktív';

  @override
  String get cached => 'Gyorsítótárban';

  @override
  String get noServicesFound => 'Nem találhatók szolgáltatások';

  @override
  String get ramCalculation => 'RAM-számítás';

  @override
  String get totalRam => 'Összes RAM';

  @override
  String get ramSources => 'Források';

  @override
  String get noRamDataAvailable =>
      'Nem állnak rendelkezésre RAM-adatok ehhez az alkalmazáshoz a rendszer memóriajelentésében.';

  @override
  String get ramCalculationExplanation =>
      'A RAM kiszámítása a rendszer memóriainformációiból történik. PID = Folyamatazonosító keresés, Folyamat = Folyamatnév keresés, LRU = Legutóbbi folyamatok listája.';

  @override
  String get playCommand => 'Parancs futtatása';

  @override
  String get copiedToClipboard => 'Vágólapra másolva';

  @override
  String get copy => 'Másolás';

  @override
  String get and => 'és';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count szolgáltatás',
      one: '1 szolgáltatás',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count folyamat',
      one: '1 folyamat',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount folyamat',
      one: '1 folyamat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount szolgáltatás',
      one: '1 szolgáltatás',
    );
    return '$_temp0 és $_temp1';
  }

  @override
  String get info => 'Infó';

  @override
  String get followSystem => 'Rendszer';

  @override
  String get contributors => 'Közreműködők';

  @override
  String contributionsCount(Object count) {
    return '$count hozzájárulás';
  }

  @override
  String get checkingPermissions => 'Engedélyek ellenőrzése...';

  @override
  String get shizukuNotRunning =>
      'A Shizuku nem fut. Kérjük, indítsa el a Shizuku alkalmazást.';

  @override
  String get permissionDeniedShizuku =>
      'Az engedély megtagadva. Kérjük, adja meg a Shizuku engedélyt.';

  @override
  String get failedToInitialize =>
      'Az inicializálás sikertelen. Kérjük, adja meg az engedélyt.';

  @override
  String get errorInitializingShizuku => 'Hiba a Shizuku inicializálásakor';

  @override
  String get loadingApps => 'Alkalmazások betöltése...';

  @override
  String get refreshedSuccessfully => 'Sikeresen frissítve';

  @override
  String get errorLoadingData => 'Hiba az adatok betöltésekor';

  @override
  String get failedToStopAllServices =>
      'Nem sikerült leállítani az összes szolgáltatást';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'Nem sikerült leállítani a(z) $serviceName szolgáltatást';
  }

  @override
  String errorPrefix(String error) {
    return 'Hiba: $error';
  }

  @override
  String get language => 'Nyelv';

  @override
  String get openGithubProfile => 'GitHub profil megnyitása';

  @override
  String get appInfoTooltip => 'Alkalmazás adatai';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => 'Legutóbbi hívó UID';

  @override
  String get appDetails => 'Alkalmazás részletei';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'Folyamat állapota';

  @override
  String get processStateFg => 'Előtér - Az alkalmazás jelenleg előtérben van';

  @override
  String get processStateVis =>
      'Látható - Az alkalmazásnak van látható tevékenysége, de nem előtérben';

  @override
  String get processStatePrev => 'Előző - Korábban használt előtéralkalmazás';

  @override
  String get processStatePrcp =>
      'Érzékelhető - Az alkalmazás olyat csinál, amiről a felhasználó tud';

  @override
  String get processStateSvcb => 'B szolgáltatás - Az alkalmazásnak van kötött szolgáltatása';

  @override
  String get processStateHome => 'Kezdőlap - Kezdőlap/Indítóalkalmazás';

  @override
  String get processStateHvy => 'Nehéz - Nehéz alkalmazásfolyamat';

  @override
  String get processStatePsvc =>
      'Állandó szolgáltatás - Az alkalmazásnak van állandó szolgáltatása';

  @override
  String get processStatePers => 'Állandó - Állandó rendszerfolyamat';

  @override
  String get processStateCchEmpty =>
      'Üres gyorsítótár - Gyorsítótárazott folyamat tevékenységek nélkül';

  @override
  String get processStateCchAct =>
      'Gyorsítótárazott tevékenység - Gyorsítótárazott folyamat tevékenységekkel';

  @override
  String get processStateCchClient =>
      'Gyorsítótárazott kliens - Gyorsítótárazott folyamat mint szolgáltatáskliens';

  @override
  String get processStateCch =>
      'Gyorsítótárban - A folyamat a memóriában gyorsítótárazva van';

  @override
  String get processStateBfgs =>
      'Kötött előtér-szolgáltatás - Előtér-szolgáltatáshoz kötve';

  @override
  String get processStateRcvr =>
      'Vevő - Az alkalmazás broadcast fogadót futtat';

  @override
  String get processStateTop =>
      'Tetején - Az alkalmazás a tevékenységverem tetején van';

  @override
  String get processStateBtop => 'Tetőhöz kötve - Felső alkalmazáshoz kötve';

  @override
  String get processStateImpf => 'Fontos előtér - Fontos előtérfolyamat';

  @override
  String get processStateImpb => 'Fontos háttér - Fontos háttérfolyamat';

  @override
  String processStateUnknown(String state) {
    return 'Folyamat állapota: $state';
  }

  @override
  String get workingMode => 'Munkamód';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Munkamód kiválasztása';

  @override
  String get available => 'Elérhető';

  @override
  String get notAvailable => 'Nem elérhető';

  @override
  String get modeNotAvailable => 'Ez a mód nem elérhető';

  @override
  String get noModeAvailable => 'Nincs elérhető engedélymód';

  @override
  String get commandLogs => 'Parancsnapló';

  @override
  String get commandOutput => 'Parancs kimenete';


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
  String get noCommandLogs => 'Még nem futottak parancsok';

  @override
  String get clearLogs => 'Napló törlése';

  @override
  String get clearLogsConfirm => 'Biztosan törli az összes parancsnaplót?';

  @override
  String get executedAt => 'Végrehajtva:';

  @override
  String get command => 'Parancs';

  @override
  String get noOutput => 'Nincs kimenet';

  @override
  String get executeCommand => 'Végrehajtás';

  @override
  String get processes => 'Folyamatok';

  @override
  String get processesDescription =>
      'Az alkalmazás összes futó folyamata a memóriainformációkból.';

  @override
  String get noProcessesFound => 'Nem találhatók folyamatok';

  @override
  String get usedBreakdown => 'Használati részletezés';

  @override
  String get freeBreakdown => 'Szabad részletezés';

  @override
  String get other => 'Egyéb';

  @override
  String get usedPss => 'Használt PSS';

  @override
  String get kernel => 'Kernel';

  @override
  String get cachedPss => 'Gyorsítótárazott PSS';

  @override
  String get cachedKernel => 'Gyorsítótárazott kernel';

  @override
  String get actualFree => 'Valóban szabad';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'Elveszett RAM';

  @override
  String get zramPhysical => 'Fizikai ZRAM';

  @override
  String get zramSwapUsed => 'Használt ZRAM csere';

  @override
  String get zramTotalSwap => 'Összes ZRAM csere';

  @override
  String get oomThreshold => 'OOM küszöbérték';

  @override
  String get restoreLimit => 'Visszaállítási korlát';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Memóriaküszöbök';

  @override
  String get boundServiceCannotStop =>
      'Ez a szolgáltatás egy másik folyamathoz van kötve, és nem állítható le közvetlenül. Ehelyett leállíthatja az egész alkalmazást.';

  @override
  String get memoryInfo => 'Memória-információ';

  @override
  String get viewRawOutput => 'Nyers megtekintése';

  @override
  String get hideRawOutput => 'Nyers elrejtése';

  @override
  String get compareWithOther => 'Összehasonlítás';

  @override
  String get memoryCategories => 'Memóriakategóriák';

  @override
  String get appSummary => 'Alkalmazás összefoglalója';

  @override
  String get objects => 'Objektumok';

  @override
  String get memoryComparison => 'Memória-összehasonlítás';

  @override
  String get selectAppToCompare => 'Válasszon alkalmazást összehasonlításhoz';

  @override
  String get selectApp => 'Alkalmazás kiválasztása...';

  @override
  String get totalPss => 'Összes PSS';

  @override
  String get totalRss => 'Összes RSS';

  @override
  String get javaHeap => 'Java heap';

  @override
  String get nativeHeap => 'Natív heap';

  @override
  String get code => 'Kód';

  @override
  String get graphics => 'Grafika';

  @override
  String get current => 'Aktuális';

  @override
  String get allApps => 'Mind';

  @override
  String get userApps => 'Felhasználói';

  @override
  String get systemApps => 'Rendszer';

  @override
  String get compareWith => 'Összehasonlítás ezzel';

  @override
  String get stats => 'Statisztikák';

  @override
  String get statsLiveRamArea => 'Élő rendszer-RAM';

  @override
  String get statsLiveRamAreaSubtitle => 'Időbeli RAM-használat';

  @override
  String get statsRamDistribution => 'Rendszer-RAM-elosztás';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Összesen: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'Felhasználói vs rendszeralkalmazások RAM';

  @override
  String get statsAppStateDistribution => 'Alkalmazásállapot-eloszlás';

  @override
  String get statsActive => 'Aktív';

  @override
  String get statsBackground => 'Háttér';

  @override
  String get statsCached => 'Gyorsítótárban';

  @override
  String statsAppsCount(int count) {
    return '$count alkalmazás';
  }

  @override
  String get statsSystemVsUserAnalysis => 'Rendszer és felhasználói elemzés';

  @override
  String get statsAppCount => 'Alkalmazások száma';

  @override
  String get statsTotalRam => 'Összes RAM';

  @override
  String get statsPerformance => 'Teljesítmény';

  @override
  String get statsRamDistributionScatter => 'RAM-elosztás szórása';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: Alkalmazásindex';

  @override
  String get statsTopRamConsumers => 'Legtöbb RAM-ot használó alkalmazások';

  @override
  String get statsServicesVsRamCorrelation => 'Szolgáltatások és RAM-korreláció';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: Szolgáltatások száma, Buborék: Folyamatok száma';

  @override
  String get statsRamHistogram => 'RAM-frekvenciaoszlogram';

  @override
  String get statsRamHistogramSubtitle => 'Alkalmazások száma memóriaméret szerint';

  @override
  String get statsMemoryHeatmap => 'Memória hőtérkép';

  @override
  String get statsMemoryHeatmapSubtitle =>
      'Összes alkalmazás RAM-intenzitás szerint rendezve';

  @override
  String get statsTopAppsRelativeImpact => 'Legjobb alkalmazások relatív hatása';

  @override
  String get statsGanttSubtitle => 'Gantt-stílusú RAM-arány vizualizáció';

  @override
  String get statsStackedAreaChart => 'RAM-részletezés idővel';

  @override
  String get statsStackedAreaSubtitle => 'Felhasználói, rendszer- és kernel RAM';

  @override
  String get statsPolarChart => 'Folyamatállapot-eloszlás';

  @override
  String get statsPolarSubtitle => 'Alkalmazásállapotok poláris nézete';

  @override
  String get statsTreemap => 'RAM-elosztás fa diagram';

  @override
  String get statsTreemapSubtitle => 'Arányos RAM-használat alkalmazásonként';

  @override
  String get statsFunnelChart => 'RAM-használati szintek';

  @override
  String get statsFunnelSubtitle => 'Alkalmazások memóriaméret szerint csoportosítva';

  @override
  String get statsWaterfallChart => 'RAM-allokációs vízesés';

  @override
  String get statsWaterfallSubtitle => 'Bontás összestől összetevőkig';

  @override
  String get statsGaugeChart => 'RAM-használati mutató';

  @override
  String get statsGaugeSubtitle => 'Általános rendszermemória-kihasználtság';

  @override
  String get statsTiny => 'Apró';

  @override
  String get statsSmall => 'Kicsi';

  @override
  String get statsMedium => 'Közepes';

  @override
  String get statsLarge => 'Nagy';

  @override
  String get statsHuge => 'Óriás';

  @override
  String get statsNoData => 'Nincs elérhető adat';

  @override
  String get statsWaitingForData => 'Adatokra várakozás...';

  @override
  String get statsRamDistributionPie => 'Rendszer-RAM-elosztás';

  @override
  String get statsRamDistributionSubtitle => 'Használt, szabad és ZRAM';

  @override
  String get statsUsed => 'Használt';

  @override
  String get statsFree => 'Szabad';

  @override
  String get statsUserVsSystemPie => 'Felhasználói vs rendszeralkalmazások RAM';

  @override
  String get statsUserVsSystemSubtitle =>
      'Felhasználói és rendszeralkalmazások memóriájának összehasonlítása';

  @override
  String get statsProcessStateBar => 'Alkalmazásállapot-eloszlás';

  @override
  String get statsProcessStateSubtitle =>
      'Aktív, háttér- és gyorsítótárazott alkalmazások';

  @override
  String get statsScatterChart => 'RAM-elosztás szórása';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: Alkalmazásindex';

  @override
  String get core => 'Rendszermag';

  @override
  String get coreAppInfoLimited =>
      'Korlátozott információ elérhető a rendszerfolyamatokhoz';

  @override
  String get showCoreApps => 'Rendszermagalkalmazások megjelenítése';

  @override
  String get usefulCommands => 'Hasznos parancsok';

  @override
  String get commands => 'Parancsok';

  @override
  String get addCommand => 'Parancs hozzáadása';

  @override
  String get placeholders => 'Helyőrzők';

  @override
  String get commandTitle => 'Cím';

  @override
  String get commandDescription => 'Leírás';

  @override
  String get reExecute => 'Újra végrehajtás';

  @override
  String get statsProcessVsRamLine => 'Folyamat és RAM korreláció';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Kék: RAM, Szaggatott: Folyamatok száma';

  @override
  String get statsUserVsSystemBar => 'Felhasználói és rendszer összehasonlítás';

  @override
  String get statsUserVsSystemBarSubtitle =>
      'Alkalmazások száma, összes RAM, átlagos RAM';

  @override
  String get statsRamTrendScatter => 'RAM trendelemzés';

  @override
  String get statsRamTrendScatterSubtitle => 'Szolgáltatások és RAM trendvonallal';

  @override
  String get statsServicesVsProcesses => 'Szolgáltatások és folyamatok';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Korreláció a szolgáltatások és folyamatok száma között';

  @override
  String get statsProcessStateRam => 'RAM folyamatállapot szerint';

  @override
  String get statsProcessStateRamSubtitle =>
      'Átlagos RAM-használat folyamatállapotonként';

  @override
  String get myCommands => 'Saját parancsok';

  @override
  String get defaultCommands => 'Alapértelmezett parancsok';

  @override
  String get resetDefaults => 'Alapértelmezések visszaállítása';

  @override
  String get memoryDistribution => 'Memóriaelosztás';

  @override
  String get memoryProfileComparison => 'Memóriaprofil-összehasonlítás';

  @override
  String get stack => 'Verem';

  @override
  String get privateOther => 'Egyéb privát';

  @override
  String get unknown => 'Ismeretlen';

  @override
  String totalPssLabel(String size) {
    return 'Összes PSS: $size';
  }

  @override
  String get tipsAndSupport => 'Támogatás';

  @override
  String get tipsRateTitle => 'Értékelje az alkalmazást';

  @override
  String get tipsRateDescription =>
      'Adjon 5 csillagos értékelést és ossza meg visszajelzését.';

  @override
  String get tipsRateAction => 'Play Áruház megnyitása';

  @override
  String get tipsCoffeeTitle => 'Vegyél nekem egy kávét';

  @override
  String get tipsCoffeeDescription =>
      'Motiválj arra, hogy naprakészen tartsam az alkalmazást.';

  @override
  String get tipsCoffeeAction => 'Vegyél nekem egy kávét';

  @override
  String get tipsContributeTitle => 'Közreműködés';

  @override
  String get tipsContributeDescription =>
      'Segítsen a fordításban vagy járuljon hozzá az alkalmazás fejlesztéséhez.';

  @override
  String get tipsContributeAction => 'Megtekintés a GitHubon';

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
