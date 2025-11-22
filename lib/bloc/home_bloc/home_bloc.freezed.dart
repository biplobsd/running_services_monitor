// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitializeShizuku value)?  initializeShizuku,TResult Function( _LoadData value)?  loadData,TResult Function( _ToggleAutoUpdate value)?  toggleAutoUpdate,TResult Function( _ToggleSearch value)?  toggleSearch,TResult Function( _UpdateSearchQuery value)?  updateSearchQuery,TResult Function( _AutoUpdateTick value)?  autoUpdateTick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitializeShizuku() when initializeShizuku != null:
return initializeShizuku(_that);case _LoadData() when loadData != null:
return loadData(_that);case _ToggleAutoUpdate() when toggleAutoUpdate != null:
return toggleAutoUpdate(_that);case _ToggleSearch() when toggleSearch != null:
return toggleSearch(_that);case _UpdateSearchQuery() when updateSearchQuery != null:
return updateSearchQuery(_that);case _AutoUpdateTick() when autoUpdateTick != null:
return autoUpdateTick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitializeShizuku value)  initializeShizuku,required TResult Function( _LoadData value)  loadData,required TResult Function( _ToggleAutoUpdate value)  toggleAutoUpdate,required TResult Function( _ToggleSearch value)  toggleSearch,required TResult Function( _UpdateSearchQuery value)  updateSearchQuery,required TResult Function( _AutoUpdateTick value)  autoUpdateTick,}){
final _that = this;
switch (_that) {
case _InitializeShizuku():
return initializeShizuku(_that);case _LoadData():
return loadData(_that);case _ToggleAutoUpdate():
return toggleAutoUpdate(_that);case _ToggleSearch():
return toggleSearch(_that);case _UpdateSearchQuery():
return updateSearchQuery(_that);case _AutoUpdateTick():
return autoUpdateTick(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitializeShizuku value)?  initializeShizuku,TResult? Function( _LoadData value)?  loadData,TResult? Function( _ToggleAutoUpdate value)?  toggleAutoUpdate,TResult? Function( _ToggleSearch value)?  toggleSearch,TResult? Function( _UpdateSearchQuery value)?  updateSearchQuery,TResult? Function( _AutoUpdateTick value)?  autoUpdateTick,}){
final _that = this;
switch (_that) {
case _InitializeShizuku() when initializeShizuku != null:
return initializeShizuku(_that);case _LoadData() when loadData != null:
return loadData(_that);case _ToggleAutoUpdate() when toggleAutoUpdate != null:
return toggleAutoUpdate(_that);case _ToggleSearch() when toggleSearch != null:
return toggleSearch(_that);case _UpdateSearchQuery() when updateSearchQuery != null:
return updateSearchQuery(_that);case _AutoUpdateTick() when autoUpdateTick != null:
return autoUpdateTick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializeShizuku,TResult Function( bool silent)?  loadData,TResult Function()?  toggleAutoUpdate,TResult Function()?  toggleSearch,TResult Function( String query)?  updateSearchQuery,TResult Function()?  autoUpdateTick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitializeShizuku() when initializeShizuku != null:
return initializeShizuku();case _LoadData() when loadData != null:
return loadData(_that.silent);case _ToggleAutoUpdate() when toggleAutoUpdate != null:
return toggleAutoUpdate();case _ToggleSearch() when toggleSearch != null:
return toggleSearch();case _UpdateSearchQuery() when updateSearchQuery != null:
return updateSearchQuery(_that.query);case _AutoUpdateTick() when autoUpdateTick != null:
return autoUpdateTick();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializeShizuku,required TResult Function( bool silent)  loadData,required TResult Function()  toggleAutoUpdate,required TResult Function()  toggleSearch,required TResult Function( String query)  updateSearchQuery,required TResult Function()  autoUpdateTick,}) {final _that = this;
switch (_that) {
case _InitializeShizuku():
return initializeShizuku();case _LoadData():
return loadData(_that.silent);case _ToggleAutoUpdate():
return toggleAutoUpdate();case _ToggleSearch():
return toggleSearch();case _UpdateSearchQuery():
return updateSearchQuery(_that.query);case _AutoUpdateTick():
return autoUpdateTick();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializeShizuku,TResult? Function( bool silent)?  loadData,TResult? Function()?  toggleAutoUpdate,TResult? Function()?  toggleSearch,TResult? Function( String query)?  updateSearchQuery,TResult? Function()?  autoUpdateTick,}) {final _that = this;
switch (_that) {
case _InitializeShizuku() when initializeShizuku != null:
return initializeShizuku();case _LoadData() when loadData != null:
return loadData(_that.silent);case _ToggleAutoUpdate() when toggleAutoUpdate != null:
return toggleAutoUpdate();case _ToggleSearch() when toggleSearch != null:
return toggleSearch();case _UpdateSearchQuery() when updateSearchQuery != null:
return updateSearchQuery(_that.query);case _AutoUpdateTick() when autoUpdateTick != null:
return autoUpdateTick();case _:
  return null;

}
}

}

/// @nodoc


