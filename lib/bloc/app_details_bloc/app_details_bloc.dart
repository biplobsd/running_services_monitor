import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:running_services_monitor/models/service_info.dart';

part 'app_details_event.dart';
part 'app_details_state.dart';
part 'app_details_bloc.freezed.dart';

@injectable
class AppDetailsBloc extends Bloc<AppDetailsEvent, AppDetailsState> {
  AppDetailsBloc() : super(const AppDetailsState.initial()) {
    on<_LoadDetails>(_onLoadDetails);
  }

  Future<void> _onLoadDetails(_LoadDetails event, Emitter<AppDetailsState> emit) async {
    emit(AppDetailsState.loading(event.appInfo));

    try {
      var appInfo = event.appInfo;

      // 1. Fetch main app icon if missing
      if (appInfo.appInfo == null || appInfo.appInfo!.icon == null) {
        try {
          final fetchedAppInfo = await InstalledApps.getAppInfo(appInfo.packageName);
          if (fetchedAppInfo != null) {
            appInfo = appInfo.copyWith(appInfo: fetchedAppInfo);
          }
        } catch (e) {
          // Ignore
        }
      }

      // 2. Fetch icons for each service
      final updatedServices = <RunningServiceInfo>[];
      for (var service in appInfo.services) {
        var updatedService = service;
        if (service.icon == null) {
          try {
            final fetchedAppInfo = await InstalledApps.getAppInfo(service.packageName);
            if (fetchedAppInfo != null && fetchedAppInfo.icon != null) {
              updatedService = service.copyWith(icon: fetchedAppInfo.icon);
            }
          } catch (e) {
            // Ignore
          }
        }
        updatedServices.add(updatedService);
      }

      appInfo = appInfo.copyWith(services: updatedServices);

      emit(AppDetailsState.success(appInfo));
    } catch (e) {
      emit(AppDetailsState.failure(event.appInfo, e.toString()));
    }
  }
}
