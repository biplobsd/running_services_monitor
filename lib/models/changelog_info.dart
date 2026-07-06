import 'package:freezed_annotation/freezed_annotation.dart';

part 'changelog_info.freezed.dart';
part 'changelog_info.g.dart';

@freezed
abstract class ChangelogInfo with _$ChangelogInfo {
  const factory ChangelogInfo({
    required String version,
    required String title,
    required String body,
    required String date,
  }) = _ChangelogInfo;

  factory ChangelogInfo.fromJson(Map<String, dynamic> json) =>
      _$ChangelogInfoFromJson(json);
}
