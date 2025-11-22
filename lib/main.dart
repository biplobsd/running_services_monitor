import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/theme/theme_bloc.dart';
import 'bloc/language_bloc/language_bloc.dart';
import 'screens/home_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
    );

    configureDependencies();
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
              return MaterialApp(
                onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
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
                home: const SelectionArea(child: HomeScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
