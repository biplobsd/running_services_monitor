// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'useful_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsefulCommand {

 String get id; String get title; String get description; String get command; bool get isCustom;
/// Create a copy of UsefulCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsefulCommandCopyWith<UsefulCommand> get copyWith => _$UsefulCommandCopyWithImpl<UsefulCommand>(this as UsefulCommand, _$identity);

  /// Serializes this UsefulCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsefulCommand&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.command, command) || other.command == command)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,command,isCustom);

@override
String toString() {
  return 'UsefulCommand(id: $id, title: $title, description: $description, command: $command, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class $UsefulCommandCopyWith<$Res>  {
  factory $UsefulCommandCopyWith(UsefulCommand value, $Res Function(UsefulCommand) _then) = _$UsefulCommandCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String command, bool isCustom
});




}
/// @nodoc
class _$UsefulCommandCopyWithImpl<$Res>
    implements $UsefulCommandCopyWith<$Res> {
  _$UsefulCommandCopyWithImpl(this._self, this._then);

  final UsefulCommand _self;
  final $Res Function(UsefulCommand) _then;

/// Create a copy of UsefulCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? command = null,Object? isCustom = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UsefulCommand].
extension UsefulCommandPatterns on UsefulCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsefulCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsefulCommand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsefulCommand value)  $default,){
final _that = this;
switch (_that) {
case _UsefulCommand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsefulCommand value)?  $default,){
final _that = this;
switch (_that) {
case _UsefulCommand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String command,  bool isCustom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsefulCommand() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.command,_that.isCustom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String command,  bool isCustom)  $default,) {final _that = this;
switch (_that) {
case _UsefulCommand():
return $default(_that.id,_that.title,_that.description,_that.command,_that.isCustom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String command,  bool isCustom)?  $default,) {final _that = this;
switch (_that) {
case _UsefulCommand() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.command,_that.isCustom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsefulCommand implements UsefulCommand {
  const _UsefulCommand({required this.id, required this.title, required this.description, required this.command, this.isCustom = false});
  factory _UsefulCommand.fromJson(Map<String, dynamic> json) => _$UsefulCommandFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String command;
@override@JsonKey() final  bool isCustom;

/// Create a copy of UsefulCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsefulCommandCopyWith<_UsefulCommand> get copyWith => __$UsefulCommandCopyWithImpl<_UsefulCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsefulCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsefulCommand&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.command, command) || other.command == command)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,command,isCustom);

@override
String toString() {
  return 'UsefulCommand(id: $id, title: $title, description: $description, command: $command, isCustom: $isCustom)';
}


}

/// @nodoc
abstract mixin class _$UsefulCommandCopyWith<$Res> implements $UsefulCommandCopyWith<$Res> {
  factory _$UsefulCommandCopyWith(_UsefulCommand value, $Res Function(_UsefulCommand) _then) = __$UsefulCommandCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String command, bool isCustom
});




}
/// @nodoc
class __$UsefulCommandCopyWithImpl<$Res>
    implements _$UsefulCommandCopyWith<$Res> {
  __$UsefulCommandCopyWithImpl(this._self, this._then);

  final _UsefulCommand _self;
  final $Res Function(_UsefulCommand) _then;

/// Create a copy of UsefulCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? command = null,Object? isCustom = null,}) {
  return _then(_UsefulCommand(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
