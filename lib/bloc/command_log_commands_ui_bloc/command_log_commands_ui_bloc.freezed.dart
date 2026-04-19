// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_log_commands_ui_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommandLogCommandsUiEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandLogCommandsUiEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandLogCommandsUiEvent()';
}


}

/// @nodoc
class $CommandLogCommandsUiEventCopyWith<$Res>  {
$CommandLogCommandsUiEventCopyWith(CommandLogCommandsUiEvent _, $Res Function(CommandLogCommandsUiEvent) __);
}


/// Adds pattern-matching-related methods to [CommandLogCommandsUiEvent].
extension CommandLogCommandsUiEventPatterns on CommandLogCommandsUiEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToggleAddForm value)?  toggleAddForm,TResult Function( _HideAddForm value)?  hideAddForm,TResult Function( _SetLoadingCommand value)?  setLoadingCommand,TResult Function( _SetEditingCommand value)?  setEditingCommand,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm(_that);case _HideAddForm() when hideAddForm != null:
return hideAddForm(_that);case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that);case _SetEditingCommand() when setEditingCommand != null:
return setEditingCommand(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToggleAddForm value)  toggleAddForm,required TResult Function( _HideAddForm value)  hideAddForm,required TResult Function( _SetLoadingCommand value)  setLoadingCommand,required TResult Function( _SetEditingCommand value)  setEditingCommand,}){
final _that = this;
switch (_that) {
case _ToggleAddForm():
return toggleAddForm(_that);case _HideAddForm():
return hideAddForm(_that);case _SetLoadingCommand():
return setLoadingCommand(_that);case _SetEditingCommand():
return setEditingCommand(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToggleAddForm value)?  toggleAddForm,TResult? Function( _HideAddForm value)?  hideAddForm,TResult? Function( _SetLoadingCommand value)?  setLoadingCommand,TResult? Function( _SetEditingCommand value)?  setEditingCommand,}){
final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm(_that);case _HideAddForm() when hideAddForm != null:
return hideAddForm(_that);case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that);case _SetEditingCommand() when setEditingCommand != null:
return setEditingCommand(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  toggleAddForm,TResult Function()?  hideAddForm,TResult Function( String? commandId)?  setLoadingCommand,TResult Function( String? commandId)?  setEditingCommand,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm();case _HideAddForm() when hideAddForm != null:
return hideAddForm();case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that.commandId);case _SetEditingCommand() when setEditingCommand != null:
return setEditingCommand(_that.commandId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  toggleAddForm,required TResult Function()  hideAddForm,required TResult Function( String? commandId)  setLoadingCommand,required TResult Function( String? commandId)  setEditingCommand,}) {final _that = this;
switch (_that) {
case _ToggleAddForm():
return toggleAddForm();case _HideAddForm():
return hideAddForm();case _SetLoadingCommand():
return setLoadingCommand(_that.commandId);case _SetEditingCommand():
return setEditingCommand(_that.commandId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  toggleAddForm,TResult? Function()?  hideAddForm,TResult? Function( String? commandId)?  setLoadingCommand,TResult? Function( String? commandId)?  setEditingCommand,}) {final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm();case _HideAddForm() when hideAddForm != null:
return hideAddForm();case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that.commandId);case _SetEditingCommand() when setEditingCommand != null:
return setEditingCommand(_that.commandId);case _:
  return null;

}
}

}

/// @nodoc


class _ToggleAddForm implements CommandLogCommandsUiEvent {
  const _ToggleAddForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleAddForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandLogCommandsUiEvent.toggleAddForm()';
}


}




/// @nodoc


class _HideAddForm implements CommandLogCommandsUiEvent {
  const _HideAddForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HideAddForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommandLogCommandsUiEvent.hideAddForm()';
}


}




/// @nodoc


class _SetLoadingCommand implements CommandLogCommandsUiEvent {
  const _SetLoadingCommand(this.commandId);
  

 final  String? commandId;

/// Create a copy of CommandLogCommandsUiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoadingCommandCopyWith<_SetLoadingCommand> get copyWith => __$SetLoadingCommandCopyWithImpl<_SetLoadingCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoadingCommand&&(identical(other.commandId, commandId) || other.commandId == commandId));
}


@override
int get hashCode => Object.hash(runtimeType,commandId);

