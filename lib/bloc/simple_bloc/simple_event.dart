part of 'simple_bloc.dart';

@freezed
class SimpleEvent with _$SimpleEvent {
  const factory SimpleEvent.started() = _Started;
  const factory SimpleEvent.count({@Default(0) int count}) = _Count;
}
