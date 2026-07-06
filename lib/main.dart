import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'l10n/gen/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/extensions.dart';
import 'core/theme/theme_bloc.dart';
import 'core/theme/native_theme_sync.dart';
import 'bloc/language_bloc/language_bloc.dart';
import 'core/routing/app_router.dart';
import 'core/utils/app_icon_cache.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await AppIconCache.initialize();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
    );

    configureDependencies();
    runApp(const MyApp());
  } catch (_) {}
}


const _kLightOutlineVariantAlpha = 0.24;
const _kLightSurfaceContainerHighestAlpha = 0.12;
const _kDarkOutlineVariantAlpha = 0.30;
const _kDarkSurfaceContainerHighestAlpha = 0.20;

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

    NativeThemeSync.apply(getIt<ThemeBloc>().state);

    final homeBloc = getIt<HomeBloc>();
    final hasData = homeBloc.state.value.allApps.isNotEmpty;
    homeBloc.add(HomeEvent.initializeShizuku(silent: hasData, notify: hasData));
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
    return BlocListener<ThemeBloc, AppThemeMode>(
      bloc: getIt<ThemeBloc>(),
      listener: (context, mode) => NativeThemeSync.apply(mode),
      child: BlocSelector<ThemeBloc, AppThemeMode, ThemeMode>(
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
            return DynamicColorBuilder(
              builder: (lightDynamic, darkDynamic) {
                final lightColorScheme =
                    lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light);
                final darkColorScheme =
                    darkDynamic ?? ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark);

                final adjustedLightColorScheme = lightColorScheme.copyWith(
                  outlineVariant: Color.alphaBlend(lightColorScheme.onSurface.withValues(alpha: _kLightOutlineVariantAlpha), lightColorScheme.surface),
                  surfaceContainerHighest: Color.alphaBlend(
                    lightColorScheme.onSurface.withValues(alpha: _kLightSurfaceContainerHighestAlpha),
                    lightColorScheme.surface,
                  ),
                );
                final adjustedDarkColorScheme = darkColorScheme.copyWith(
                  outlineVariant: Color.alphaBlend(darkColorScheme.onSurface.withValues(alpha: _kDarkOutlineVariantAlpha), darkColorScheme.surface),
                  surfaceContainerHighest: Color.alphaBlend(darkColorScheme.onSurface.withValues(alpha: _kDarkSurfaceContainerHighestAlpha), darkColorScheme.surface),
                );

                return MaterialApp.router(
                  routerConfig: router,
                  onGenerateTitle: (context) => context.loc.appTitle,
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (final supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode == locale?.languageCode) {
                        return supportedLocale;
                      }
                    }
                    return const Locale('en');
                  },
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
                    colorScheme: adjustedLightColorScheme,
                    useMaterial3: true,
                    appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
                  ),
                  darkTheme: ThemeData(
                    colorScheme: adjustedDarkColorScheme,
                    useMaterial3: true,
                    appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
                  ),
                  themeMode: themeMode,
                );
              },
            );
          },
        );
        },
      ),
    );
  }
}
