// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StopServiceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopServiceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StopServiceEvent()';
}


}

/// @nodoc
class $StopServiceEventCopyWith<$Res>  {
$StopServiceEventCopyWith(StopServiceEvent _, $Res Function(StopServiceEvent) __);
}


/// Adds pattern-matching-related methods to [StopServiceEvent].
extension StopServiceEventPatterns on StopServiceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StopAllServices value)?  stopAllServices,TResult Function( _StopSingleService value)?  stopSingleService,TResult Function( _StopByPid value)?  stopByPid,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that);case _StopSingleService() when stopSingleService != null:
return stopSingleService(_that);case _StopByPid() when stopByPid != null:
return stopByPid(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StopAllServices value)  stopAllServices,required TResult Function( _StopSingleService value)  stopSingleService,required TResult Function( _StopByPid value)  stopByPid,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _StopAllServices():
return stopAllServices(_that);case _StopSingleService():
return stopSingleService(_that);case _StopByPid():
return stopByPid(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StopAllServices value)?  stopAllServices,TResult? Function( _StopSingleService value)?  stopSingleService,TResult? Function( _StopByPid value)?  stopByPid,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that);case _StopSingleService() when stopSingleService != null:
return stopSingleService(_that);case _StopByPid() when stopByPid != null:
return stopByPid(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String packageName)?  stopAllServices,TResult Function( String packageName,  String serviceName,  int? pid)?  stopSingleService,TResult Function( String packageName,  int pid)?  stopByPid,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that.packageName);case _StopSingleService() when stopSingleService != null:
return stopSingleService(_that.packageName,_that.serviceName,_that.pid);case _StopByPid() when stopByPid != null:
return stopByPid(_that.packageName,_that.pid);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String packageName)  stopAllServices,required TResult Function( String packageName,  String serviceName,  int? pid)  stopSingleService,required TResult Function( String packageName,  int pid)  stopByPid,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _StopAllServices():
return stopAllServices(_that.packageName);case _StopSingleService():
return stopSingleService(_that.packageName,_that.serviceName,_that.pid);case _StopByPid():
return stopByPid(_that.packageName,_that.pid);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String packageName)?  stopAllServices,TResult? Function( String packageName,  String serviceName,  int? pid)?  stopSingleService,TResult? Function( String packageName,  int pid)?  stopByPid,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that.packageName);case _StopSingleService() when stopSingleService != null:
return stopSingleService(_that.packageName,_that.serviceName,_that.pid);case _StopByPid() when stopByPid != null:
return stopByPid(_that.packageName,_that.pid);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _StopAllServices implements StopServiceEvent {
  const _StopAllServices({required this.packageName});
  

 final  String packageName;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopAllServicesCopyWith<_StopAllServices> get copyWith => __$StopAllServicesCopyWithImpl<_StopAllServices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopAllServices&&(identical(other.packageName, packageName) || other.packageName == packageName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName);

@override
String toString() {
  return 'StopServiceEvent.stopAllServices(packageName: $packageName)';
}


}

/// @nodoc
abstract mixin class _$StopAllServicesCopyWith<$Res> implements $StopServiceEventCopyWith<$Res> {
  factory _$StopAllServicesCopyWith(_StopAllServices value, $Res Function(_StopAllServices) _then) = __$StopAllServicesCopyWithImpl;
@useResult
$Res call({
 String packageName
});




}
/// @nodoc
class __$StopAllServicesCopyWithImpl<$Res>
    implements _$StopAllServicesCopyWith<$Res> {
  __$StopAllServicesCopyWithImpl(this._self, this._then);

  final _StopAllServices _self;
  final $Res Function(_StopAllServices) _then;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,}) {
  return _then(_StopAllServices(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StopSingleService implements StopServiceEvent {
  const _StopSingleService({required this.packageName, required this.serviceName, this.pid});
  

 final  String packageName;
 final  String serviceName;
 final  int? pid;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopSingleServiceCopyWith<_StopSingleService> get copyWith => __$StopSingleServiceCopyWithImpl<_StopSingleService>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopSingleService&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.pid, pid) || other.pid == pid));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,serviceName,pid);

@override
String toString() {
  return 'StopServiceEvent.stopSingleService(packageName: $packageName, serviceName: $serviceName, pid: $pid)';
}


}

