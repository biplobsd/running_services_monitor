// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_commands_ui_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsefulCommandsUiEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulCommandsUiEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsefulCommandsUiEvent()';
}


}

/// @nodoc
class $UsefulCommandsUiEventCopyWith<$Res>  {
$UsefulCommandsUiEventCopyWith(UsefulCommandsUiEvent _, $Res Function(UsefulCommandsUiEvent) __);
}


/// Adds pattern-matching-related methods to [UsefulCommandsUiEvent].
extension UsefulCommandsUiEventPatterns on UsefulCommandsUiEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToggleAddForm value)?  toggleAddForm,TResult Function( _HideAddForm value)?  hideAddForm,TResult Function( _SetLoadingCommand value)?  setLoadingCommand,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm(_that);case _HideAddForm() when hideAddForm != null:
return hideAddForm(_that);case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToggleAddForm value)  toggleAddForm,required TResult Function( _HideAddForm value)  hideAddForm,required TResult Function( _SetLoadingCommand value)  setLoadingCommand,}){
final _that = this;
switch (_that) {
case _ToggleAddForm():
return toggleAddForm(_that);case _HideAddForm():
return hideAddForm(_that);case _SetLoadingCommand():
return setLoadingCommand(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToggleAddForm value)?  toggleAddForm,TResult? Function( _HideAddForm value)?  hideAddForm,TResult? Function( _SetLoadingCommand value)?  setLoadingCommand,}){
final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm(_that);case _HideAddForm() when hideAddForm != null:
return hideAddForm(_that);case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  toggleAddForm,TResult Function()?  hideAddForm,TResult Function( String? commandId)?  setLoadingCommand,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm();case _HideAddForm() when hideAddForm != null:
return hideAddForm();case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that.commandId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  toggleAddForm,required TResult Function()  hideAddForm,required TResult Function( String? commandId)  setLoadingCommand,}) {final _that = this;
switch (_that) {
case _ToggleAddForm():
return toggleAddForm();case _HideAddForm():
return hideAddForm();case _SetLoadingCommand():
return setLoadingCommand(_that.commandId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  toggleAddForm,TResult? Function()?  hideAddForm,TResult? Function( String? commandId)?  setLoadingCommand,}) {final _that = this;
switch (_that) {
case _ToggleAddForm() when toggleAddForm != null:
return toggleAddForm();case _HideAddForm() when hideAddForm != null:
return hideAddForm();case _SetLoadingCommand() when setLoadingCommand != null:
return setLoadingCommand(_that.commandId);case _:
  return null;

}
}

}

/// @nodoc


class _ToggleAddForm implements UsefulCommandsUiEvent {
  const _ToggleAddForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleAddForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsefulCommandsUiEvent.toggleAddForm()';
}


}




/// @nodoc


class _HideAddForm implements UsefulCommandsUiEvent {
  const _HideAddForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HideAddForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsefulCommandsUiEvent.hideAddForm()';
}


}




/// @nodoc


class _SetLoadingCommand implements UsefulCommandsUiEvent {
  const _SetLoadingCommand(this.commandId);
  

 final  String? commandId;

/// Create a copy of UsefulCommandsUiEvent
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
  return 'UsefulCommandsUiEvent.setLoadingCommand(commandId: $commandId)';
}


}

