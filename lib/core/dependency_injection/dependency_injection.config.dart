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

import '../../bloc/home_bloc/home_bloc.dart' as _i98;
import '../../services/process_service.dart' as _i622;
import '../../services/shizuku_service.dart' as _i842;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i842.ShizukuService>(() => _i842.ShizukuService());
    gh.lazySingleton<_i622.ProcessService>(
      () => _i622.ProcessService(gh<_i842.ShizukuService>()),
    );
    gh.factory<_i98.HomeBloc>(
      () =>
          _i98.HomeBloc(gh<_i842.ShizukuService>(), gh<_i622.ProcessService>()),
    );
    return this;
  }
}
