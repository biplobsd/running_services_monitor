// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_commands_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsefulCommandsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulCommandsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsefulCommandsEvent()';
}


}

/// @nodoc
class $UsefulCommandsEventCopyWith<$Res>  {
$UsefulCommandsEventCopyWith(UsefulCommandsEvent _, $Res Function(UsefulCommandsEvent) __);
}


/// Adds pattern-matching-related methods to [UsefulCommandsEvent].
extension UsefulCommandsEventPatterns on UsefulCommandsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddCommand value)?  addCommand,TResult Function( _RemoveCommand value)?  removeCommand,TResult Function( _HideDefaultCommand value)?  hideDefaultCommand,TResult Function( _ResetDefaults value)?  resetDefaults,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddCommand() when addCommand != null:
return addCommand(_that);case _RemoveCommand() when removeCommand != null:
return removeCommand(_that);case _HideDefaultCommand() when hideDefaultCommand != null:
return hideDefaultCommand(_that);case _ResetDefaults() when resetDefaults != null:
return resetDefaults(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddCommand value)  addCommand,required TResult Function( _RemoveCommand value)  removeCommand,required TResult Function( _HideDefaultCommand value)  hideDefaultCommand,required TResult Function( _ResetDefaults value)  resetDefaults,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddCommand():
return addCommand(_that);case _RemoveCommand():
return removeCommand(_that);case _HideDefaultCommand():
return hideDefaultCommand(_that);case _ResetDefaults():
return resetDefaults(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddCommand value)?  addCommand,TResult? Function( _RemoveCommand value)?  removeCommand,TResult? Function( _HideDefaultCommand value)?  hideDefaultCommand,TResult? Function( _ResetDefaults value)?  resetDefaults,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddCommand() when addCommand != null:
return addCommand(_that);case _RemoveCommand() when removeCommand != null:
return removeCommand(_that);case _HideDefaultCommand() when hideDefaultCommand != null:
return hideDefaultCommand(_that);case _ResetDefaults() when resetDefaults != null:
return resetDefaults(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String title,  String description,  String command)?  addCommand,TResult Function( String id)?  removeCommand,TResult Function( String id)?  hideDefaultCommand,TResult Function()?  resetDefaults,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddCommand() when addCommand != null:
return addCommand(_that.title,_that.description,_that.command);case _RemoveCommand() when removeCommand != null:
return removeCommand(_that.id);case _HideDefaultCommand() when hideDefaultCommand != null:
return hideDefaultCommand(_that.id);case _ResetDefaults() when resetDefaults != null:
return resetDefaults();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String title,  String description,  String command)  addCommand,required TResult Function( String id)  removeCommand,required TResult Function( String id)  hideDefaultCommand,required TResult Function()  resetDefaults,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddCommand():
return addCommand(_that.title,_that.description,_that.command);case _RemoveCommand():
return removeCommand(_that.id);case _HideDefaultCommand():
return hideDefaultCommand(_that.id);case _ResetDefaults():
return resetDefaults();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String title,  String description,  String command)?  addCommand,TResult? Function( String id)?  removeCommand,TResult? Function( String id)?  hideDefaultCommand,TResult? Function()?  resetDefaults,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddCommand() when addCommand != null:
return addCommand(_that.title,_that.description,_that.command);case _RemoveCommand() when removeCommand != null:
return removeCommand(_that.id);case _HideDefaultCommand() when hideDefaultCommand != null:
return hideDefaultCommand(_that.id);case _ResetDefaults() when resetDefaults != null:
return resetDefaults();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UsefulCommandsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsefulCommandsEvent.started()';
}


}




/// @nodoc


class _AddCommand implements UsefulCommandsEvent {
  const _AddCommand({required this.title, required this.description, required this.command});
  

 final  String title;
 final  String description;
 final  String command;

/// Create a copy of UsefulCommandsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCommandCopyWith<_AddCommand> get copyWith => __$AddCommandCopyWithImpl<_AddCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCommand&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.command, command) || other.command == command));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,command);

@override
String toString() {
  return 'UsefulCommandsEvent.addCommand(title: $title, description: $description, command: $command)';
}


}

