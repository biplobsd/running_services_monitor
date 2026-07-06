// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AboutEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AboutEvent()';
}


}

/// @nodoc
class $AboutEventCopyWith<$Res>  {
$AboutEventCopyWith(AboutEvent _, $Res Function(AboutEvent) __);
}


/// Adds pattern-matching-related methods to [AboutEvent].
extension AboutEventPatterns on AboutEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AboutEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AboutEvent.started()';
}


}




/// @nodoc
mixin _$AboutState {

 bool get isLoading; String get version; List<ContributorInfo> get contributors; List<ChangelogInfo> get changelogs;
/// Create a copy of AboutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AboutStateCopyWith<AboutState> get copyWith => _$AboutStateCopyWithImpl<AboutState>(this as AboutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.contributors, contributors)&&const DeepCollectionEquality().equals(other.changelogs, changelogs));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,version,const DeepCollectionEquality().hash(contributors),const DeepCollectionEquality().hash(changelogs));

@override
String toString() {
  return 'AboutState(isLoading: $isLoading, version: $version, contributors: $contributors, changelogs: $changelogs)';
}


}

/// @nodoc
abstract mixin class $AboutStateCopyWith<$Res>  {
  factory $AboutStateCopyWith(AboutState value, $Res Function(AboutState) _then) = _$AboutStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String version, List<ContributorInfo> contributors, List<ChangelogInfo> changelogs
});




}
/// @nodoc
class _$AboutStateCopyWithImpl<$Res>
    implements $AboutStateCopyWith<$Res> {
  _$AboutStateCopyWithImpl(this._self, this._then);

  final AboutState _self;
  final $Res Function(AboutState) _then;

/// Create a copy of AboutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? version = null,Object? contributors = null,Object? changelogs = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,contributors: null == contributors ? _self.contributors : contributors // ignore: cast_nullable_to_non_nullable
as List<ContributorInfo>,changelogs: null == changelogs ? _self.changelogs : changelogs // ignore: cast_nullable_to_non_nullable
as List<ChangelogInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [AboutState].
extension AboutStatePatterns on AboutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AboutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AboutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AboutState value)  $default,){
final _that = this;
switch (_that) {
case _AboutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AboutState value)?  $default,){
final _that = this;
switch (_that) {
case _AboutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String version,  List<ContributorInfo> contributors,  List<ChangelogInfo> changelogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AboutState() when $default != null:
return $default(_that.isLoading,_that.version,_that.contributors,_that.changelogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String version,  List<ContributorInfo> contributors,  List<ChangelogInfo> changelogs)  $default,) {final _that = this;
switch (_that) {
case _AboutState():
return $default(_that.isLoading,_that.version,_that.contributors,_that.changelogs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String version,  List<ContributorInfo> contributors,  List<ChangelogInfo> changelogs)?  $default,) {final _that = this;
switch (_that) {
case _AboutState() when $default != null:
return $default(_that.isLoading,_that.version,_that.contributors,_that.changelogs);case _:
  return null;

}
}

}

/// @nodoc


class _AboutState implements AboutState {
  const _AboutState({required this.isLoading, required this.version, required final  List<ContributorInfo> contributors, required final  List<ChangelogInfo> changelogs}): _contributors = contributors,_changelogs = changelogs;
  

@override final  bool isLoading;
@override final  String version;
 final  List<ContributorInfo> _contributors;
@override List<ContributorInfo> get contributors {
  if (_contributors is EqualUnmodifiableListView) return _contributors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contributors);
}

 final  List<ChangelogInfo> _changelogs;
@override List<ChangelogInfo> get changelogs {
  if (_changelogs is EqualUnmodifiableListView) return _changelogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_changelogs);
}


/// Create a copy of AboutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutStateCopyWith<_AboutState> get copyWith => __$AboutStateCopyWithImpl<_AboutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._contributors, _contributors)&&const DeepCollectionEquality().equals(other._changelogs, _changelogs));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,version,const DeepCollectionEquality().hash(_contributors),const DeepCollectionEquality().hash(_changelogs));

@override
String toString() {
  return 'AboutState(isLoading: $isLoading, version: $version, contributors: $contributors, changelogs: $changelogs)';
}


}

/// @nodoc
abstract mixin class _$AboutStateCopyWith<$Res> implements $AboutStateCopyWith<$Res> {
  factory _$AboutStateCopyWith(_AboutState value, $Res Function(_AboutState) _then) = __$AboutStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String version, List<ContributorInfo> contributors, List<ChangelogInfo> changelogs
});




}
/// @nodoc
class __$AboutStateCopyWithImpl<$Res>
    implements _$AboutStateCopyWith<$Res> {
  __$AboutStateCopyWithImpl(this._self, this._then);

  final _AboutState _self;
  final $Res Function(_AboutState) _then;

/// Create a copy of AboutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? version = null,Object? contributors = null,Object? changelogs = null,}) {
  return _then(_AboutState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,contributors: null == contributors ? _self._contributors : contributors // ignore: cast_nullable_to_non_nullable
as List<ContributorInfo>,changelogs: null == changelogs ? _self._changelogs : changelogs // ignore: cast_nullable_to_non_nullable
as List<ChangelogInfo>,
  ));
}


}

// dart format on
