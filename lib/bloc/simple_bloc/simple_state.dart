part of 'simple_bloc.dart';

@freezed
class SimpleState with _$SimpleState {
  const factory SimpleState.initial(SimpleStateModel value) = _Initial;
  const factory SimpleState.success(SimpleStateModel value) = _Success;
  const factory SimpleState.loading(SimpleStateModel value) = _Loading;
  const factory SimpleState.failure(SimpleStateModel value, String message) = _Failure;

  const SimpleState._();

  @override
  SimpleStateModel get value {
    return when(
      initial: (value) => value,
      success: (value) => value,
      loading: (value) => value,
      failure: (value, message) => value,
    );
  }
}
