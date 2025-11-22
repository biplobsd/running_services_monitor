part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(HomeStateModel value) = _Initial;
  const factory HomeState.loading(HomeStateModel value) = _Loading;
  const factory HomeState.success(HomeStateModel value) = _Success;
  const factory HomeState.failure(HomeStateModel value, String message) = _Failure;

  const HomeState._();

  @override
  HomeStateModel get value {
    return when(
      initial: (value) => value,
      loading: (value) => value,
      success: (value) => value,
      failure: (value, message) => value,
    );
  }
}
