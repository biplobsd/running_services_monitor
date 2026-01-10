// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppInfoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppInfoEvent()';
}


}

/// @nodoc
class $AppInfoEventCopyWith<$Res>  {
$AppInfoEventCopyWith(AppInfoEvent _, $Res Function(AppInfoEvent) __);
}


/// Adds pattern-matching-related methods to [AppInfoEvent].
extension AppInfoEventPatterns on AppInfoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadAllApps value)?  loadAllApps,TResult Function( _LoadAppInfo value)?  loadAppInfo,TResult Function( _UpdateAppsInfo value)?  updateAppsInfo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadAllApps() when loadAllApps != null:
return loadAllApps(_that);case _LoadAppInfo() when loadAppInfo != null:
return loadAppInfo(_that);case _UpdateAppsInfo() when updateAppsInfo != null:
return updateAppsInfo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadAllApps value)  loadAllApps,required TResult Function( _LoadAppInfo value)  loadAppInfo,required TResult Function( _UpdateAppsInfo value)  updateAppsInfo,}){
final _that = this;
switch (_that) {
case _LoadAllApps():
return loadAllApps(_that);case _LoadAppInfo():
return loadAppInfo(_that);case _UpdateAppsInfo():
return updateAppsInfo(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadAllApps value)?  loadAllApps,TResult? Function( _LoadAppInfo value)?  loadAppInfo,TResult? Function( _UpdateAppsInfo value)?  updateAppsInfo,}){
final _that = this;
switch (_that) {
case _LoadAllApps() when loadAllApps != null:
return loadAllApps(_that);case _LoadAppInfo() when loadAppInfo != null:
return loadAppInfo(_that);case _UpdateAppsInfo() when updateAppsInfo != null:
return updateAppsInfo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? mode)?  loadAllApps,TResult Function( String packageName,  String? mode)?  loadAppInfo,TResult Function( List<String> packageNames)?  updateAppsInfo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadAllApps() when loadAllApps != null:
return loadAllApps(_that.mode);case _LoadAppInfo() when loadAppInfo != null:
return loadAppInfo(_that.packageName,_that.mode);case _UpdateAppsInfo() when updateAppsInfo != null:
return updateAppsInfo(_that.packageNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? mode)  loadAllApps,required TResult Function( String packageName,  String? mode)  loadAppInfo,required TResult Function( List<String> packageNames)  updateAppsInfo,}) {final _that = this;
switch (_that) {
case _LoadAllApps():
return loadAllApps(_that.mode);case _LoadAppInfo():
return loadAppInfo(_that.packageName,_that.mode);case _UpdateAppsInfo():
return updateAppsInfo(_that.packageNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? mode)?  loadAllApps,TResult? Function( String packageName,  String? mode)?  loadAppInfo,TResult? Function( List<String> packageNames)?  updateAppsInfo,}) {final _that = this;
switch (_that) {
case _LoadAllApps() when loadAllApps != null:
return loadAllApps(_that.mode);case _LoadAppInfo() when loadAppInfo != null:
return loadAppInfo(_that.packageName,_that.mode);case _UpdateAppsInfo() when updateAppsInfo != null:
return updateAppsInfo(_that.packageNames);case _:
  return null;

}
}

}

/// @nodoc


class _LoadAllApps implements AppInfoEvent {
  const _LoadAllApps({this.mode});
  

