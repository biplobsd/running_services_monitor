import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/service_info.dart';

part 'home_state_model.freezed.dart';

@freezed
abstract class HomeStateModel with _$HomeStateModel {
  const factory HomeStateModel({
    // Loading & Error
    @Default(false) bool isLoading,
    @Default(false) bool shizukuReady,
    String? errorMessage,
    String? notification,
    String? loadingStatus,

    // App Data
    @Default([]) List<AppProcessInfo> allApps,
    @Default([]) List<AppProcessInfo> userApps,
    @Default([]) List<AppProcessInfo> systemApps,

    // RAM Info
    @Default(0.0) double totalRamKb,
    @Default(0.0) double freeRamKb,
    @Default(0.0) double usedRamKb,
    @Default(0.0) double appsRamKb,

    // UI State
    @Default(false) bool isAutoUpdateEnabled,
    @Default(false) bool isSearching,
    @Default('') String searchQuery,
  }) = _HomeStateModel;
}
