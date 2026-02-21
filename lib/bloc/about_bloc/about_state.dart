part of 'about_bloc.dart';

@freezed
abstract class AboutState with _$AboutState {
  const factory AboutState({required bool isLoading, required String version, required List<ContributorInfo> contributors}) = _AboutState;

  factory AboutState.initial() => const AboutState(isLoading: true, version: '', contributors: []);
}