/// @nodoc
abstract mixin class _$StopSingleServiceCopyWith<$Res> implements $StopServiceEventCopyWith<$Res> {
  factory _$StopSingleServiceCopyWith(_StopSingleService value, $Res Function(_StopSingleService) _then) = __$StopSingleServiceCopyWithImpl;
@useResult
$Res call({
 String packageName, String serviceName, int? pid
});




}
/// @nodoc
class __$StopSingleServiceCopyWithImpl<$Res>
    implements _$StopSingleServiceCopyWith<$Res> {
  __$StopSingleServiceCopyWithImpl(this._self, this._then);

  final _StopSingleService _self;
  final $Res Function(_StopSingleService) _then;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? serviceName = null,Object? pid = freezed,}) {
  return _then(_StopSingleService(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _StopByPid implements StopServiceEvent {
  const _StopByPid({required this.packageName, required this.pid});
  

 final  String packageName;
 final  int pid;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopByPidCopyWith<_StopByPid> get copyWith => __$StopByPidCopyWithImpl<_StopByPid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopByPid&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.pid, pid) || other.pid == pid));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,pid);

@override
String toString() {
  return 'StopServiceEvent.stopByPid(packageName: $packageName, pid: $pid)';
}


}

/// @nodoc
abstract mixin class _$StopByPidCopyWith<$Res> implements $StopServiceEventCopyWith<$Res> {
  factory _$StopByPidCopyWith(_StopByPid value, $Res Function(_StopByPid) _then) = __$StopByPidCopyWithImpl;
@useResult
$Res call({
 String packageName, int pid
});




}
/// @nodoc
class __$StopByPidCopyWithImpl<$Res>
    implements _$StopByPidCopyWith<$Res> {
  __$StopByPidCopyWithImpl(this._self, this._then);

  final _StopByPid _self;
  final $Res Function(_StopByPid) _then;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? pid = null,}) {
  return _then(_StopByPid(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Reset implements StopServiceEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StopServiceEvent.reset()';
}


}




/// @nodoc
mixin _$StopServiceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopServiceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StopServiceState()';
}


}

/// @nodoc
class $StopServiceStateCopyWith<$Res>  {
$StopServiceStateCopyWith(StopServiceState _, $Res Function(StopServiceState) __);
}


/// Adds pattern-matching-related methods to [StopServiceState].
extension StopServiceStatePatterns on StopServiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Stopping value)?  stopping,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Stopping() when stopping != null:
return stopping(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Stopping value)  stopping,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Stopping():
return stopping(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Stopping value)?  stopping,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Stopping() when stopping != null:
return stopping(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String packageName,  String? serviceName)?  stopping,TResult Function( String? packageName,  String? serviceName,  int? pid)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Stopping() when stopping != null:
return stopping(_that.packageName,_that.serviceName);case _Success() when success != null:
return success(_that.packageName,_that.serviceName,_that.pid);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String packageName,  String? serviceName)  stopping,required TResult Function( String? packageName,  String? serviceName,  int? pid)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Stopping():
return stopping(_that.packageName,_that.serviceName);case _Success():
return success(_that.packageName,_that.serviceName,_that.pid);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String packageName,  String? serviceName)?  stopping,TResult? Function( String? packageName,  String? serviceName,  int? pid)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Stopping() when stopping != null:
return stopping(_that.packageName,_that.serviceName);case _Success() when success != null:
return success(_that.packageName,_that.serviceName,_that.pid);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements StopServiceState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StopServiceState.initial()';
}


}




/// @nodoc


class _Stopping implements StopServiceState {
  const _Stopping({required this.packageName, this.serviceName});
  

 final  String packageName;
 final  String? serviceName;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoppingCopyWith<_Stopping> get copyWith => __$StoppingCopyWithImpl<_Stopping>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stopping&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,serviceName);

@override
String toString() {
  return 'StopServiceState.stopping(packageName: $packageName, serviceName: $serviceName)';
}


}

/// @nodoc
abstract mixin class _$StoppingCopyWith<$Res> implements $StopServiceStateCopyWith<$Res> {
  factory _$StoppingCopyWith(_Stopping value, $Res Function(_Stopping) _then) = __$StoppingCopyWithImpl;
@useResult
$Res call({
 String packageName, String? serviceName
});




}
/// @nodoc
class __$StoppingCopyWithImpl<$Res>
    implements _$StoppingCopyWith<$Res> {
  __$StoppingCopyWithImpl(this._self, this._then);

  final _Stopping _self;
  final $Res Function(_Stopping) _then;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? serviceName = freezed,}) {
  return _then(_Stopping(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Success implements StopServiceState {
  const _Success({this.packageName, this.serviceName, this.pid});
  

 final  String? packageName;
 final  String? serviceName;
 final  int? pid;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.pid, pid) || other.pid == pid));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,serviceName,pid);

@override
String toString() {
  return 'StopServiceState.success(packageName: $packageName, serviceName: $serviceName, pid: $pid)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $StopServiceStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String? packageName, String? serviceName, int? pid
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = freezed,Object? serviceName = freezed,Object? pid = freezed,}) {
  return _then(_Success(
packageName: freezed == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String?,serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _Error implements StopServiceState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'StopServiceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $StopServiceStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
