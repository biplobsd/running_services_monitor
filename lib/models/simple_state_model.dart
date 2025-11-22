import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_state_model.freezed.dart';
part 'simple_state_model.g.dart';

@freezed
abstract class SimpleStateModel with _$SimpleStateModel {
  const factory SimpleStateModel({
    int? count,
  }) = _SimpleStateModel;

  factory SimpleStateModel.fromJson(Map<String, Object?> json) => _$SimpleStateModelFromJson(json);
}