@override
String toString() {
  return 'CommandLogCommandsUiEvent.setLoadingCommand(commandId: $commandId)';
}


}

/// @nodoc
abstract mixin class _$SetLoadingCommandCopyWith<$Res> implements $CommandLogCommandsUiEventCopyWith<$Res> {
  factory _$SetLoadingCommandCopyWith(_SetLoadingCommand value, $Res Function(_SetLoadingCommand) _then) = __$SetLoadingCommandCopyWithImpl;
@useResult
$Res call({
 String? commandId
});




}
/// @nodoc
class __$SetLoadingCommandCopyWithImpl<$Res>
    implements _$SetLoadingCommandCopyWith<$Res> {
  __$SetLoadingCommandCopyWithImpl(this._self, this._then);

  final _SetLoadingCommand _self;
  final $Res Function(_SetLoadingCommand) _then;

/// Create a copy of CommandLogCommandsUiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commandId = freezed,}) {
  return _then(_SetLoadingCommand(
freezed == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetEditingCommand implements CommandLogCommandsUiEvent {
  const _SetEditingCommand(this.commandId);
  

 final  String? commandId;

/// Create a copy of CommandLogCommandsUiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetEditingCommandCopyWith<_SetEditingCommand> get copyWith => __$SetEditingCommandCopyWithImpl<_SetEditingCommand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetEditingCommand&&(identical(other.commandId, commandId) || other.commandId == commandId));
}


@override
int get hashCode => Object.hash(runtimeType,commandId);

@override
String toString() {
  return 'CommandLogCommandsUiEvent.setEditingCommand(commandId: $commandId)';
}


}

/// @nodoc
abstract mixin class _$SetEditingCommandCopyWith<$Res> implements $CommandLogCommandsUiEventCopyWith<$Res> {
  factory _$SetEditingCommandCopyWith(_SetEditingCommand value, $Res Function(_SetEditingCommand) _then) = __$SetEditingCommandCopyWithImpl;
@useResult
$Res call({
 String? commandId
});




}
/// @nodoc
class __$SetEditingCommandCopyWithImpl<$Res>
    implements _$SetEditingCommandCopyWith<$Res> {
  __$SetEditingCommandCopyWithImpl(this._self, this._then);

  final _SetEditingCommand _self;
  final $Res Function(_SetEditingCommand) _then;

/// Create a copy of CommandLogCommandsUiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commandId = freezed,}) {
  return _then(_SetEditingCommand(
freezed == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CommandLogCommandsUiState {

 bool get showAddForm; String? get loadingCommandId; String? get editingCommandId;
/// Create a copy of CommandLogCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandLogCommandsUiStateCopyWith<CommandLogCommandsUiState> get copyWith => _$CommandLogCommandsUiStateCopyWithImpl<CommandLogCommandsUiState>(this as CommandLogCommandsUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandLogCommandsUiState&&(identical(other.showAddForm, showAddForm) || other.showAddForm == showAddForm)&&(identical(other.loadingCommandId, loadingCommandId) || other.loadingCommandId == loadingCommandId)&&(identical(other.editingCommandId, editingCommandId) || other.editingCommandId == editingCommandId));
}


@override
int get hashCode => Object.hash(runtimeType,showAddForm,loadingCommandId,editingCommandId);

@override
String toString() {
  return 'CommandLogCommandsUiState(showAddForm: $showAddForm, loadingCommandId: $loadingCommandId, editingCommandId: $editingCommandId)';
}


}

/// @nodoc
abstract mixin class $CommandLogCommandsUiStateCopyWith<$Res>  {
  factory $CommandLogCommandsUiStateCopyWith(CommandLogCommandsUiState value, $Res Function(CommandLogCommandsUiState) _then) = _$CommandLogCommandsUiStateCopyWithImpl;
@useResult
$Res call({
 bool showAddForm, String? loadingCommandId, String? editingCommandId
});




}
/// @nodoc
class _$CommandLogCommandsUiStateCopyWithImpl<$Res>
    implements $CommandLogCommandsUiStateCopyWith<$Res> {
  _$CommandLogCommandsUiStateCopyWithImpl(this._self, this._then);

  final CommandLogCommandsUiState _self;
  final $Res Function(CommandLogCommandsUiState) _then;

/// Create a copy of CommandLogCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showAddForm = null,Object? loadingCommandId = freezed,Object? editingCommandId = freezed,}) {
  return _then(_self.copyWith(
showAddForm: null == showAddForm ? _self.showAddForm : showAddForm // ignore: cast_nullable_to_non_nullable
as bool,loadingCommandId: freezed == loadingCommandId ? _self.loadingCommandId : loadingCommandId // ignore: cast_nullable_to_non_nullable
as String?,editingCommandId: freezed == editingCommandId ? _self.editingCommandId : editingCommandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandLogCommandsUiState].
extension CommandLogCommandsUiStatePatterns on CommandLogCommandsUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandLogCommandsUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandLogCommandsUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandLogCommandsUiState value)  $default,){
final _that = this;
switch (_that) {
case _CommandLogCommandsUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandLogCommandsUiState value)?  $default,){
final _that = this;
switch (_that) {
case _CommandLogCommandsUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showAddForm,  String? loadingCommandId,  String? editingCommandId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandLogCommandsUiState() when $default != null:
return $default(_that.showAddForm,_that.loadingCommandId,_that.editingCommandId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showAddForm,  String? loadingCommandId,  String? editingCommandId)  $default,) {final _that = this;
switch (_that) {
case _CommandLogCommandsUiState():
return $default(_that.showAddForm,_that.loadingCommandId,_that.editingCommandId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showAddForm,  String? loadingCommandId,  String? editingCommandId)?  $default,) {final _that = this;
switch (_that) {
case _CommandLogCommandsUiState() when $default != null:
return $default(_that.showAddForm,_that.loadingCommandId,_that.editingCommandId);case _:
  return null;

}
}

}

/// @nodoc


class _CommandLogCommandsUiState extends CommandLogCommandsUiState {
  const _CommandLogCommandsUiState({this.showAddForm = false, this.loadingCommandId, this.editingCommandId}): super._();
  

@override@JsonKey() final  bool showAddForm;
@override final  String? loadingCommandId;
@override final  String? editingCommandId;

/// Create a copy of CommandLogCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandLogCommandsUiStateCopyWith<_CommandLogCommandsUiState> get copyWith => __$CommandLogCommandsUiStateCopyWithImpl<_CommandLogCommandsUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandLogCommandsUiState&&(identical(other.showAddForm, showAddForm) || other.showAddForm == showAddForm)&&(identical(other.loadingCommandId, loadingCommandId) || other.loadingCommandId == loadingCommandId)&&(identical(other.editingCommandId, editingCommandId) || other.editingCommandId == editingCommandId));
}


@override
int get hashCode => Object.hash(runtimeType,showAddForm,loadingCommandId,editingCommandId);

@override
String toString() {
  return 'CommandLogCommandsUiState(showAddForm: $showAddForm, loadingCommandId: $loadingCommandId, editingCommandId: $editingCommandId)';
}


}

/// @nodoc
abstract mixin class _$CommandLogCommandsUiStateCopyWith<$Res> implements $CommandLogCommandsUiStateCopyWith<$Res> {
  factory _$CommandLogCommandsUiStateCopyWith(_CommandLogCommandsUiState value, $Res Function(_CommandLogCommandsUiState) _then) = __$CommandLogCommandsUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool showAddForm, String? loadingCommandId, String? editingCommandId
});




}
/// @nodoc
class __$CommandLogCommandsUiStateCopyWithImpl<$Res>
    implements _$CommandLogCommandsUiStateCopyWith<$Res> {
  __$CommandLogCommandsUiStateCopyWithImpl(this._self, this._then);

  final _CommandLogCommandsUiState _self;
  final $Res Function(_CommandLogCommandsUiState) _then;

/// Create a copy of CommandLogCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showAddForm = null,Object? loadingCommandId = freezed,Object? editingCommandId = freezed,}) {
  return _then(_CommandLogCommandsUiState(
showAddForm: null == showAddForm ? _self.showAddForm : showAddForm // ignore: cast_nullable_to_non_nullable
as bool,loadingCommandId: freezed == loadingCommandId ? _self.loadingCommandId : loadingCommandId // ignore: cast_nullable_to_non_nullable
as String?,editingCommandId: freezed == editingCommandId ? _self.editingCommandId : editingCommandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
