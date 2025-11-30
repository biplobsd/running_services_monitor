import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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

    // Configure sizes at app startup (before runApp)
    setPaddingSizes(SizeValues.custom(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48));
    setMarginSizes(SizeValues.custom(xs: 2, sm: 4, md: 8, lg: 12, xl: 16, xxl: 24));
    setRadiusSizes(SizeValues.custom(xs: 2, sm: 4, md: 8, lg: 12, xl: 16, xxl: 24));
    setSpacingSizes(SizeValues.custom(xs: 4, sm: 8, md: 12, lg: 16, xl: 20, xxl: 24));
    setTextSizes(TextSizeValues.custom(s14: 15, s16: 17, s18: 20, s24: 26));

    // Set default values for methods without parameters
    setDefaultPadding(16);
    setDefaultMargin(8);
    setDefaultRadius(12);
    setDefaultSpacing(8);
    setDefaultTextSize(14);

    runApp(const MyApp());
  } catch (e, stackTrace) {
    debugPrint('Error in main: $e');
    debugPrint('Stack trace: $stackTrace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeBloc>()),
        BlocProvider(create: (context) => getIt<LanguageBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageState) {
              return MaterialApp.router(
                routerConfig: createAppRouter(),
                onGenerateTitle: (context) => context.loc.appTitle,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: languageState.locale,
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
                  return ScaleKitBuilder(
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
      ),
    );
  }
}
