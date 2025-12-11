import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:running_services_monitor/models/contributor_info.dart';
import 'package:running_services_monitor/services/contributors_service.dart';

part 'about_event.dart';
part 'about_state.dart';
part 'about_bloc.freezed.dart';

@lazySingleton
class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final ContributorsService _contributorsService;

  AboutBloc(this._contributorsService) : super(AboutState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter<AboutState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final version = 'v${packageInfo.version}';

      final contributors = await _contributorsService.getContributors();

      emit(state.copyWith(isLoading: false, version: version, contributors: contributors));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
