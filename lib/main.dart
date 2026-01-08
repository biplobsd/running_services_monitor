import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/extensions.dart';
import 'core/theme/theme_bloc.dart';
import 'bloc/language_bloc/language_bloc.dart';
import 'core/routing/app_router.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
    );

    configureDependencies();

    setPaddingSizes(SizeValues.custom(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48));
    setMarginSizes(SizeValues.custom(xs: 2, sm: 4, md: 8, lg: 12, xl: 16, xxl: 24));
    setRadiusSizes(SizeValues.custom(xs: 2, sm: 4, md: 8, lg: 12, xl: 16, xxl: 24));
    setSpacingSizes(SizeValues.custom(xs: 4, sm: 8, md: 12, lg: 16, xl: 20, xxl: 24));
    setTextSizes(TextSizeValues.custom(s14: 15, s16: 17, s18: 20, s24: 26));

    setDefaultPadding(16);
    setDefaultMargin(8);
    setDefaultRadius(12);
    setDefaultSpacing(8);
    setDefaultTextSize(14);

    runApp(const MyApp());
  } catch (_) {}
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    router = createAppRouter();

    getIt<WorkingModeBloc>().add(const WorkingModeEvent.detectModes());

    final homeBloc = getIt<HomeBloc>();
    final hasData = homeBloc.state.value.allApps.isNotEmpty;
    homeBloc.add(HomeEvent.initializeShizuku(silent: hasData, notify: hasData));
    // getIt<AppInfoBloc>().add(const AppInfoEvent.loadAllApps());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final homeBloc = getIt<HomeBloc>();
      homeBloc.add(const HomeEvent.loadData(silent: true, notify: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeBloc, AppThemeMode, ThemeMode>(
      bloc: getIt<ThemeBloc>(),
      selector: (state) => switch (state) {
        AppThemeMode.system => ThemeMode.system,
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
      },
      builder: (context, themeMode) {
        return BlocSelector<LanguageBloc, LanguageState, Locale?>(
          bloc: getIt<LanguageBloc>(),
          selector: (state) => state.locale,
          builder: (context, locale) {
            return MaterialApp.router(
              routerConfig: router,
              onGenerateTitle: (context) => context.loc.appTitle,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              debugShowCheckedModeBanner: false,
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              ),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
                useMaterial3: true,
                appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
                useMaterial3: true,
                appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
              ),
              themeMode: themeMode,
              builder: (context, child) {
                final orientation = MediaQuery.of(context).orientation;
                return ScaleKitBuilder(
                  autoScalePortrait: true,
                  key: ValueKey(orientation),
                  designWidth: 375,
                  designHeight: 812,
                  designType: DeviceType.mobile,
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
