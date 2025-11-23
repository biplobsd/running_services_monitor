// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../bloc/app_details_bloc/app_details_bloc.dart' as _i543;
import '../../bloc/home_bloc/home_bloc.dart' as _i98;
import '../../bloc/language_bloc/language_bloc.dart' as _i663;
import '../../bloc/stop_service_bloc/stop_service_bloc.dart' as _i256;
import '../../services/process_service.dart' as _i622;
import '../../services/shizuku_service.dart' as _i842;
import '../theme/theme_bloc.dart' as _i118;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i543.AppDetailsBloc>(() => _i543.AppDetailsBloc());
    gh.factory<_i663.LanguageBloc>(() => _i663.LanguageBloc());
    gh.singleton<_i118.ThemeBloc>(() => _i118.ThemeBloc());
    gh.lazySingleton<_i842.ShizukuService>(() => _i842.ShizukuService());
    gh.lazySingleton<_i622.ProcessService>(
      () => _i622.ProcessService(gh<_i842.ShizukuService>()),
    );
    gh.factory<_i256.StopServiceBloc>(
      () => _i256.StopServiceBloc(gh<_i622.ProcessService>()),
    );
    gh.lazySingleton<_i98.HomeBloc>(
      () =>
          _i98.HomeBloc(gh<_i842.ShizukuService>(), gh<_i622.ProcessService>()),
    );
    return this;
  }
}
