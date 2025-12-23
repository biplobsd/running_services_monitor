// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_output_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommandOutputEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandOutputEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandOutputEvent()';
}


}

/// @nodoc
class $CommandOutputEventCopyWith<$Res>  {
$CommandOutputEventCopyWith(CommandOutputEvent _, $Res Function(CommandOutputEvent) __);
}


/// Adds pattern-matching-related methods to [CommandOutputEvent].
extension CommandOutputEventPatterns on CommandOutputEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refresh value)?  refresh,TResult Function( _SetAutoRefreshInterval value)?  setAutoRefreshInterval,TResult Function( _UpdateEntry value)?  updateEntry,TResult Function( _StopRefreshing value)?  stopRefreshing,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refresh() when refresh != null:
return refresh(_that);case _SetAutoRefreshInterval() when setAutoRefreshInterval != null:
return setAutoRefreshInterval(_that);case _UpdateEntry() when updateEntry != null:
return updateEntry(_that);case _StopRefreshing() when stopRefreshing != null:
return stopRefreshing(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refresh value)  refresh,required TResult Function( _SetAutoRefreshInterval value)  setAutoRefreshInterval,required TResult Function( _UpdateEntry value)  updateEntry,required TResult Function( _StopRefreshing value)  stopRefreshing,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refresh():
return refresh(_that);case _SetAutoRefreshInterval():
return setAutoRefreshInterval(_that);case _UpdateEntry():
return updateEntry(_that);case _StopRefreshing():
return stopRefreshing(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refresh value)?  refresh,TResult? Function( _SetAutoRefreshInterval value)?  setAutoRefreshInterval,TResult? Function( _UpdateEntry value)?  updateEntry,TResult? Function( _StopRefreshing value)?  stopRefreshing,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refresh() when refresh != null:
return refresh(_that);case _SetAutoRefreshInterval() when setAutoRefreshInterval != null:
return setAutoRefreshInterval(_that);case _UpdateEntry() when updateEntry != null:
return updateEntry(_that);case _StopRefreshing() when stopRefreshing != null:
return stopRefreshing(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String entryId,  String command)?  started,TResult Function()?  refresh,TResult Function( Duration? interval)?  setAutoRefreshInterval,TResult Function( String entryId)?  updateEntry,TResult Function()?  stopRefreshing,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.entryId,_that.command);case _Refresh() when refresh != null:
return refresh();case _SetAutoRefreshInterval() when setAutoRefreshInterval != null:
return setAutoRefreshInterval(_that.interval);case _UpdateEntry() when updateEntry != null:
return updateEntry(_that.entryId);case _StopRefreshing() when stopRefreshing != null:
return stopRefreshing();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String entryId,  String command)  started,required TResult Function()  refresh,required TResult Function( Duration? interval)  setAutoRefreshInterval,required TResult Function( String entryId)  updateEntry,required TResult Function()  stopRefreshing,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.entryId,_that.command);case _Refresh():
return refresh();case _SetAutoRefreshInterval():
return setAutoRefreshInterval(_that.interval);case _UpdateEntry():
return updateEntry(_that.entryId);case _StopRefreshing():
return stopRefreshing();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String entryId,  String command)?  started,TResult? Function()?  refresh,TResult? Function( Duration? interval)?  setAutoRefreshInterval,TResult? Function( String entryId)?  updateEntry,TResult? Function()?  stopRefreshing,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.entryId,_that.command);case _Refresh() when refresh != null:
return refresh();case _SetAutoRefreshInterval() when setAutoRefreshInterval != null:
return setAutoRefreshInterval(_that.interval);case _UpdateEntry() when updateEntry != null:
return updateEntry(_that.entryId);case _StopRefreshing() when stopRefreshing != null:
return stopRefreshing();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CommandOutputEvent {
  const _Started({required this.entryId, required this.command});
  

 final  String entryId;
 final  String command;

/// Create a copy of CommandOutputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.command, command) || other.command == command));
}


@override
int get hashCode => Object.hash(runtimeType,entryId,command);

