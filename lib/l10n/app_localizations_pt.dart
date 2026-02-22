// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Monitor de Serviços em Execução';

  @override
  String get enjoyingApp => 'Gostando do app? Considere me pagar um café!';

  @override
  String get donate => 'Doar';

  @override
  String get searchApps => 'Pesquisar apps...';

  @override
  String get all => 'Todos';

  @override
  String get user => 'Usuário';

  @override
  String get system => 'Sistema';

  @override
  String get closeSearch => 'Fechar Pesquisa';

  @override
  String get search => 'Pesquisar';

  @override
  String get autoUpdate => 'Atualização Automática (3s)';

  @override
  String get refresh => 'Atualizar';

  @override
  String get toggleTheme => 'Alternar Tema';

  @override
  String get about => 'Sobre';

  @override
  String get loading => 'Carregando...';

  @override
  String get developer => 'Desenvolvedor';

  @override
  String get email => 'E-mail';

  @override
  String get sourceCode => 'Código Fonte';

  @override
  String get blogs => 'Blogs';

  @override
  String get buyMeCoffee => 'Me Pague um Café';

  @override
  String get madeInBangladesh => 'Feito em Bangladesh';

  @override
  String get runningApp => 'App em execução';

  @override
  String get stopWarning =>
      'Este app não pode ser parado com segurança. Se você pará-lo, poderá perder parte do seu trabalho atual.';

  @override
  String get activeServices => 'Serviços Ativos';

  @override
  String get shizukuRequired => 'Shizuku Necessário';

  @override
  String get shizukuRequiredMessage =>
      'Este app requer o Shizuku para acessar informações dos serviços em execução.';

  @override
  String get setupSteps => 'Etapas de Configuração:';

  @override
  String get step1 => 'Instale o app Shizuku da Play Store ou GitHub';

  @override
  String get step2 => 'Abra o Shizuku e inicie o serviço';

  @override
  String get step3 => 'Para Android 11+: Use a Depuração Sem Fio';

  @override
  String get step4 => 'Para Android 10 e inferior: Conecte ao PC via ADB';

  @override
  String get step5 => 'Volte a este app e tente novamente';

  @override
  String get quickStart => 'Início Rápido (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Ative as Opções do Desenvolvedor\n2. Ative a Depuração Sem Fio\n3. Abra o Shizuku e toque em \"Parear\"\n4. Siga as instruções na tela';

  @override
  String get exitApp => 'Sair do App';

  @override
  String get retry => 'Tentar Novamente';

  @override
  String get loadingServices => 'Carregando serviços...';

  @override
  String get deviceMemory => 'Memória do dispositivo';

  @override
  String get noMatchingApps => 'Nenhum app correspondente';

  @override
  String get noAppsFound => 'Nenhum app encontrado';

  @override
  String get ofRam => 'de RAM';

  @override
  String get processAnd => 'processo e';

  @override
  String get services => 'Serviços';

  @override
  String get apps => 'Apps';

  @override
  String get used => 'Usado';

  @override
  String get free => 'Livre';

  @override
  String get stopService => 'Parar Serviço';

  @override
  String get stopAllServices => 'Parar Todos os Serviços';

  @override
  String get stopServiceConfirm => 'Parar este serviço?';

  @override
  String get stopAllServicesConfirm => 'Parar todos os serviços deste app?';

  @override
  String get stopServiceWarning =>
      'Isso forçará o encerramento do app. Você pode perder dados não salvos.';

  @override
  String get serviceStopped => 'Serviço parado';

  @override
  String get allServicesStopped => 'Todos os serviços parados';

  @override
  String get stopServiceError => 'Falha ao parar o serviço';

  @override
  String get cancel => 'Cancelar';

  @override
  String get stop => 'Parar';

  @override
  String get permissionRequired => 'Permissão Necessária';

  @override
  String get permissionRequiredMessage =>
      'A permissão do Shizuku é necessária para acessar informações dos serviços em execução.';

  @override
  String get permissionSteps => 'Como Conceder Permissão:';

  @override
  String get permissionStep1 => 'Abra o app Shizuku';

  @override
  String get permissionStep2 =>
      'Vá para \'Apps Autorizados\' ou \'Permissões\'';

  @override
  String get permissionStep3 =>
      'Encontre \'Running Services Monitor\' e conceda permissão';

  @override
  String get permissionNote =>
      'Certifique-se de que o serviço Shizuku esteja em execução antes de conceder a permissão.';

  @override
  String get openShizuku => 'Abrir Shizuku';

  @override
  String get systemAppWarning =>
      '⚠️ AVISO: Este é um APP DO SISTEMA. Pará-lo pode causar mau funcionamento ou instabilidade no seu dispositivo. Só prossiga se você souber o que está fazendo!';

  @override
  String get runningServicesTitle => 'Serviços do Sistema em Execução';

  @override
  String get openRunningServicesTooltip =>
      'Abrir Serviços em Execução nas Configurações do Android';

  @override
  String get error => 'Erro';

  @override
  String get appInfoNotFound => 'Informações do app não encontradas';

  @override
  String pageNotFound(String location) {
    return 'Página não encontrada: $location';
  }

  @override
  String get package => 'Pacote';

  @override
  String get service => 'Serviço';

  @override
  String get process => 'Processo';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'Uso de RAM';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => 'Primeiro Plano';

  @override
  String get foregroundId => 'ID do Primeiro Plano';

  @override
  String get startRequested => 'Início Solicitado';

  @override
  String get createdFromFg => 'Criado do FG';

  @override
  String get createTime => 'Hora de Criação';

  @override
  String get lastActivity => 'Última Atividade';

  @override
  String get baseDir => 'Diretório Base';

  @override
  String get dataDir => 'Diretório de Dados';

  @override
  String get type => 'Tipo';

  @override
  String get systemApp => 'App do Sistema';

  @override
  String get userApp => 'App do Usuário';

  @override
  String get rawOutput => 'Saída Bruta';

  @override
  String get close => 'Fechar';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get connections => 'Conexões';

  @override
  String get flags => 'Flags';

  @override
  String get bound => 'Vinculado';

  @override
  String get processRecord => 'Registro de Processo';

  @override
  String get visible => 'Visível';

  @override
  String get capabilities => 'Capacidades';

  @override
  String get active => 'Ativo';

  @override
  String get cached => 'Em Cache';

  @override
  String get noServicesFound => 'Nenhum serviço encontrado';

  @override
  String get ramCalculation => 'Cálculo de RAM';

  @override
  String get totalRam => 'RAM Total';

  @override
  String get ramSources => 'Fontes';

  @override
  String get noRamDataAvailable =>
      'Nenhum dado de RAM disponível para este app no relatório de memória do sistema.';

  @override
  String get ramCalculationExplanation =>
      'A RAM é calculada a partir das informações de memória do sistema. PID = Busca por ID do processo, Process = Busca por nome do processo, LRU = Lista de processos recentes.';

  @override
  String get playCommand => 'Executar Comando';

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get copy => 'Copiar';

  @override
  String get and => 'e';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serviços',
      one: '1 serviço',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count processos',
      one: '1 processo',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount processos',
      one: '1 processo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount serviços',
      one: '1 serviço',
    );
    return '$_temp0 e $_temp1';
  }

  @override
  String get info => 'Info';

  @override
  String get followSystem => 'Sistema';

  @override
  String get contributors => 'Contribuidores';

  @override
  String contributionsCount(Object count) {
    return '$count contribuições';
  }

  @override
  String get checkingPermissions => 'Verificando permissões...';

  @override
  String get shizukuNotRunning =>
      'Shizuku não está em execução. Por favor, inicie o app Shizuku.';

  @override
  String get permissionDeniedShizuku =>
      'Permissão negada. Por favor, conceda a permissão do Shizuku.';

  @override
  String get failedToInitialize =>
      'Falha ao inicializar. Por favor, conceda a permissão.';

  @override
  String get errorInitializingShizuku => 'Erro ao inicializar o Shizuku';

  @override
  String get loadingApps => 'Carregando apps...';

  @override
  String get refreshedSuccessfully => 'Atualizado com sucesso';

  @override
  String get errorLoadingData => 'Erro ao carregar dados';

  @override
  String get failedToStopAllServices => 'Falha ao parar todos os serviços';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'Falha ao parar o serviço $serviceName';
  }

  @override
  String errorPrefix(String error) {
    return 'Erro: $error';
  }

  @override
  String get language => 'Idioma';

  @override
  String get openGithubProfile => 'Abrir Perfil do GitHub';

  @override
  String get appInfoTooltip => 'Info do App';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => 'UID de Chamada Recente';

  @override
  String get appDetails => 'Detalhes do App';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'Estado do Processo';

  @override
  String get processStateFg =>
      'Primeiro Plano - App está atualmente em primeiro plano';

  @override
  String get processStateVis =>
      'Visível - App tem uma atividade visível mas não está em primeiro plano';

  @override
  String get processStatePrev =>
      'Anterior - App de primeiro plano usado anteriormente';

  @override
  String get processStatePrcp =>
      'Perceptível - App está fazendo algo que o usuário percebe';

  @override
  String get processStateSvcb => 'Serviço B - App tem um serviço vinculado';

  @override
  String get processStateHome => 'Início - App de Início/Launcher';

  @override
  String get processStateHvy => 'Pesado - Processo de app pesado';

  @override
  String get processStatePsvc =>
      'Serviço Persistente - App tem um serviço persistente';

  @override
  String get processStatePers =>
      'Persistente - Processo persistente do sistema';

  @override
  String get processStateCchEmpty =>
      'Cache Vazio - Processo em cache sem atividades';

  @override
  String get processStateCchAct =>
      'Cache com Atividade - Processo em cache com atividades';

  @override
  String get processStateCchClient =>
      'Cache Cliente - Processo em cache como cliente de serviço';

  @override
  String get processStateCch => 'Em Cache - Processo está em cache na memória';

  @override
  String get processStateBfgs =>
      'Serviço de Primeiro Plano Vinculado - Vinculado a um serviço de primeiro plano';

  @override
  String get processStateRcvr =>
      'Receptor - App está executando um receptor de broadcast';

  @override
  String get processStateTop =>
      'Topo - App está no topo da pilha de atividades';

  @override
  String get processStateBtop => 'Topo Vinculado - Vinculado a um app no topo';

  @override
  String get processStateImpf =>
      'Primeiro Plano Importante - Processo importante de primeiro plano';

  @override
  String get processStateImpb =>
      'Segundo Plano Importante - Processo importante de segundo plano';

  @override
  String processStateUnknown(String state) {
    return 'Estado do processo: $state';
  }

  @override
  String get workingMode => 'Modo de Trabalho';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Selecionar Modo de Trabalho';

  @override
  String get available => 'Disponível';

  @override
  String get notAvailable => 'Indisponível';

  @override
  String get modeNotAvailable => 'Este modo não está disponível';

  @override
  String get noModeAvailable => 'Nenhum modo de permissão disponível';

  @override
  String get commandLogs => 'Logs de Comandos';

  @override
  String get commandOutput => 'Saída do Comando';

  @override
  String get noCommandLogs => 'Nenhum comando executado ainda';

  @override
  String get clearLogs => 'Limpar Logs';

  @override
  String get clearLogsConfirm =>
      'Tem certeza de que deseja limpar todos os logs de comandos?';

  @override
  String get executedAt => 'Executado em';

  @override
  String get command => 'Comando';

  @override
  String get noOutput => 'Sem saída';

  @override
  String get executeCommand => 'Executar';

  @override
  String get processes => 'Processos';

  @override
  String get processesDescription =>
      'Todos os processos em execução deste app a partir das informações de memória.';

  @override
  String get noProcessesFound => 'Nenhum processo encontrado';

  @override
  String get usedBreakdown => 'Detalhamento do Uso';

  @override
  String get freeBreakdown => 'Detalhamento do Livre';

  @override
  String get other => 'Outro';

  @override
  String get usedPss => 'PSS Usado';

  @override
  String get kernel => 'Kernel';

  @override
  String get cachedPss => 'PSS em Cache';

  @override
  String get cachedKernel => 'Kernel em Cache';

  @override
  String get actualFree => 'Livre Real';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'RAM Perdida';

  @override
  String get zramPhysical => 'ZRAM Físico';

  @override
  String get zramSwapUsed => 'Swap ZRAM Usado';

  @override
  String get zramTotalSwap => 'Swap ZRAM Total';

  @override
  String get oomThreshold => 'Limite OOM';

  @override
  String get restoreLimit => 'Limite de Restauração';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Limites de Memória';

  @override
  String get boundServiceCannotStop =>
      'Este serviço está vinculado por outro processo e não pode ser parado diretamente. Você pode parar o app inteiro.';

  @override
  String get memoryInfo => 'Info de Memória';

  @override
  String get viewRawOutput => 'Ver Bruto';

  @override
  String get hideRawOutput => 'Ocultar Bruto';

  @override
  String get compareWithOther => 'Comparar';

  @override
  String get memoryCategories => 'Categorias de Memória';

  @override
  String get appSummary => 'Resumo do App';

  @override
  String get objects => 'Objetos';

  @override
  String get memoryComparison => 'Comparação de Memória';

  @override
  String get selectAppToCompare => 'Selecione um app para comparar';

  @override
  String get selectApp => 'Selecionar app...';

  @override
  String get totalPss => 'PSS Total';

  @override
  String get totalRss => 'RSS Total';

  @override
  String get javaHeap => 'Java Heap';

  @override
  String get nativeHeap => 'Native Heap';

  @override
  String get code => 'Código';

  @override
  String get graphics => 'Gráficos';

  @override
  String get current => 'Atual';

  @override
  String get allApps => 'Todos';

  @override
  String get userApps => 'Usuário';

  @override
  String get systemApps => 'Sistema';

  @override
  String get compareWith => 'Comparar com';

  @override
  String get stats => 'Estatísticas';

  @override
  String get statsLiveRamArea => 'RAM do Sistema ao Vivo';

  @override
  String get statsLiveRamAreaSubtitle => 'Uso de RAM ao longo do tempo';

  @override
  String get statsRamDistribution => 'Distribuição de RAM do Sistema';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Total: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'RAM de Apps Usuário vs Sistema';

  @override
  String get statsAppStateDistribution => 'Distribuição de Estado dos Apps';

  @override
  String get statsActive => 'Ativo';

  @override
  String get statsBackground => 'Segundo Plano';

  @override
  String get statsCached => 'Em Cache';

  @override
  String statsAppsCount(int count) {
    return '$count Apps';
  }

  @override
  String get statsSystemVsUserAnalysis => 'Análise Sistema vs Usuário';

  @override
  String get statsAppCount => 'Contagem de Apps';

  @override
  String get statsTotalRam => 'RAM Total';

  @override
  String get statsPerformance => 'Desempenho';

  @override
  String get statsRamDistributionScatter => 'Dispersão de Distribuição de RAM';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: Índice do App';

  @override
  String get statsTopRamConsumers => 'Maiores Consumidores de RAM';

  @override
  String get statsServicesVsRamCorrelation => 'Correlação Serviços vs RAM';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: Qtd Serviços, Bolha: Qtd Processos';

  @override
  String get statsRamHistogram => 'Histograma de Frequência de RAM';

  @override
  String get statsRamHistogramSubtitle =>
      'Contagem de apps por tamanho de memória';

  @override
  String get statsMemoryHeatmap => 'Mapa de Calor de Memória';

  @override
  String get statsMemoryHeatmapSubtitle =>
      'Todos os apps ordenados por intensidade de RAM';

  @override
  String get statsTopAppsRelativeImpact => 'Impacto Relativo dos Top Apps';

  @override
  String get statsGanttSubtitle =>
      'Visualização estilo Gantt do compartilhamento de RAM';

  @override
  String get statsStackedAreaChart => 'Detalhamento de RAM ao Longo do Tempo';

  @override
  String get statsStackedAreaSubtitle => 'RAM de Usuário, Sistema e Kernel';

  @override
  String get statsPolarChart => 'Distribuição de Estado dos Processos';

  @override
  String get statsPolarSubtitle => 'Visão polar dos estados dos apps';

  @override
  String get statsTreemap => 'Treemap de Distribuição de RAM';

  @override
  String get statsTreemapSubtitle => 'Uso proporcional de RAM por app';

  @override
  String get statsFunnelChart => 'Níveis de Uso de RAM';

  @override
  String get statsFunnelSubtitle => 'Apps agrupados por tamanho de memória';

  @override
  String get statsWaterfallChart => 'Cascata de Alocação de RAM';

  @override
  String get statsWaterfallSubtitle => 'Detalhamento do total aos componentes';

  @override
  String get statsGaugeChart => 'Medidor de Uso de RAM';

  @override
  String get statsGaugeSubtitle => 'Utilização geral da memória do sistema';

  @override
  String get statsTiny => 'Minúsculo';

  @override
  String get statsSmall => 'Pequeno';

  @override
  String get statsMedium => 'Médio';

  @override
  String get statsLarge => 'Grande';

  @override
  String get statsHuge => 'Enorme';

  @override
  String get statsNoData => 'Nenhum dado disponível';

  @override
  String get statsWaitingForData => 'Aguardando dados...';

  @override
  String get statsRamDistributionPie => 'Distribuição de RAM do Sistema';

  @override
  String get statsRamDistributionSubtitle => 'Usado, Livre e ZRAM';

  @override
  String get statsUsed => 'Usado';

  @override
  String get statsFree => 'Livre';

  @override
  String get statsUserVsSystemPie => 'RAM de Apps Usuário vs Sistema';

  @override
  String get statsUserVsSystemSubtitle =>
      'Comparar memória de apps usuário e sistema';

  @override
  String get statsProcessStateBar => 'Distribuição de Estado dos Apps';

  @override
  String get statsProcessStateSubtitle =>
      'Apps Ativos, em Segundo Plano e em Cache';

  @override
  String get statsScatterChart => 'Dispersão de Distribuição de RAM';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: Índice do App';

  @override
  String get core => 'Core';

  @override
  String get coreAppInfoLimited =>
      'Informações limitadas disponíveis para processos do sistema';

  @override
  String get showCoreApps => 'Mostrar Apps Core';

  @override
  String get usefulCommands => 'Comandos Úteis';

  @override
  String get commands => 'Comandos';

  @override
  String get addCommand => 'Adicionar Comando';

  @override
  String get placeholders => 'Placeholders';

  @override
  String get commandTitle => 'Título';

  @override
  String get commandDescription => 'Descrição';

  @override
  String get reExecute => 'Re-executar';

  @override
  String get statsProcessVsRamLine => 'Correlação Processo vs RAM';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Azul: RAM, Tracejado: Qtd Processos';

  @override
  String get statsUserVsSystemBar => 'Comparação Usuário vs Sistema';

  @override
  String get statsUserVsSystemBarSubtitle => 'Qtd Apps, RAM Total, RAM Média';

  @override
  String get statsRamTrendScatter => 'Análise de Tendência de RAM';

  @override
  String get statsRamTrendScatterSubtitle =>
      'Serviços vs RAM com Linha de Tendência';

  @override
  String get statsServicesVsProcesses => 'Serviços vs Processos';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Correlação entre contagens de Serviços e Processos';

  @override
  String get statsProcessStateRam => 'RAM por Estado do Processo';

  @override
  String get statsProcessStateRamSubtitle =>
      'Uso médio de RAM por estado do processo';

  @override
  String get myCommands => 'Meus Comandos';

  @override
  String get defaultCommands => 'Comandos Padrão';

  @override
  String get resetDefaults => 'Redefinir Padrões';

  @override
  String get memoryDistribution => 'Distribuição de Memória';

  @override
  String get memoryProfileComparison => 'Comparação de Perfil de Memória';

  @override
  String get stack => 'Pilha';

  @override
  String get privateOther => 'Privado Outro';

  @override
  String get unknown => 'Desconhecido';

  @override
  String totalPssLabel(String size) {
    return 'PSS Total: $size';
  }
}
