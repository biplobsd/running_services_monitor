// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meminfo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemInfoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemInfoEvent()';
}


}

/// @nodoc
class $MemInfoEventCopyWith<$Res>  {
$MemInfoEventCopyWith(MemInfoEvent _, $Res Function(MemInfoEvent) __);
}


/// Adds pattern-matching-related methods to [MemInfoEvent].
extension MemInfoEventPatterns on MemInfoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchMemInfo value)?  fetchMemInfo,TResult Function( _FetchForComparison value)?  fetchForComparison,TResult Function( _Clear value)?  clear,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchMemInfo() when fetchMemInfo != null:
return fetchMemInfo(_that);case _FetchForComparison() when fetchForComparison != null:
return fetchForComparison(_that);case _Clear() when clear != null:
return clear(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchMemInfo value)  fetchMemInfo,required TResult Function( _FetchForComparison value)  fetchForComparison,required TResult Function( _Clear value)  clear,}){
final _that = this;
switch (_that) {
case _FetchMemInfo():
return fetchMemInfo(_that);case _FetchForComparison():
return fetchForComparison(_that);case _Clear():
return clear(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchMemInfo value)?  fetchMemInfo,TResult? Function( _FetchForComparison value)?  fetchForComparison,TResult? Function( _Clear value)?  clear,}){
final _that = this;
switch (_that) {
case _FetchMemInfo() when fetchMemInfo != null:
return fetchMemInfo(_that);case _FetchForComparison() when fetchForComparison != null:
return fetchForComparison(_that);case _Clear() when clear != null:
return clear(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String packageName)?  fetchMemInfo,TResult Function( String packageName)?  fetchForComparison,TResult Function()?  clear,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchMemInfo() when fetchMemInfo != null:
return fetchMemInfo(_that.packageName);case _FetchForComparison() when fetchForComparison != null:
return fetchForComparison(_that.packageName);case _Clear() when clear != null:
return clear();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String packageName)  fetchMemInfo,required TResult Function( String packageName)  fetchForComparison,required TResult Function()  clear,}) {final _that = this;
switch (_that) {
case _FetchMemInfo():
return fetchMemInfo(_that.packageName);case _FetchForComparison():
return fetchForComparison(_that.packageName);case _Clear():
return clear();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String packageName)?  fetchMemInfo,TResult? Function( String packageName)?  fetchForComparison,TResult? Function()?  clear,}) {final _that = this;
switch (_that) {
case _FetchMemInfo() when fetchMemInfo != null:
return fetchMemInfo(_that.packageName);case _FetchForComparison() when fetchForComparison != null:
return fetchForComparison(_that.packageName);case _Clear() when clear != null:
return clear();case _:
  return null;

}
}

}

/// @nodoc


class _FetchMemInfo implements MemInfoEvent {
  const _FetchMemInfo({required this.packageName});
  

 final  String packageName;

/// Create a copy of MemInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchMemInfoCopyWith<_FetchMemInfo> get copyWith => __$FetchMemInfoCopyWithImpl<_FetchMemInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchMemInfo&&(identical(other.packageName, packageName) || other.packageName == packageName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName);

@override
String toString() {
  return 'MemInfoEvent.fetchMemInfo(packageName: $packageName)';
}


}

/// @nodoc
abstract mixin class _$FetchMemInfoCopyWith<$Res> implements $MemInfoEventCopyWith<$Res> {
  factory _$FetchMemInfoCopyWith(_FetchMemInfo value, $Res Function(_FetchMemInfo) _then) = __$FetchMemInfoCopyWithImpl;
@useResult
$Res call({
 String packageName
});




}
/// @nodoc
class __$FetchMemInfoCopyWithImpl<$Res>
    implements _$FetchMemInfoCopyWith<$Res> {
  __$FetchMemInfoCopyWithImpl(this._self, this._then);

  final _FetchMemInfo _self;
  final $Res Function(_FetchMemInfo) _then;

/// Create a copy of MemInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,}) {
  return _then(_FetchMemInfo(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FetchForComparison implements MemInfoEvent {
  const _FetchForComparison({required this.packageName});
  

 final  String packageName;

/// Create a copy of MemInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchForComparisonCopyWith<_FetchForComparison> get copyWith => __$FetchForComparisonCopyWithImpl<_FetchForComparison>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchForComparison&&(identical(other.packageName, packageName) || other.packageName == packageName));
}


@override
int get hashCode => Object.hash(runtimeType,packageName);

@override
String toString() {
  return 'MemInfoEvent.fetchForComparison(packageName: $packageName)';
}


}

/// @nodoc
abstract mixin class _$FetchForComparisonCopyWith<$Res> implements $MemInfoEventCopyWith<$Res> {
  factory _$FetchForComparisonCopyWith(_FetchForComparison value, $Res Function(_FetchForComparison) _then) = __$FetchForComparisonCopyWithImpl;
@useResult
$Res call({
 String packageName
});




}
/// @nodoc
class __$FetchForComparisonCopyWithImpl<$Res>
    implements _$FetchForComparisonCopyWith<$Res> {
  __$FetchForComparisonCopyWithImpl(this._self, this._then);

  final _FetchForComparison _self;
  final $Res Function(_FetchForComparison) _then;

/// Create a copy of MemInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageName = null,}) {
  return _then(_FetchForComparison(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Clear implements MemInfoEvent {
  const _Clear();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Clear);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemInfoEvent.clear()';
}


}




/// @nodoc
mixin _$MemInfoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemInfoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemInfoState()';
}


}

/// @nodoc
class $MemInfoStateCopyWith<$Res>  {
$MemInfoStateCopyWith(MemInfoState _, $Res Function(MemInfoState) __);
}


/// Adds pattern-matching-related methods to [MemInfoState].
extension MemInfoStatePatterns on MemInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( MemInfoData? currentData,  MemInfoData? comparisonData)?  loading,TResult Function( MemInfoData data,  MemInfoData? comparisonData)?  loaded,TResult Function( String message,  MemInfoData? currentData)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.currentData,_that.comparisonData);case _Loaded() when loaded != null:
return loaded(_that.data,_that.comparisonData);case _Error() when error != null:
return error(_that.message,_that.currentData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( MemInfoData? currentData,  MemInfoData? comparisonData)  loading,required TResult Function( MemInfoData data,  MemInfoData? comparisonData)  loaded,required TResult Function( String message,  MemInfoData? currentData)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading(_that.currentData,_that.comparisonData);case _Loaded():
return loaded(_that.data,_that.comparisonData);case _Error():
return error(_that.message,_that.currentData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( MemInfoData? currentData,  MemInfoData? comparisonData)?  loading,TResult? Function( MemInfoData data,  MemInfoData? comparisonData)?  loaded,TResult? Function( String message,  MemInfoData? currentData)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.currentData,_that.comparisonData);case _Loaded() when loaded != null:
return loaded(_that.data,_that.comparisonData);case _Error() when error != null:
return error(_that.message,_that.currentData);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MemInfoState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MemInfoState.initial()';
}


}




