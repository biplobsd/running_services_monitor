// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppInfoStateModel {

 Map<String, CachedAppInfo> get cachedApps;
/// Create a copy of AppInfoStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoStateModelCopyWith<AppInfoStateModel> get copyWith => _$AppInfoStateModelCopyWithImpl<AppInfoStateModel>(this as AppInfoStateModel, _$identity);

  /// Serializes this AppInfoStateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfoStateModel&&const DeepCollectionEquality().equals(other.cachedApps, cachedApps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cachedApps));

@override
String toString() {
  return 'AppInfoStateModel(cachedApps: $cachedApps)';
}


}

/// @nodoc
abstract mixin class $AppInfoStateModelCopyWith<$Res>  {
  factory $AppInfoStateModelCopyWith(AppInfoStateModel value, $Res Function(AppInfoStateModel) _then) = _$AppInfoStateModelCopyWithImpl;
@useResult
$Res call({
 Map<String, CachedAppInfo> cachedApps
});




}
/// @nodoc
class _$AppInfoStateModelCopyWithImpl<$Res>
    implements $AppInfoStateModelCopyWith<$Res> {
  _$AppInfoStateModelCopyWithImpl(this._self, this._then);

  final AppInfoStateModel _self;
  final $Res Function(AppInfoStateModel) _then;

/// Create a copy of AppInfoStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cachedApps = null,}) {
  return _then(_self.copyWith(
cachedApps: null == cachedApps ? _self.cachedApps : cachedApps // ignore: cast_nullable_to_non_nullable
as Map<String, CachedAppInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfoStateModel].
extension AppInfoStateModelPatterns on AppInfoStateModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfoStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfoStateModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfoStateModel value)  $default,){
final _that = this;
switch (_that) {
case _AppInfoStateModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfoStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfoStateModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, CachedAppInfo> cachedApps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfoStateModel() when $default != null:
return $default(_that.cachedApps);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, CachedAppInfo> cachedApps)  $default,) {final _that = this;
switch (_that) {
case _AppInfoStateModel():
return $default(_that.cachedApps);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, CachedAppInfo> cachedApps)?  $default,) {final _that = this;
switch (_that) {
case _AppInfoStateModel() when $default != null:
return $default(_that.cachedApps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppInfoStateModel implements AppInfoStateModel {
  const _AppInfoStateModel({final  Map<String, CachedAppInfo> cachedApps = const {}}): _cachedApps = cachedApps;
  factory _AppInfoStateModel.fromJson(Map<String, dynamic> json) => _$AppInfoStateModelFromJson(json);

 final  Map<String, CachedAppInfo> _cachedApps;
@override@JsonKey() Map<String, CachedAppInfo> get cachedApps {
  if (_cachedApps is EqualUnmodifiableMapView) return _cachedApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cachedApps);
}


/// Create a copy of AppInfoStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoStateModelCopyWith<_AppInfoStateModel> get copyWith => __$AppInfoStateModelCopyWithImpl<_AppInfoStateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppInfoStateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfoStateModel&&const DeepCollectionEquality().equals(other._cachedApps, _cachedApps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cachedApps));

@override
String toString() {
  return 'AppInfoStateModel(cachedApps: $cachedApps)';
}


}

/// @nodoc
abstract mixin class _$AppInfoStateModelCopyWith<$Res> implements $AppInfoStateModelCopyWith<$Res> {
  factory _$AppInfoStateModelCopyWith(_AppInfoStateModel value, $Res Function(_AppInfoStateModel) _then) = __$AppInfoStateModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, CachedAppInfo> cachedApps
});




}
/// @nodoc
class __$AppInfoStateModelCopyWithImpl<$Res>
    implements _$AppInfoStateModelCopyWith<$Res> {
  __$AppInfoStateModelCopyWithImpl(this._self, this._then);

  final _AppInfoStateModel _self;
  final $Res Function(_AppInfoStateModel) _then;

/// Create a copy of AppInfoStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cachedApps = null,}) {
  return _then(_AppInfoStateModel(
cachedApps: null == cachedApps ? _self._cachedApps : cachedApps // ignore: cast_nullable_to_non_nullable
as Map<String, CachedAppInfo>,
  ));
}


}


