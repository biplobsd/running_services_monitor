import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/utils/log_helper.dart';
import 'package:running_services_monitor/models/contributor_info.dart';
import 'package:running_services_monitor/services/contributors_service.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'about_event.dart';
part 'about_state.dart';
part 'about_bloc.freezed.dart';

@lazySingleton
class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final ContributorsService _contributorsService;
  final ShizukuService _shizukuService;

  AboutBloc(this._contributorsService, this._shizukuService) : super(AboutState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter<AboutState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final versionResult = await _shizukuService.getAppVersion();
      final version = 'v$versionResult';

      final contributors = await _contributorsService.getContributors();

      emit(state.copyWith(isLoading: false, version: version, contributors: contributors));
    } catch (e, s) {
      logError(e, s);
      emit(state.copyWith(isLoading: false));
    }
  }
}