/// @nodoc


class _Loading implements MemInfoState {
  const _Loading({this.currentData, this.comparisonData});
  

 final  MemInfoData? currentData;
 final  MemInfoData? comparisonData;

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.currentData, currentData) || other.currentData == currentData)&&(identical(other.comparisonData, comparisonData) || other.comparisonData == comparisonData));
}


@override
int get hashCode => Object.hash(runtimeType,currentData,comparisonData);

@override
String toString() {
  return 'MemInfoState.loading(currentData: $currentData, comparisonData: $comparisonData)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $MemInfoStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@useResult
$Res call({
 MemInfoData? currentData, MemInfoData? comparisonData
});


$MemInfoDataCopyWith<$Res>? get currentData;$MemInfoDataCopyWith<$Res>? get comparisonData;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentData = freezed,Object? comparisonData = freezed,}) {
  return _then(_Loading(
currentData: freezed == currentData ? _self.currentData : currentData // ignore: cast_nullable_to_non_nullable
as MemInfoData?,comparisonData: freezed == comparisonData ? _self.comparisonData : comparisonData // ignore: cast_nullable_to_non_nullable
as MemInfoData?,
  ));
}

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoDataCopyWith<$Res>? get currentData {
    if (_self.currentData == null) {
    return null;
  }

  return $MemInfoDataCopyWith<$Res>(_self.currentData!, (value) {
    return _then(_self.copyWith(currentData: value));
  });
}/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoDataCopyWith<$Res>? get comparisonData {
    if (_self.comparisonData == null) {
    return null;
  }

  return $MemInfoDataCopyWith<$Res>(_self.comparisonData!, (value) {
    return _then(_self.copyWith(comparisonData: value));
  });
}
}

/// @nodoc


class _Loaded implements MemInfoState {
  const _Loaded({required this.data, this.comparisonData});
  

 final  MemInfoData data;
 final  MemInfoData? comparisonData;

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.data, data) || other.data == data)&&(identical(other.comparisonData, comparisonData) || other.comparisonData == comparisonData));
}


@override
int get hashCode => Object.hash(runtimeType,data,comparisonData);

@override
String toString() {
  return 'MemInfoState.loaded(data: $data, comparisonData: $comparisonData)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $MemInfoStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 MemInfoData data, MemInfoData? comparisonData
});


$MemInfoDataCopyWith<$Res> get data;$MemInfoDataCopyWith<$Res>? get comparisonData;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? comparisonData = freezed,}) {
  return _then(_Loaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MemInfoData,comparisonData: freezed == comparisonData ? _self.comparisonData : comparisonData // ignore: cast_nullable_to_non_nullable
as MemInfoData?,
  ));
}

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoDataCopyWith<$Res> get data {
  
  return $MemInfoDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoDataCopyWith<$Res>? get comparisonData {
    if (_self.comparisonData == null) {
    return null;
  }

  return $MemInfoDataCopyWith<$Res>(_self.comparisonData!, (value) {
    return _then(_self.copyWith(comparisonData: value));
  });
}
}

/// @nodoc


class _Error implements MemInfoState {
  const _Error({required this.message, this.currentData});
  

 final  String message;
 final  MemInfoData? currentData;

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.currentData, currentData) || other.currentData == currentData));
}


@override
int get hashCode => Object.hash(runtimeType,message,currentData);

@override
String toString() {
  return 'MemInfoState.error(message: $message, currentData: $currentData)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MemInfoStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, MemInfoData? currentData
});


$MemInfoDataCopyWith<$Res>? get currentData;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? currentData = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,currentData: freezed == currentData ? _self.currentData : currentData // ignore: cast_nullable_to_non_nullable
as MemInfoData?,
  ));
}

/// Create a copy of MemInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoDataCopyWith<$Res>? get currentData {
    if (_self.currentData == null) {
    return null;
  }

  return $MemInfoDataCopyWith<$Res>(_self.currentData!, (value) {
    return _then(_self.copyWith(currentData: value));
  });
}
}

// dart format on