/// @nodoc
mixin _$CachedAppInfo {

 String get appName;@JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter() Uint8List? get icon; bool get isSystemApp;
/// Create a copy of CachedAppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedAppInfoCopyWith<CachedAppInfo> get copyWith => _$CachedAppInfoCopyWithImpl<CachedAppInfo>(this as CachedAppInfo, _$identity);

  /// Serializes this CachedAppInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedAppInfo&&(identical(other.appName, appName) || other.appName == appName)&&const DeepCollectionEquality().equals(other.icon, icon)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appName,const DeepCollectionEquality().hash(icon),isSystemApp);

@override
String toString() {
  return 'CachedAppInfo(appName: $appName, icon: $icon, isSystemApp: $isSystemApp)';
}


}

/// @nodoc
abstract mixin class $CachedAppInfoCopyWith<$Res>  {
  factory $CachedAppInfoCopyWith(CachedAppInfo value, $Res Function(CachedAppInfo) _then) = _$CachedAppInfoCopyWithImpl;
@useResult
$Res call({
 String appName,@JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter() Uint8List? icon, bool isSystemApp
});




}
/// @nodoc
class _$CachedAppInfoCopyWithImpl<$Res>
    implements $CachedAppInfoCopyWith<$Res> {
  _$CachedAppInfoCopyWithImpl(this._self, this._then);

  final CachedAppInfo _self;
  final $Res Function(CachedAppInfo) _then;

/// Create a copy of CachedAppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = null,Object? icon = freezed,Object? isSystemApp = null,}) {
  return _then(_self.copyWith(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CachedAppInfo].
extension CachedAppInfoPatterns on CachedAppInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedAppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedAppInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedAppInfo value)  $default,){
final _that = this;
switch (_that) {
case _CachedAppInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedAppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CachedAppInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appName, @JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter()  Uint8List? icon,  bool isSystemApp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedAppInfo() when $default != null:
return $default(_that.appName,_that.icon,_that.isSystemApp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appName, @JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter()  Uint8List? icon,  bool isSystemApp)  $default,) {final _that = this;
switch (_that) {
case _CachedAppInfo():
return $default(_that.appName,_that.icon,_that.isSystemApp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appName, @JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter()  Uint8List? icon,  bool isSystemApp)?  $default,) {final _that = this;
switch (_that) {
case _CachedAppInfo() when $default != null:
return $default(_that.appName,_that.icon,_that.isSystemApp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachedAppInfo implements CachedAppInfo {
  const _CachedAppInfo({required this.appName, @JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter() this.icon, this.isSystemApp = false});
  factory _CachedAppInfo.fromJson(Map<String, dynamic> json) => _$CachedAppInfoFromJson(json);

@override final  String appName;
@override@JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter() final  Uint8List? icon;
@override@JsonKey() final  bool isSystemApp;

/// Create a copy of CachedAppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedAppInfoCopyWith<_CachedAppInfo> get copyWith => __$CachedAppInfoCopyWithImpl<_CachedAppInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachedAppInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedAppInfo&&(identical(other.appName, appName) || other.appName == appName)&&const DeepCollectionEquality().equals(other.icon, icon)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appName,const DeepCollectionEquality().hash(icon),isSystemApp);

@override
String toString() {
  return 'CachedAppInfo(appName: $appName, icon: $icon, isSystemApp: $isSystemApp)';
}


}

/// @nodoc
abstract mixin class _$CachedAppInfoCopyWith<$Res> implements $CachedAppInfoCopyWith<$Res> {
  factory _$CachedAppInfoCopyWith(_CachedAppInfo value, $Res Function(_CachedAppInfo) _then) = __$CachedAppInfoCopyWithImpl;
@override @useResult
$Res call({
 String appName,@JsonKey(includeFromJson: false, includeToJson: false)@Uint8ListConverter() Uint8List? icon, bool isSystemApp
});




}
/// @nodoc
class __$CachedAppInfoCopyWithImpl<$Res>
    implements _$CachedAppInfoCopyWith<$Res> {
  __$CachedAppInfoCopyWithImpl(this._self, this._then);

  final _CachedAppInfo _self;
  final $Res Function(_CachedAppInfo) _then;

/// Create a copy of CachedAppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = null,Object? icon = freezed,Object? isSystemApp = null,}) {
  return _then(_CachedAppInfo(
appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