class _InitializeShizuku implements HomeEvent {
  const _InitializeShizuku();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitializeShizuku);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.initializeShizuku()';
}


}




/// @nodoc


class _LoadData implements HomeEvent {
  const _LoadData({this.silent = false});
  

@JsonKey() final  bool silent;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDataCopyWith<_LoadData> get copyWith => __$LoadDataCopyWithImpl<_LoadData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadData&&(identical(other.silent, silent) || other.silent == silent));
}


@override
int get hashCode => Object.hash(runtimeType,silent);

@override
String toString() {
  return 'HomeEvent.loadData(silent: $silent)';
}


}

/// @nodoc
abstract mixin class _$LoadDataCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$LoadDataCopyWith(_LoadData value, $Res Function(_LoadData) _then) = __$LoadDataCopyWithImpl;
@useResult
$Res call({
 bool silent
});




}
/// @nodoc
class __$LoadDataCopyWithImpl<$Res>
    implements _$LoadDataCopyWith<$Res> {
  __$LoadDataCopyWithImpl(this._self, this._then);

  final _LoadData _self;
  final $Res Function(_LoadData) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? silent = null,}) {
  return _then(_LoadData(
silent: null == silent ? _self.silent : silent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ToggleAutoUpdate implements HomeEvent {
  const _ToggleAutoUpdate();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleAutoUpdate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.toggleAutoUpdate()';
}


}




/// @nodoc


class _ToggleSearch implements HomeEvent {
  const _ToggleSearch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleSearch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.toggleSearch()';
}


}




/// @nodoc


class _UpdateSearchQuery implements HomeEvent {
  const _UpdateSearchQuery(this.query);
  

 final  String query;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSearchQueryCopyWith<_UpdateSearchQuery> get copyWith => __$UpdateSearchQueryCopyWithImpl<_UpdateSearchQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSearchQuery&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'HomeEvent.updateSearchQuery(query: $query)';
}


}

/// @nodoc
abstract mixin class _$UpdateSearchQueryCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$UpdateSearchQueryCopyWith(_UpdateSearchQuery value, $Res Function(_UpdateSearchQuery) _then) = __$UpdateSearchQueryCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$UpdateSearchQueryCopyWithImpl<$Res>
    implements _$UpdateSearchQueryCopyWith<$Res> {
  __$UpdateSearchQueryCopyWithImpl(this._self, this._then);

  final _UpdateSearchQuery _self;
  final $Res Function(_UpdateSearchQuery) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_UpdateSearchQuery(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AutoUpdateTick implements HomeEvent {
  const _AutoUpdateTick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AutoUpdateTick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.autoUpdateTick()';
}


}




/// @nodoc
mixin _$HomeState {

 HomeStateModel get value;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'HomeState(value: $value)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeStateModel value
});


$HomeStateModelCopyWith<$Res> get value;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as HomeStateModel,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeStateModelCopyWith<$Res> get value {
  
  return $HomeStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( HomeStateModel value)?  initial,TResult Function( HomeStateModel value)?  loading,TResult Function( HomeStateModel value)?  success,TResult Function( HomeStateModel value,  String message)?  failure,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( HomeStateModel value)  initial,required TResult Function( HomeStateModel value)  loading,required TResult Function( HomeStateModel value)  success,required TResult Function( HomeStateModel value,  String message)  failure,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( HomeStateModel value)?  initial,TResult? Function( HomeStateModel value)?  loading,TResult? Function( HomeStateModel value)?  success,TResult? Function( HomeStateModel value,  String message)?  failure,}) {final _that = this;
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


class _Initial extends HomeState {
  const _Initial(this.value): super._();
  

@override final  HomeStateModel value;

/// Create a copy of HomeState
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
  return 'HomeState.initial(value: $value)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 HomeStateModel value
});


@override $HomeStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Initial(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as HomeStateModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeStateModelCopyWith<$Res> get value {
  
  return $HomeStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _Loading extends HomeState {
  const _Loading(this.value): super._();
  

@override final  HomeStateModel value;

/// Create a copy of HomeState
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
  return 'HomeState.loading(value: $value)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 HomeStateModel value
});


@override $HomeStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Loading(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as HomeStateModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeStateModelCopyWith<$Res> get value {
  
  return $HomeStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _Success extends HomeState {
  const _Success(this.value): super._();
  

@override final  HomeStateModel value;

/// Create a copy of HomeState
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
  return 'HomeState.success(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 HomeStateModel value
});


@override $HomeStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Success(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as HomeStateModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeStateModelCopyWith<$Res> get value {
  
  return $HomeStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _Failure extends HomeState {
  const _Failure(this.value, this.message): super._();
  

@override final  HomeStateModel value;
 final  String message;

/// Create a copy of HomeState
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
  return 'HomeState.failure(value: $value, message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@override @useResult
$Res call({
 HomeStateModel value, String message
});


@override $HomeStateModelCopyWith<$Res> get value;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? message = null,}) {
  return _then(_Failure(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as HomeStateModel,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeStateModelCopyWith<$Res> get value {
  
  return $HomeStateModelCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

// dart format on