/// @nodoc
abstract mixin class _$AddCommandCopyWith<$Res> implements $UsefulCommandsEventCopyWith<$Res> {
  factory _$AddCommandCopyWith(_AddCommand value, $Res Function(_AddCommand) _then) = __$AddCommandCopyWithImpl;
@useResult
$Res call({
 String title, String description, String command
});




}
/// @nodoc
class __$AddCommandCopyWithImpl<$Res>
    implements _$AddCommandCopyWith<$Res> {
  __$AddCommandCopyWithImpl(this._self, this._then);

  final _AddCommand _self;
  final $Res Function(_AddCommand) _then;

/// Create a copy of UsefulCommandsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? command = null,}) {
  return _then(_AddCommand(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveCommand implements UsefulCommandsEvent {
  const _RemoveCommand(this.id);
  

 final  String id;

/// Create a copy of UsefulCommandsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCommandCopyWith<_RemoveCommand> get copyWith => __$RemoveCommandCopyWithImpl<_RemoveCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveCommand&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'UsefulCommandsEvent.removeCommand(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RemoveCommandCopyWith<$Res> implements $UsefulCommandsEventCopyWith<$Res> {
  factory _$RemoveCommandCopyWith(_RemoveCommand value, $Res Function(_RemoveCommand) _then) = __$RemoveCommandCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$RemoveCommandCopyWithImpl<$Res>
    implements _$RemoveCommandCopyWith<$Res> {
  __$RemoveCommandCopyWithImpl(this._self, this._then);

  final _RemoveCommand _self;
  final $Res Function(_RemoveCommand) _then;

/// Create a copy of UsefulCommandsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RemoveCommand(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _HideDefaultCommand implements UsefulCommandsEvent {
  const _HideDefaultCommand(this.id);
  

 final  String id;

/// Create a copy of UsefulCommandsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HideDefaultCommandCopyWith<_HideDefaultCommand> get copyWith => __$HideDefaultCommandCopyWithImpl<_HideDefaultCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HideDefaultCommand&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'UsefulCommandsEvent.hideDefaultCommand(id: $id)';
}


}

/// @nodoc
abstract mixin class _$HideDefaultCommandCopyWith<$Res> implements $UsefulCommandsEventCopyWith<$Res> {
  factory _$HideDefaultCommandCopyWith(_HideDefaultCommand value, $Res Function(_HideDefaultCommand) _then) = __$HideDefaultCommandCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$HideDefaultCommandCopyWithImpl<$Res>
    implements _$HideDefaultCommandCopyWith<$Res> {
  __$HideDefaultCommandCopyWithImpl(this._self, this._then);

  final _HideDefaultCommand _self;
  final $Res Function(_HideDefaultCommand) _then;

/// Create a copy of UsefulCommandsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_HideDefaultCommand(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResetDefaults implements UsefulCommandsEvent {
  const _ResetDefaults();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetDefaults);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsefulCommandsEvent.resetDefaults()';
}


}





/// @nodoc
mixin _$UsefulCommandsState {

 List<UsefulCommand> get userCommands; Set<String> get hiddenDefaultCommandIds;
/// Create a copy of UsefulCommandsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsefulCommandsStateCopyWith<UsefulCommandsState> get copyWith => _$UsefulCommandsStateCopyWithImpl<UsefulCommandsState>(this as UsefulCommandsState, _$identity);

  /// Serializes this UsefulCommandsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulCommandsState&&const DeepCollectionEquality().equals(other.userCommands, userCommands)&&const DeepCollectionEquality().equals(other.hiddenDefaultCommandIds, hiddenDefaultCommandIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userCommands),const DeepCollectionEquality().hash(hiddenDefaultCommandIds));

@override
String toString() {
  return 'UsefulCommandsState(userCommands: $userCommands, hiddenDefaultCommandIds: $hiddenDefaultCommandIds)';
}


}

/// @nodoc
abstract mixin class $UsefulCommandsStateCopyWith<$Res>  {
  factory $UsefulCommandsStateCopyWith(UsefulCommandsState value, $Res Function(UsefulCommandsState) _then) = _$UsefulCommandsStateCopyWithImpl;
@useResult
$Res call({
 List<UsefulCommand> userCommands, Set<String> hiddenDefaultCommandIds
});




}
/// @nodoc
class _$UsefulCommandsStateCopyWithImpl<$Res>
    implements $UsefulCommandsStateCopyWith<$Res> {
  _$UsefulCommandsStateCopyWithImpl(this._self, this._then);

  final UsefulCommandsState _self;
  final $Res Function(UsefulCommandsState) _then;

/// Create a copy of UsefulCommandsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userCommands = null,Object? hiddenDefaultCommandIds = null,}) {
  return _then(_self.copyWith(
userCommands: null == userCommands ? _self.userCommands : userCommands // ignore: cast_nullable_to_non_nullable
as List<UsefulCommand>,hiddenDefaultCommandIds: null == hiddenDefaultCommandIds ? _self.hiddenDefaultCommandIds : hiddenDefaultCommandIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UsefulCommandsState].
extension UsefulCommandsStatePatterns on UsefulCommandsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsefulCommandsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsefulCommandsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsefulCommandsState value)  $default,){
final _that = this;
switch (_that) {
case _UsefulCommandsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsefulCommandsState value)?  $default,){
final _that = this;
switch (_that) {
case _UsefulCommandsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UsefulCommand> userCommands,  Set<String> hiddenDefaultCommandIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsefulCommandsState() when $default != null:
return $default(_that.userCommands,_that.hiddenDefaultCommandIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UsefulCommand> userCommands,  Set<String> hiddenDefaultCommandIds)  $default,) {final _that = this;
switch (_that) {
case _UsefulCommandsState():
return $default(_that.userCommands,_that.hiddenDefaultCommandIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UsefulCommand> userCommands,  Set<String> hiddenDefaultCommandIds)?  $default,) {final _that = this;
switch (_that) {
case _UsefulCommandsState() when $default != null:
return $default(_that.userCommands,_that.hiddenDefaultCommandIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsefulCommandsState extends UsefulCommandsState {
  const _UsefulCommandsState({final  List<UsefulCommand> userCommands = const [], final  Set<String> hiddenDefaultCommandIds = const <String>{}}): _userCommands = userCommands,_hiddenDefaultCommandIds = hiddenDefaultCommandIds,super._();
  factory _UsefulCommandsState.fromJson(Map<String, dynamic> json) => _$UsefulCommandsStateFromJson(json);

 final  List<UsefulCommand> _userCommands;
@override@JsonKey() List<UsefulCommand> get userCommands {
  if (_userCommands is EqualUnmodifiableListView) return _userCommands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userCommands);
}

 final  Set<String> _hiddenDefaultCommandIds;
@override@JsonKey() Set<String> get hiddenDefaultCommandIds {
  if (_hiddenDefaultCommandIds is EqualUnmodifiableSetView) return _hiddenDefaultCommandIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_hiddenDefaultCommandIds);
}


/// Create a copy of UsefulCommandsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsefulCommandsStateCopyWith<_UsefulCommandsState> get copyWith => __$UsefulCommandsStateCopyWithImpl<_UsefulCommandsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsefulCommandsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsefulCommandsState&&const DeepCollectionEquality().equals(other._userCommands, _userCommands)&&const DeepCollectionEquality().equals(other._hiddenDefaultCommandIds, _hiddenDefaultCommandIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userCommands),const DeepCollectionEquality().hash(_hiddenDefaultCommandIds));

@override
String toString() {
  return 'UsefulCommandsState(userCommands: $userCommands, hiddenDefaultCommandIds: $hiddenDefaultCommandIds)';
}


}

/// @nodoc
abstract mixin class _$UsefulCommandsStateCopyWith<$Res> implements $UsefulCommandsStateCopyWith<$Res> {
  factory _$UsefulCommandsStateCopyWith(_UsefulCommandsState value, $Res Function(_UsefulCommandsState) _then) = __$UsefulCommandsStateCopyWithImpl;
@override @useResult
$Res call({
 List<UsefulCommand> userCommands, Set<String> hiddenDefaultCommandIds
});




}
/// @nodoc
class __$UsefulCommandsStateCopyWithImpl<$Res>
    implements _$UsefulCommandsStateCopyWith<$Res> {
  __$UsefulCommandsStateCopyWithImpl(this._self, this._then);

  final _UsefulCommandsState _self;
  final $Res Function(_UsefulCommandsState) _then;

/// Create a copy of UsefulCommandsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userCommands = null,Object? hiddenDefaultCommandIds = null,}) {
  return _then(_UsefulCommandsState(
userCommands: null == userCommands ? _self._userCommands : userCommands // ignore: cast_nullable_to_non_nullable
as List<UsefulCommand>,hiddenDefaultCommandIds: null == hiddenDefaultCommandIds ? _self._hiddenDefaultCommandIds : hiddenDefaultCommandIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
