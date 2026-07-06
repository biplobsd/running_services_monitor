// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changelog_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangelogInfo {

 String get version; String get title; String get body; String get date;
/// Create a copy of ChangelogInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangelogInfoCopyWith<ChangelogInfo> get copyWith => _$ChangelogInfoCopyWithImpl<ChangelogInfo>(this as ChangelogInfo, _$identity);

  /// Serializes this ChangelogInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangelogInfo&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,title,body,date);

@override
String toString() {
  return 'ChangelogInfo(version: $version, title: $title, body: $body, date: $date)';
}


}

/// @nodoc
abstract mixin class $ChangelogInfoCopyWith<$Res>  {
  factory $ChangelogInfoCopyWith(ChangelogInfo value, $Res Function(ChangelogInfo) _then) = _$ChangelogInfoCopyWithImpl;
@useResult
$Res call({
 String version, String title, String body, String date
});




}
/// @nodoc
class _$ChangelogInfoCopyWithImpl<$Res>
    implements $ChangelogInfoCopyWith<$Res> {
  _$ChangelogInfoCopyWithImpl(this._self, this._then);

  final ChangelogInfo _self;
  final $Res Function(ChangelogInfo) _then;

/// Create a copy of ChangelogInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? title = null,Object? body = null,Object? date = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangelogInfo].
extension ChangelogInfoPatterns on ChangelogInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangelogInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangelogInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangelogInfo value)  $default,){
final _that = this;
switch (_that) {
case _ChangelogInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangelogInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ChangelogInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  String title,  String body,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangelogInfo() when $default != null:
return $default(_that.version,_that.title,_that.body,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  String title,  String body,  String date)  $default,) {final _that = this;
switch (_that) {
case _ChangelogInfo():
return $default(_that.version,_that.title,_that.body,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  String title,  String body,  String date)?  $default,) {final _that = this;
switch (_that) {
case _ChangelogInfo() when $default != null:
return $default(_that.version,_that.title,_that.body,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangelogInfo implements ChangelogInfo {
  const _ChangelogInfo({required this.version, required this.title, required this.body, required this.date});
  factory _ChangelogInfo.fromJson(Map<String, dynamic> json) => _$ChangelogInfoFromJson(json);

@override final  String version;
@override final  String title;
@override final  String body;
@override final  String date;

/// Create a copy of ChangelogInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangelogInfoCopyWith<_ChangelogInfo> get copyWith => __$ChangelogInfoCopyWithImpl<_ChangelogInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangelogInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangelogInfo&&(identical(other.version, version) || other.version == version)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,title,body,date);

@override
String toString() {
  return 'ChangelogInfo(version: $version, title: $title, body: $body, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ChangelogInfoCopyWith<$Res> implements $ChangelogInfoCopyWith<$Res> {
  factory _$ChangelogInfoCopyWith(_ChangelogInfo value, $Res Function(_ChangelogInfo) _then) = __$ChangelogInfoCopyWithImpl;
@override @useResult
$Res call({
 String version, String title, String body, String date
});




}
/// @nodoc
class __$ChangelogInfoCopyWithImpl<$Res>
    implements _$ChangelogInfoCopyWith<$Res> {
  __$ChangelogInfoCopyWithImpl(this._self, this._then);

  final _ChangelogInfo _self;
  final $Res Function(_ChangelogInfo) _then;

/// Create a copy of ChangelogInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? title = null,Object? body = null,Object? date = null,}) {
  return _then(_ChangelogInfo(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