 final  String? mode;

/// Create a copy of AppInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadAllAppsCopyWith<_LoadAllApps> get copyWith => __$LoadAllAppsCopyWithImpl<_LoadAllApps>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAllApps&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'AppInfoEvent.loadAllApps(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$LoadAllAppsCopyWith<$Res> implements $AppInfoEventCopyWith<$Res> {
  factory _$LoadAllAppsCopyWith(_LoadAllApps value, $Res Function(_LoadAllApps) _then) = __$LoadAllAppsCopyWithImpl;
@useResult
$Res call({
 String? mode
});




}
/// @nodoc
class __$LoadAllAppsCopyWithImpl<$Res>
    implements _$LoadAllAppsCopyWith<$Res> {
  __$LoadAllAppsCopyWithImpl(this._self, this._then);

  final _LoadAllApps _self;
  final $Res Function(_LoadAllApps) _then;

/// Create a copy of AppInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = freezed,}) {
  return _then(_LoadAllApps(
mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _LoadAppInfo implements AppInfoEvent {
  const _LoadAppInfo(this.packageName, {this.mode});
  

 final  String packageName;
 final  String? mode;

/// Create a copy of AppInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadAppInfoCopyWith<_LoadAppInfo> get copyWith => __$LoadAppInfoCopyWithImpl<_LoadAppInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAppInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,mode);

@override
String toString() {
  return 'AppInfoEvent.loadAppInfo(packageName: $packageName, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$LoadAppInfoCopyWith<$Res> implements $AppInfoEventCopyWith<$Res> {
  factory _$LoadAppInfoCopyWith(_LoadAppInfo value, $Res Function(_LoadAppInfo) _then) = __$LoadAppInfoCopyWithImpl;
@useResult
$Res call({
 String packageName, String? mode
});




}
/// @nodoc
class __$LoadAppInfoCopyWithImpl<$Res>
    implements _$LoadAppInfoCopyWith<$Res> {
  __$LoadAppInfoCopyWithImpl(this._self, this._then);

  final _LoadAppInfo _self;
  final $Res Function(_LoadAppInfo) _then;

/// Create a copy of AppInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? mode = freezed,}) {
  return _then(_LoadAppInfo(
null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UpdateAppsInfo implements AppInfoEvent {
  const _UpdateAppsInfo(final  List<String> packageNames): _packageNames = packageNames;
  

 final  List<String> _packageNames;
 List<String> get packageNames {
  if (_packageNames is EqualUnmodifiableListView) return _packageNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packageNames);
}


/// Create a copy of AppInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAppsInfoCopyWith<_UpdateAppsInfo> get copyWith => __$UpdateAppsInfoCopyWithImpl<_UpdateAppsInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAppsInfo&&const DeepCollectionEquality().equals(other._packageNames, _packageNames));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packageNames));

@override
String toString() {
  return 'AppInfoEvent.updateAppsInfo(packageNames: $packageNames)';
}


}

/// @nodoc
abstract mixin class _$UpdateAppsInfoCopyWith<$Res> implements $AppInfoEventCopyWith<$Res> {
  factory _$UpdateAppsInfoCopyWith(_UpdateAppsInfo value, $Res Function(_UpdateAppsInfo) _then) = __$UpdateAppsInfoCopyWithImpl;
@useResult
$Res call({
 List<String> packageNames
});




}
/// @nodoc
class __$UpdateAppsInfoCopyWithImpl<$Res>
    implements _$UpdateAppsInfoCopyWith<$Res> {
  __$UpdateAppsInfoCopyWithImpl(this._self, this._then);

  final _UpdateAppsInfo _self;
  final $Res Function(_UpdateAppsInfo) _then;

/// Create a copy of AppInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageNames = null,}) {
  return _then(_UpdateAppsInfo(
null == packageNames ? _self._packageNames : packageNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$AppInfoState {

 AppInfoStateModel get value;
/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoStateCopyWith<AppInfoState> get copyWith => _$AppInfoStateCopyWithImpl<AppInfoState>(this as AppInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfoState&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AppInfoState(value: $value)';
}


}

/// @nodoc
abstract mixin class $AppInfoStateCopyWith<$Res>  {
  factory $AppInfoStateCopyWith(AppInfoState value, $Res Function(AppInfoState) _then) = _$AppInfoStateCopyWithImpl;
@useResult
$Res call({
 AppInfoStateModel value
});


$AppInfoStateModelCopyWith<$Res> get value;

}
/// @nodoc
class _$AppInfoStateCopyWithImpl<$Res>
    implements $AppInfoStateCopyWith<$Res> {
  _$AppInfoStateCopyWithImpl(this._self, this._then);

  final AppInfoState _self;
  final $Res Function(AppInfoState) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as AppInfoStateModel,
  ));
}
/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoStateModelCopyWith<$Res> get value {
  
  return $AppInfoStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppInfoState].
extension AppInfoStatePatterns on AppInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppInfoStateModel value)?  initial,TResult Function( AppInfoStateModel value)?  loading,TResult Function( AppInfoStateModel value)?  success,TResult Function( AppInfoStateModel value,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.value);case _Loading() when loading != null:
return loading(_that.value);case _Success() when success != null:
return success(_that.value);case _Failure() when failure != null:
return failure(_that.value,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppInfoStateModel value)  initial,required TResult Function( AppInfoStateModel value)  loading,required TResult Function( AppInfoStateModel value)  success,required TResult Function( AppInfoStateModel value,  String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.value);case _Loading():
return loading(_that.value);case _Success():
return success(_that.value);case _Failure():
return failure(_that.value,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppInfoStateModel value)?  initial,TResult? Function( AppInfoStateModel value)?  loading,TResult? Function( AppInfoStateModel value)?  success,TResult? Function( AppInfoStateModel value,  String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.value);case _Loading() when loading != null:
return loading(_that.value);case _Success() when success != null:
return success(_that.value);case _Failure() when failure != null:
return failure(_that.value,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends AppInfoState {
  const _Initial(this.value): super._();
  

@override final  AppInfoStateModel value;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AppInfoState.initial(value: $value)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $AppInfoStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 AppInfoStateModel value
});


@override $AppInfoStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Initial(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as AppInfoStateModel,
  ));
}

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoStateModelCopyWith<$Res> get value {
  
  return $AppInfoStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _Loading extends AppInfoState {
  const _Loading(this.value): super._();
  

@override final  AppInfoStateModel value;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AppInfoState.loading(value: $value)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $AppInfoStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 AppInfoStateModel value
});


@override $AppInfoStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Loading(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as AppInfoStateModel,
  ));
}

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoStateModelCopyWith<$Res> get value {
  
  return $AppInfoStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _Success extends AppInfoState {
  const _Success(this.value): super._();
  

@override final  AppInfoStateModel value;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AppInfoState.success(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AppInfoStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 AppInfoStateModel value
});


@override $AppInfoStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Success(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as AppInfoStateModel,
  ));
}

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoStateModelCopyWith<$Res> get value {
  
  return $AppInfoStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _Failure extends AppInfoState {
  const _Failure(this.value, this.message): super._();
  

@override final  AppInfoStateModel value;
 final  String message;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.value, value) || other.value == value)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,value,message);

@override
String toString() {
  return 'AppInfoState.failure(value: $value, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AppInfoStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@override @useResult
$Res call({
 AppInfoStateModel value, String message
});


@override $AppInfoStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? message = null,}) {
  return _then(_Failure(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as AppInfoStateModel,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AppInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoStateModelCopyWith<$Res> get value {
  
  return $AppInfoStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

// dart format on
