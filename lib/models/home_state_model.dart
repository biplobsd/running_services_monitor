import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/service_info.dart';
import '../models/system_ram_info.dart';
import 'process_state_filter.dart';

part 'home_state_model.freezed.dart';
part 'home_state_model.g.dart';

@freezed
abstract class HomeStateModel with _$HomeStateModel {
  const factory HomeStateModel({
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool shizukuReady,

    @Default([]) List<AppProcessInfo> allApps,

    @Default(SystemRamInfo()) SystemRamInfo systemRamInfo,

    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isAutoUpdateEnabled,
    @Default(false) bool isSearching,
    @Default('') String searchQuery,
    @Default(ProcessStateFilter.all) ProcessStateFilter selectedProcessFilter,
    @Default(false) bool sortAscending,
  }) = _HomeStateModel;

  factory HomeStateModel.fromJson(Map<String, dynamic> json) => _$HomeStateModelFromJson(json);
}
