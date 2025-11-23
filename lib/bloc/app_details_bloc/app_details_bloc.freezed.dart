// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDetailsEvent()';
}


}

/// @nodoc
class $AppDetailsEventCopyWith<$Res>  {
$AppDetailsEventCopyWith(AppDetailsEvent _, $Res Function(AppDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [AppDetailsEvent].
extension AppDetailsEventPatterns on AppDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LoadDetails value)?  loadDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoadDetails() when loadDetails != null:
return loadDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LoadDetails value)  loadDetails,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LoadDetails():
return loadDetails(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LoadDetails value)?  loadDetails,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoadDetails() when loadDetails != null:
return loadDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( AppProcessInfo appInfo)?  loadDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LoadDetails() when loadDetails != null:
return loadDetails(_that.appInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( AppProcessInfo appInfo)  loadDetails,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LoadDetails():
return loadDetails(_that.appInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( AppProcessInfo appInfo)?  loadDetails,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LoadDetails() when loadDetails != null:
return loadDetails(_that.appInfo);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AppDetailsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDetailsEvent.started()';
}


}




/// @nodoc


class _LoadDetails implements AppDetailsEvent {
  const _LoadDetails(this.appInfo);
  

 final  AppProcessInfo appInfo;

/// Create a copy of AppDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDetailsCopyWith<_LoadDetails> get copyWith => __$LoadDetailsCopyWithImpl<_LoadDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDetails&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}


@override
int get hashCode => Object.hash(runtimeType,appInfo);

@override
String toString() {
  return 'AppDetailsEvent.loadDetails(appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class _$LoadDetailsCopyWith<$Res> implements $AppDetailsEventCopyWith<$Res> {
  factory _$LoadDetailsCopyWith(_LoadDetails value, $Res Function(_LoadDetails) _then) = __$LoadDetailsCopyWithImpl;
@useResult
$Res call({
 AppProcessInfo appInfo
});


$AppProcessInfoCopyWith<$Res> get appInfo;

}
/// @nodoc
class __$LoadDetailsCopyWithImpl<$Res>
    implements _$LoadDetailsCopyWith<$Res> {
  __$LoadDetailsCopyWithImpl(this._self, this._then);

  final _LoadDetails _self;
  final $Res Function(_LoadDetails) _then;

/// Create a copy of AppDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appInfo = null,}) {
  return _then(_LoadDetails(
null == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppProcessInfo,
  ));
}

/// Create a copy of AppDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppProcessInfoCopyWith<$Res> get appInfo {
  
  return $AppProcessInfoCopyWith<$Res>(_self.appInfo, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}

/// @nodoc
mixin _$AppDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDetailsState()';
}


}

/// @nodoc
class $AppDetailsStateCopyWith<$Res>  {
$AppDetailsStateCopyWith(AppDetailsState _, $Res Function(AppDetailsState) __);
}


/// Adds pattern-matching-related methods to [AppDetailsState].
extension AppDetailsStatePatterns on AppDetailsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( AppProcessInfo appInfo)?  loading,TResult Function( AppProcessInfo appInfo)?  success,TResult Function( AppProcessInfo appInfo,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.appInfo);case _Success() when success != null:
return success(_that.appInfo);case _Failure() when failure != null:
return failure(_that.appInfo,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( AppProcessInfo appInfo)  loading,required TResult Function( AppProcessInfo appInfo)  success,required TResult Function( AppProcessInfo appInfo,  String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading(_that.appInfo);case _Success():
return success(_that.appInfo);case _Failure():
return failure(_that.appInfo,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( AppProcessInfo appInfo)?  loading,TResult? Function( AppProcessInfo appInfo)?  success,TResult? Function( AppProcessInfo appInfo,  String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.appInfo);case _Success() when success != null:
return success(_that.appInfo);case _Failure() when failure != null:
return failure(_that.appInfo,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppDetailsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppDetailsState.initial()';
}


}




/// @nodoc


class _Loading implements AppDetailsState {
  const _Loading(this.appInfo);
  

 final  AppProcessInfo appInfo;

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}


@override
int get hashCode => Object.hash(runtimeType,appInfo);

@override
String toString() {
  return 'AppDetailsState.loading(appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $AppDetailsStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@useResult
$Res call({
 AppProcessInfo appInfo
});


$AppProcessInfoCopyWith<$Res> get appInfo;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appInfo = null,}) {
  return _then(_Loading(
null == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppProcessInfo,
  ));
}

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppProcessInfoCopyWith<$Res> get appInfo {
  
  return $AppProcessInfoCopyWith<$Res>(_self.appInfo, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}

/// @nodoc


class _Success implements AppDetailsState {
  const _Success(this.appInfo);
  

 final  AppProcessInfo appInfo;

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}


@override
int get hashCode => Object.hash(runtimeType,appInfo);

@override
String toString() {
  return 'AppDetailsState.success(appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AppDetailsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 AppProcessInfo appInfo
});


$AppProcessInfoCopyWith<$Res> get appInfo;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appInfo = null,}) {
  return _then(_Success(
null == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppProcessInfo,
  ));
}

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppProcessInfoCopyWith<$Res> get appInfo {
  
  return $AppProcessInfoCopyWith<$Res>(_self.appInfo, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}

/// @nodoc


class _Failure implements AppDetailsState {
  const _Failure(this.appInfo, this.message);
  

 final  AppProcessInfo appInfo;
 final  String message;

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,appInfo,message);

@override
String toString() {
  return 'AppDetailsState.failure(appInfo: $appInfo, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AppDetailsStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 AppProcessInfo appInfo, String message
});


$AppProcessInfoCopyWith<$Res> get appInfo;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appInfo = null,Object? message = null,}) {
  return _then(_Failure(
null == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppProcessInfo,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AppDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppProcessInfoCopyWith<$Res> get appInfo {
  
  return $AppProcessInfoCopyWith<$Res>(_self.appInfo, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}

// dart format on