@override
String toString() {
  return 'CommandOutputEvent.started(entryId: $entryId, command: $command)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $CommandOutputEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String entryId, String command
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of CommandOutputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entryId = null,Object? command = null,}) {
  return _then(_Started(
entryId: null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Refresh implements CommandOutputEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandOutputEvent.refresh()';
}


}




/// @nodoc


class _SetAutoRefreshInterval implements CommandOutputEvent {
  const _SetAutoRefreshInterval(this.interval);
  

 final  Duration? interval;

/// Create a copy of CommandOutputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetAutoRefreshIntervalCopyWith<_SetAutoRefreshInterval> get copyWith => __$SetAutoRefreshIntervalCopyWithImpl<_SetAutoRefreshInterval>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetAutoRefreshInterval&&(identical(other.interval, interval) || other.interval == interval));
}


@override
int get hashCode => Object.hash(runtimeType,interval);

@override
String toString() {
  return 'CommandOutputEvent.setAutoRefreshInterval(interval: $interval)';
}


}

/// @nodoc
abstract mixin class _$SetAutoRefreshIntervalCopyWith<$Res> implements $CommandOutputEventCopyWith<$Res> {
  factory _$SetAutoRefreshIntervalCopyWith(_SetAutoRefreshInterval value, $Res Function(_SetAutoRefreshInterval) _then) = __$SetAutoRefreshIntervalCopyWithImpl;
@useResult
$Res call({
 Duration? interval
});




}
/// @nodoc
class __$SetAutoRefreshIntervalCopyWithImpl<$Res>
    implements _$SetAutoRefreshIntervalCopyWith<$Res> {
  __$SetAutoRefreshIntervalCopyWithImpl(this._self, this._then);

  final _SetAutoRefreshInterval _self;
  final $Res Function(_SetAutoRefreshInterval) _then;

/// Create a copy of CommandOutputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interval = freezed,}) {
  return _then(_SetAutoRefreshInterval(
freezed == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

/// @nodoc


class _UpdateEntry implements CommandOutputEvent {
  const _UpdateEntry(this.entryId);
  

 final  String entryId;

/// Create a copy of CommandOutputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateEntryCopyWith<_UpdateEntry> get copyWith => __$UpdateEntryCopyWithImpl<_UpdateEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateEntry&&(identical(other.entryId, entryId) || other.entryId == entryId));
}


@override
int get hashCode => Object.hash(runtimeType,entryId);

@override
String toString() {
  return 'CommandOutputEvent.updateEntry(entryId: $entryId)';
}


}

/// @nodoc
abstract mixin class _$UpdateEntryCopyWith<$Res> implements $CommandOutputEventCopyWith<$Res> {
  factory _$UpdateEntryCopyWith(_UpdateEntry value, $Res Function(_UpdateEntry) _then) = __$UpdateEntryCopyWithImpl;
@useResult
$Res call({
 String entryId
});




}
/// @nodoc
class __$UpdateEntryCopyWithImpl<$Res>
    implements _$UpdateEntryCopyWith<$Res> {
  __$UpdateEntryCopyWithImpl(this._self, this._then);

  final _UpdateEntry _self;
  final $Res Function(_UpdateEntry) _then;

/// Create a copy of CommandOutputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entryId = null,}) {
  return _then(_UpdateEntry(
null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StopRefreshing implements CommandOutputEvent {
  const _StopRefreshing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopRefreshing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandOutputEvent.stopRefreshing()';
}


}




/// @nodoc
mixin _$CommandOutputState {

 String get currentEntryId; String get command; Duration? get autoRefreshInterval; bool get isRefreshing;
/// Create a copy of CommandOutputState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandOutputStateCopyWith<CommandOutputState> get copyWith => _$CommandOutputStateCopyWithImpl<CommandOutputState>(this as CommandOutputState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandOutputState&&(identical(other.currentEntryId, currentEntryId) || other.currentEntryId == currentEntryId)&&(identical(other.command, command) || other.command == command)&&(identical(other.autoRefreshInterval, autoRefreshInterval) || other.autoRefreshInterval == autoRefreshInterval)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,currentEntryId,command,autoRefreshInterval,isRefreshing);

@override
String toString() {
  return 'CommandOutputState(currentEntryId: $currentEntryId, command: $command, autoRefreshInterval: $autoRefreshInterval, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $CommandOutputStateCopyWith<$Res>  {
  factory $CommandOutputStateCopyWith(CommandOutputState value, $Res Function(CommandOutputState) _then) = _$CommandOutputStateCopyWithImpl;
@useResult
$Res call({
 String currentEntryId, String command, Duration? autoRefreshInterval, bool isRefreshing
});




}
/// @nodoc
class _$CommandOutputStateCopyWithImpl<$Res>
    implements $CommandOutputStateCopyWith<$Res> {
  _$CommandOutputStateCopyWithImpl(this._self, this._then);

  final CommandOutputState _self;
  final $Res Function(CommandOutputState) _then;

/// Create a copy of CommandOutputState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentEntryId = null,Object? command = null,Object? autoRefreshInterval = freezed,Object? isRefreshing = null,}) {
  return _then(_self.copyWith(
currentEntryId: null == currentEntryId ? _self.currentEntryId : currentEntryId // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,autoRefreshInterval: freezed == autoRefreshInterval ? _self.autoRefreshInterval : autoRefreshInterval // ignore: cast_nullable_to_non_nullable
as Duration?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandOutputState].
extension CommandOutputStatePatterns on CommandOutputState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandOutputState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandOutputState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandOutputState value)  $default,){
final _that = this;
switch (_that) {
case _CommandOutputState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandOutputState value)?  $default,){
final _that = this;
switch (_that) {
case _CommandOutputState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentEntryId,  String command,  Duration? autoRefreshInterval,  bool isRefreshing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandOutputState() when $default != null:
return $default(_that.currentEntryId,_that.command,_that.autoRefreshInterval,_that.isRefreshing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentEntryId,  String command,  Duration? autoRefreshInterval,  bool isRefreshing)  $default,) {final _that = this;
switch (_that) {
case _CommandOutputState():
return $default(_that.currentEntryId,_that.command,_that.autoRefreshInterval,_that.isRefreshing);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentEntryId,  String command,  Duration? autoRefreshInterval,  bool isRefreshing)?  $default,) {final _that = this;
switch (_that) {
case _CommandOutputState() when $default != null:
return $default(_that.currentEntryId,_that.command,_that.autoRefreshInterval,_that.isRefreshing);case _:
  return null;

}
}

}

/// @nodoc


class _CommandOutputState implements CommandOutputState {
  const _CommandOutputState({required this.currentEntryId, required this.command, this.autoRefreshInterval, this.isRefreshing = false});
  

@override final  String currentEntryId;
@override final  String command;
@override final  Duration? autoRefreshInterval;
@override@JsonKey() final  bool isRefreshing;

/// Create a copy of CommandOutputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandOutputStateCopyWith<_CommandOutputState> get copyWith => __$CommandOutputStateCopyWithImpl<_CommandOutputState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandOutputState&&(identical(other.currentEntryId, currentEntryId) || other.currentEntryId == currentEntryId)&&(identical(other.command, command) || other.command == command)&&(identical(other.autoRefreshInterval, autoRefreshInterval) || other.autoRefreshInterval == autoRefreshInterval)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,currentEntryId,command,autoRefreshInterval,isRefreshing);

@override
String toString() {
  return 'CommandOutputState(currentEntryId: $currentEntryId, command: $command, autoRefreshInterval: $autoRefreshInterval, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$CommandOutputStateCopyWith<$Res> implements $CommandOutputStateCopyWith<$Res> {
  factory _$CommandOutputStateCopyWith(_CommandOutputState value, $Res Function(_CommandOutputState) _then) = __$CommandOutputStateCopyWithImpl;
@override @useResult
$Res call({
 String currentEntryId, String command, Duration? autoRefreshInterval, bool isRefreshing
});




}
/// @nodoc
class __$CommandOutputStateCopyWithImpl<$Res>
    implements _$CommandOutputStateCopyWith<$Res> {
  __$CommandOutputStateCopyWithImpl(this._self, this._then);

  final _CommandOutputState _self;
  final $Res Function(_CommandOutputState) _then;

/// Create a copy of CommandOutputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentEntryId = null,Object? command = null,Object? autoRefreshInterval = freezed,Object? isRefreshing = null,}) {
  return _then(_CommandOutputState(
currentEntryId: null == currentEntryId ? _self.currentEntryId : currentEntryId // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,autoRefreshInterval: freezed == autoRefreshInterval ? _self.autoRefreshInterval : autoRefreshInterval // ignore: cast_nullable_to_non_nullable
as Duration?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