/// @nodoc
abstract mixin class _$SetLoadingCommandCopyWith<$Res> implements $UsefulCommandsUiEventCopyWith<$Res> {
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

/// Create a copy of UsefulCommandsUiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? commandId = freezed,}) {
  return _then(_SetLoadingCommand(
freezed == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$UsefulCommandsUiState {

 bool get showAddForm; String? get loadingCommandId;
/// Create a copy of UsefulCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsefulCommandsUiStateCopyWith<UsefulCommandsUiState> get copyWith => _$UsefulCommandsUiStateCopyWithImpl<UsefulCommandsUiState>(this as UsefulCommandsUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulCommandsUiState&&(identical(other.showAddForm, showAddForm) || other.showAddForm == showAddForm)&&(identical(other.loadingCommandId, loadingCommandId) || other.loadingCommandId == loadingCommandId));
}


@override
int get hashCode => Object.hash(runtimeType,showAddForm,loadingCommandId);

@override
String toString() {
  return 'UsefulCommandsUiState(showAddForm: $showAddForm, loadingCommandId: $loadingCommandId)';
}


}

/// @nodoc
abstract mixin class $UsefulCommandsUiStateCopyWith<$Res>  {
  factory $UsefulCommandsUiStateCopyWith(UsefulCommandsUiState value, $Res Function(UsefulCommandsUiState) _then) = _$UsefulCommandsUiStateCopyWithImpl;
@useResult
$Res call({
 bool showAddForm, String? loadingCommandId
});




}
/// @nodoc
class _$UsefulCommandsUiStateCopyWithImpl<$Res>
    implements $UsefulCommandsUiStateCopyWith<$Res> {
  _$UsefulCommandsUiStateCopyWithImpl(this._self, this._then);

  final UsefulCommandsUiState _self;
  final $Res Function(UsefulCommandsUiState) _then;

/// Create a copy of UsefulCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showAddForm = null,Object? loadingCommandId = freezed,}) {
  return _then(_self.copyWith(
showAddForm: null == showAddForm ? _self.showAddForm : showAddForm // ignore: cast_nullable_to_non_nullable
as bool,loadingCommandId: freezed == loadingCommandId ? _self.loadingCommandId : loadingCommandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsefulCommandsUiState].
extension UsefulCommandsUiStatePatterns on UsefulCommandsUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsefulCommandsUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsefulCommandsUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsefulCommandsUiState value)  $default,){
final _that = this;
switch (_that) {
case _UsefulCommandsUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsefulCommandsUiState value)?  $default,){
final _that = this;
switch (_that) {
case _UsefulCommandsUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showAddForm,  String? loadingCommandId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsefulCommandsUiState() when $default != null:
return $default(_that.showAddForm,_that.loadingCommandId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showAddForm,  String? loadingCommandId)  $default,) {final _that = this;
switch (_that) {
case _UsefulCommandsUiState():
return $default(_that.showAddForm,_that.loadingCommandId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showAddForm,  String? loadingCommandId)?  $default,) {final _that = this;
switch (_that) {
case _UsefulCommandsUiState() when $default != null:
return $default(_that.showAddForm,_that.loadingCommandId);case _:
  return null;

}
}

}

/// @nodoc


class _UsefulCommandsUiState implements UsefulCommandsUiState {
  const _UsefulCommandsUiState({this.showAddForm = false, this.loadingCommandId});
  

@override@JsonKey() final  bool showAddForm;
@override final  String? loadingCommandId;

/// Create a copy of UsefulCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsefulCommandsUiStateCopyWith<_UsefulCommandsUiState> get copyWith => __$UsefulCommandsUiStateCopyWithImpl<_UsefulCommandsUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsefulCommandsUiState&&(identical(other.showAddForm, showAddForm) || other.showAddForm == showAddForm)&&(identical(other.loadingCommandId, loadingCommandId) || other.loadingCommandId == loadingCommandId));
}


@override
int get hashCode => Object.hash(runtimeType,showAddForm,loadingCommandId);

@override
String toString() {
  return 'UsefulCommandsUiState(showAddForm: $showAddForm, loadingCommandId: $loadingCommandId)';
}


}

/// @nodoc
abstract mixin class _$UsefulCommandsUiStateCopyWith<$Res> implements $UsefulCommandsUiStateCopyWith<$Res> {
  factory _$UsefulCommandsUiStateCopyWith(_UsefulCommandsUiState value, $Res Function(_UsefulCommandsUiState) _then) = __$UsefulCommandsUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool showAddForm, String? loadingCommandId
});




}
/// @nodoc
class __$UsefulCommandsUiStateCopyWithImpl<$Res>
    implements _$UsefulCommandsUiStateCopyWith<$Res> {
  __$UsefulCommandsUiStateCopyWithImpl(this._self, this._then);

  final _UsefulCommandsUiState _self;
  final $Res Function(_UsefulCommandsUiState) _then;

/// Create a copy of UsefulCommandsUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showAddForm = null,Object? loadingCommandId = freezed,}) {
  return _then(_UsefulCommandsUiState(
showAddForm: null == showAddForm ? _self.showAddForm : showAddForm // ignore: cast_nullable_to_non_nullable
as bool,loadingCommandId: freezed == loadingCommandId ? _self.loadingCommandId : loadingCommandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
