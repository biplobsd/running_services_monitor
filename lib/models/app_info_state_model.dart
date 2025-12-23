import 'dart:convert';
import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info_state_model.freezed.dart';
part 'app_info_state_model.g.dart';

@freezed
abstract class AppInfoStateModel with _$AppInfoStateModel {
  const factory AppInfoStateModel({@Default({}) Map<String, CachedAppInfo> cachedApps}) = _AppInfoStateModel;

  factory AppInfoStateModel.fromJson(Map<String, dynamic> json) => _$AppInfoStateModelFromJson(json);
}

@freezed
abstract class CachedAppInfo with _$CachedAppInfo {
  const factory CachedAppInfo({required String appName, @Uint8ListConverter() Uint8List? icon, @Default(false) bool isSystemApp}) = _CachedAppInfo;

  factory CachedAppInfo.fromJson(Map<String, dynamic> json) => _$CachedAppInfoFromJson(json);
}

class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null) return null;
    return base64Decode(json);
  }

  @override
  String? toJson(Uint8List? object) {
    if (object == null) return null;
    return base64Encode(object);
  }
}
