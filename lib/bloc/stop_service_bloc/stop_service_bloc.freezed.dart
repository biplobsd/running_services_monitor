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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StopService value)?  stopService,TResult Function( _StopAllServices value)?  stopAllServices,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopService() when stopService != null:
return stopService(_that);case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StopService value)  stopService,required TResult Function( _StopAllServices value)  stopAllServices,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _StopService():
return stopService(_that);case _StopAllServices():
return stopAllServices(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StopService value)?  stopService,TResult? Function( _StopAllServices value)?  stopAllServices,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _StopService() when stopService != null:
return stopService(_that);case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String packageName,  int servicePid)?  stopService,TResult Function( String packageName,  List<int> pids)?  stopAllServices,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopService() when stopService != null:
return stopService(_that.packageName,_that.servicePid);case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that.packageName,_that.pids);case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String packageName,  int servicePid)  stopService,required TResult Function( String packageName,  List<int> pids)  stopAllServices,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _StopService():
return stopService(_that.packageName,_that.servicePid);case _StopAllServices():
return stopAllServices(_that.packageName,_that.pids);case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String packageName,  int servicePid)?  stopService,TResult? Function( String packageName,  List<int> pids)?  stopAllServices,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _StopService() when stopService != null:
return stopService(_that.packageName,_that.servicePid);case _StopAllServices() when stopAllServices != null:
return stopAllServices(_that.packageName,_that.pids);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _StopService implements StopServiceEvent {
  const _StopService({required this.packageName, required this.servicePid});
  

 final  String packageName;
 final  int servicePid;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopServiceCopyWith<_StopService> get copyWith => __$StopServiceCopyWithImpl<_StopService>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopService&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.servicePid, servicePid) || other.servicePid == servicePid));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,servicePid);

@override
String toString() {
  return 'StopServiceEvent.stopService(packageName: $packageName, servicePid: $servicePid)';
}


}

/// @nodoc
abstract mixin class _$StopServiceCopyWith<$Res> implements $StopServiceEventCopyWith<$Res> {
  factory _$StopServiceCopyWith(_StopService value, $Res Function(_StopService) _then) = __$StopServiceCopyWithImpl;
@useResult
$Res call({
 String packageName, int servicePid
});




}
/// @nodoc
class __$StopServiceCopyWithImpl<$Res>
    implements _$StopServiceCopyWith<$Res> {
  __$StopServiceCopyWithImpl(this._self, this._then);

  final _StopService _self;
  final $Res Function(_StopService) _then;

/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? servicePid = null,}) {
  return _then(_StopService(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,servicePid: null == servicePid ? _self.servicePid : servicePid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _StopAllServices implements StopServiceEvent {
  const _StopAllServices({required this.packageName, required final  List<int> pids}): _pids = pids;
  

 final  String packageName;
 final  List<int> _pids;
 List<int> get pids {
  if (_pids is EqualUnmodifiableListView) return _pids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pids);
}


/// Create a copy of StopServiceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopAllServicesCopyWith<_StopAllServices> get copyWith => __$StopAllServicesCopyWithImpl<_StopAllServices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopAllServices&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other._pids, _pids));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,const DeepCollectionEquality().hash(_pids));

@override
String toString() {
  return 'StopServiceEvent.stopAllServices(packageName: $packageName, pids: $pids)';
}


}

/// @nodoc
abstract mixin class _$StopAllServicesCopyWith<$Res> implements $StopServiceEventCopyWith<$Res> {
  factory _$StopAllServicesCopyWith(_StopAllServices value, $Res Function(_StopAllServices) _then) = __$StopAllServicesCopyWithImpl;
@useResult
$Res call({
 String packageName, List<int> pids
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
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? pids = null,}) {
  return _then(_StopAllServices(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,pids: null == pids ? _self._pids : pids // ignore: cast_nullable_to_non_nullable
as List<int>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String packageName)?  stopping,TResult Function( String packageName)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Stopping() when stopping != null:
return stopping(_that.packageName);case _Success() when success != null:
return success(_that.packageName);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String packageName)  stopping,required TResult Function( String packageName)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Stopping():
return stopping(_that.packageName);case _Success():
return success(_that.packageName);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String packageName)?  stopping,TResult? Function( String packageName)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Stopping() when stopping != null:
return stopping(_that.packageName);case _Success() when success != null:
return success(_that.packageName);case _Error() when error != null:
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
  const _Stopping({required this.packageName});
  

 final  String packageName;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoppingCopyWith<_Stopping> get copyWith => __$StoppingCopyWithImpl<_Stopping>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stopping&&(identical(other.packageName, packageName) || other.packageName == packageName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName);

@override
String toString() {
  return 'StopServiceState.stopping(packageName: $packageName)';
}


}

/// @nodoc
abstract mixin class _$StoppingCopyWith<$Res> implements $StopServiceStateCopyWith<$Res> {
  factory _$StoppingCopyWith(_Stopping value, $Res Function(_Stopping) _then) = __$StoppingCopyWithImpl;
@useResult
$Res call({
 String packageName
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
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,}) {
  return _then(_Stopping(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Success implements StopServiceState {
  const _Success({required this.packageName});
  

 final  String packageName;

/// Create a copy of StopServiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.packageName, packageName) || other.packageName == packageName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName);

@override
String toString() {
  return 'StopServiceState.success(packageName: $packageName)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $StopServiceStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String packageName
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
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,}) {
  return _then(_Success(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,
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
