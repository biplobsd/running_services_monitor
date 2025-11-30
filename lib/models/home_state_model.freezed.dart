// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeStateModel {

 bool get isLoading; bool get shizukuReady; String? get errorMessage; String? get notification; String? get loadingStatus; List<AppProcessInfo> get allApps; List<AppProcessInfo> get userApps; List<AppProcessInfo> get systemApps; double get totalRamKb; double get freeRamKb; double get usedRamKb; double get appsRamKb; bool get isAutoUpdateEnabled; bool get isSearching; String get searchQuery;
/// Create a copy of HomeStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateModelCopyWith<HomeStateModel> get copyWith => _$HomeStateModelCopyWithImpl<HomeStateModel>(this as HomeStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateModel&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.shizukuReady, shizukuReady) || other.shizukuReady == shizukuReady)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.notification, notification) || other.notification == notification)&&(identical(other.loadingStatus, loadingStatus) || other.loadingStatus == loadingStatus)&&const DeepCollectionEquality().equals(other.allApps, allApps)&&const DeepCollectionEquality().equals(other.userApps, userApps)&&const DeepCollectionEquality().equals(other.systemApps, systemApps)&&(identical(other.totalRamKb, totalRamKb) || other.totalRamKb == totalRamKb)&&(identical(other.freeRamKb, freeRamKb) || other.freeRamKb == freeRamKb)&&(identical(other.usedRamKb, usedRamKb) || other.usedRamKb == usedRamKb)&&(identical(other.appsRamKb, appsRamKb) || other.appsRamKb == appsRamKb)&&(identical(other.isAutoUpdateEnabled, isAutoUpdateEnabled) || other.isAutoUpdateEnabled == isAutoUpdateEnabled)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,shizukuReady,errorMessage,notification,loadingStatus,const DeepCollectionEquality().hash(allApps),const DeepCollectionEquality().hash(userApps),const DeepCollectionEquality().hash(systemApps),totalRamKb,freeRamKb,usedRamKb,appsRamKb,isAutoUpdateEnabled,isSearching,searchQuery);

@override
String toString() {
  return 'HomeStateModel(isLoading: $isLoading, shizukuReady: $shizukuReady, errorMessage: $errorMessage, notification: $notification, loadingStatus: $loadingStatus, allApps: $allApps, userApps: $userApps, systemApps: $systemApps, totalRamKb: $totalRamKb, freeRamKb: $freeRamKb, usedRamKb: $usedRamKb, appsRamKb: $appsRamKb, isAutoUpdateEnabled: $isAutoUpdateEnabled, isSearching: $isSearching, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $HomeStateModelCopyWith<$Res>  {
  factory $HomeStateModelCopyWith(HomeStateModel value, $Res Function(HomeStateModel) _then) = _$HomeStateModelCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool shizukuReady, String? errorMessage, String? notification, String? loadingStatus, List<AppProcessInfo> allApps, List<AppProcessInfo> userApps, List<AppProcessInfo> systemApps, double totalRamKb, double freeRamKb, double usedRamKb, double appsRamKb, bool isAutoUpdateEnabled, bool isSearching, String searchQuery
});




}
/// @nodoc
class _$HomeStateModelCopyWithImpl<$Res>
    implements $HomeStateModelCopyWith<$Res> {
  _$HomeStateModelCopyWithImpl(this._self, this._then);

  final HomeStateModel _self;
  final $Res Function(HomeStateModel) _then;

/// Create a copy of HomeStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? shizukuReady = null,Object? errorMessage = freezed,Object? notification = freezed,Object? loadingStatus = freezed,Object? allApps = null,Object? userApps = null,Object? systemApps = null,Object? totalRamKb = null,Object? freeRamKb = null,Object? usedRamKb = null,Object? appsRamKb = null,Object? isAutoUpdateEnabled = null,Object? isSearching = null,Object? searchQuery = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,shizukuReady: null == shizukuReady ? _self.shizukuReady : shizukuReady // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,notification: freezed == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as String?,loadingStatus: freezed == loadingStatus ? _self.loadingStatus : loadingStatus // ignore: cast_nullable_to_non_nullable
as String?,allApps: null == allApps ? _self.allApps : allApps // ignore: cast_nullable_to_non_nullable
as List<AppProcessInfo>,userApps: null == userApps ? _self.userApps : userApps // ignore: cast_nullable_to_non_nullable
as List<AppProcessInfo>,systemApps: null == systemApps ? _self.systemApps : systemApps // ignore: cast_nullable_to_non_nullable
as List<AppProcessInfo>,totalRamKb: null == totalRamKb ? _self.totalRamKb : totalRamKb // ignore: cast_nullable_to_non_nullable
as double,freeRamKb: null == freeRamKb ? _self.freeRamKb : freeRamKb // ignore: cast_nullable_to_non_nullable
as double,usedRamKb: null == usedRamKb ? _self.usedRamKb : usedRamKb // ignore: cast_nullable_to_non_nullable
as double,appsRamKb: null == appsRamKb ? _self.appsRamKb : appsRamKb // ignore: cast_nullable_to_non_nullable
as double,isAutoUpdateEnabled: null == isAutoUpdateEnabled ? _self.isAutoUpdateEnabled : isAutoUpdateEnabled // ignore: cast_nullable_to_non_nullable
as bool,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeStateModel].
extension HomeStateModelPatterns on HomeStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeStateModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool shizukuReady,  String? errorMessage,  String? notification,  String? loadingStatus,  List<AppProcessInfo> allApps,  List<AppProcessInfo> userApps,  List<AppProcessInfo> systemApps,  double totalRamKb,  double freeRamKb,  double usedRamKb,  double appsRamKb,  bool isAutoUpdateEnabled,  bool isSearching,  String searchQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeStateModel() when $default != null:
return $default(_that.isLoading,_that.shizukuReady,_that.errorMessage,_that.notification,_that.loadingStatus,_that.allApps,_that.userApps,_that.systemApps,_that.totalRamKb,_that.freeRamKb,_that.usedRamKb,_that.appsRamKb,_that.isAutoUpdateEnabled,_that.isSearching,_that.searchQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool shizukuReady,  String? errorMessage,  String? notification,  String? loadingStatus,  List<AppProcessInfo> allApps,  List<AppProcessInfo> userApps,  List<AppProcessInfo> systemApps,  double totalRamKb,  double freeRamKb,  double usedRamKb,  double appsRamKb,  bool isAutoUpdateEnabled,  bool isSearching,  String searchQuery)  $default,) {final _that = this;
switch (_that) {
case _HomeStateModel():
return $default(_that.isLoading,_that.shizukuReady,_that.errorMessage,_that.notification,_that.loadingStatus,_that.allApps,_that.userApps,_that.systemApps,_that.totalRamKb,_that.freeRamKb,_that.usedRamKb,_that.appsRamKb,_that.isAutoUpdateEnabled,_that.isSearching,_that.searchQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool shizukuReady,  String? errorMessage,  String? notification,  String? loadingStatus,  List<AppProcessInfo> allApps,  List<AppProcessInfo> userApps,  List<AppProcessInfo> systemApps,  double totalRamKb,  double freeRamKb,  double usedRamKb,  double appsRamKb,  bool isAutoUpdateEnabled,  bool isSearching,  String searchQuery)?  $default,) {final _that = this;
switch (_that) {
case _HomeStateModel() when $default != null:
return $default(_that.isLoading,_that.shizukuReady,_that.errorMessage,_that.notification,_that.loadingStatus,_that.allApps,_that.userApps,_that.systemApps,_that.totalRamKb,_that.freeRamKb,_that.usedRamKb,_that.appsRamKb,_that.isAutoUpdateEnabled,_that.isSearching,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc


class _HomeStateModel implements HomeStateModel {
  const _HomeStateModel({this.isLoading = false, this.shizukuReady = false, this.errorMessage, this.notification, this.loadingStatus, final  List<AppProcessInfo> allApps = const [], final  List<AppProcessInfo> userApps = const [], final  List<AppProcessInfo> systemApps = const [], this.totalRamKb = 0.0, this.freeRamKb = 0.0, this.usedRamKb = 0.0, this.appsRamKb = 0.0, this.isAutoUpdateEnabled = false, this.isSearching = false, this.searchQuery = ''}): _allApps = allApps,_userApps = userApps,_systemApps = systemApps;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool shizukuReady;
@override final  String? errorMessage;
@override final  String? notification;
@override final  String? loadingStatus;
 final  List<AppProcessInfo> _allApps;
@override@JsonKey() List<AppProcessInfo> get allApps {
  if (_allApps is EqualUnmodifiableListView) return _allApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allApps);
}

 final  List<AppProcessInfo> _userApps;
@override@JsonKey() List<AppProcessInfo> get userApps {
  if (_userApps is EqualUnmodifiableListView) return _userApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userApps);
}

 final  List<AppProcessInfo> _systemApps;
@override@JsonKey() List<AppProcessInfo> get systemApps {
  if (_systemApps is EqualUnmodifiableListView) return _systemApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_systemApps);
}

@override@JsonKey() final  double totalRamKb;
@override@JsonKey() final  double freeRamKb;
@override@JsonKey() final  double usedRamKb;
@override@JsonKey() final  double appsRamKb;
@override@JsonKey() final  bool isAutoUpdateEnabled;
@override@JsonKey() final  bool isSearching;
@override@JsonKey() final  String searchQuery;

/// Create a copy of HomeStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateModelCopyWith<_HomeStateModel> get copyWith => __$HomeStateModelCopyWithImpl<_HomeStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeStateModel&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.shizukuReady, shizukuReady) || other.shizukuReady == shizukuReady)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.notification, notification) || other.notification == notification)&&(identical(other.loadingStatus, loadingStatus) || other.loadingStatus == loadingStatus)&&const DeepCollectionEquality().equals(other._allApps, _allApps)&&const DeepCollectionEquality().equals(other._userApps, _userApps)&&const DeepCollectionEquality().equals(other._systemApps, _systemApps)&&(identical(other.totalRamKb, totalRamKb) || other.totalRamKb == totalRamKb)&&(identical(other.freeRamKb, freeRamKb) || other.freeRamKb == freeRamKb)&&(identical(other.usedRamKb, usedRamKb) || other.usedRamKb == usedRamKb)&&(identical(other.appsRamKb, appsRamKb) || other.appsRamKb == appsRamKb)&&(identical(other.isAutoUpdateEnabled, isAutoUpdateEnabled) || other.isAutoUpdateEnabled == isAutoUpdateEnabled)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,shizukuReady,errorMessage,notification,loadingStatus,const DeepCollectionEquality().hash(_allApps),const DeepCollectionEquality().hash(_userApps),const DeepCollectionEquality().hash(_systemApps),totalRamKb,freeRamKb,usedRamKb,appsRamKb,isAutoUpdateEnabled,isSearching,searchQuery);

@override
String toString() {
  return 'HomeStateModel(isLoading: $isLoading, shizukuReady: $shizukuReady, errorMessage: $errorMessage, notification: $notification, loadingStatus: $loadingStatus, allApps: $allApps, userApps: $userApps, systemApps: $systemApps, totalRamKb: $totalRamKb, freeRamKb: $freeRamKb, usedRamKb: $usedRamKb, appsRamKb: $appsRamKb, isAutoUpdateEnabled: $isAutoUpdateEnabled, isSearching: $isSearching, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$HomeStateModelCopyWith<$Res> implements $HomeStateModelCopyWith<$Res> {
  factory _$HomeStateModelCopyWith(_HomeStateModel value, $Res Function(_HomeStateModel) _then) = __$HomeStateModelCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool shizukuReady, String? errorMessage, String? notification, String? loadingStatus, List<AppProcessInfo> allApps, List<AppProcessInfo> userApps, List<AppProcessInfo> systemApps, double totalRamKb, double freeRamKb, double usedRamKb, double appsRamKb, bool isAutoUpdateEnabled, bool isSearching, String searchQuery
});




}
/// @nodoc
class __$HomeStateModelCopyWithImpl<$Res>
    implements _$HomeStateModelCopyWith<$Res> {
  __$HomeStateModelCopyWithImpl(this._self, this._then);

  final _HomeStateModel _self;
  final $Res Function(_HomeStateModel) _then;

/// Create a copy of HomeStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? shizukuReady = null,Object? errorMessage = freezed,Object? notification = freezed,Object? loadingStatus = freezed,Object? allApps = null,Object? userApps = null,Object? systemApps = null,Object? totalRamKb = null,Object? freeRamKb = null,Object? usedRamKb = null,Object? appsRamKb = null,Object? isAutoUpdateEnabled = null,Object? isSearching = null,Object? searchQuery = null,}) {
  return _then(_HomeStateModel(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,shizukuReady: null == shizukuReady ? _self.shizukuReady : shizukuReady // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,notification: freezed == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as String?,loadingStatus: freezed == loadingStatus ? _self.loadingStatus : loadingStatus // ignore: cast_nullable_to_non_nullable
as String?,allApps: null == allApps ? _self._allApps : allApps // ignore: cast_nullable_to_non_nullable
as List<AppProcessInfo>,userApps: null == userApps ? _self._userApps : userApps // ignore: cast_nullable_to_non_nullable
as List<AppProcessInfo>,systemApps: null == systemApps ? _self._systemApps : systemApps // ignore: cast_nullable_to_non_nullable
as List<AppProcessInfo>,totalRamKb: null == totalRamKb ? _self.totalRamKb : totalRamKb // ignore: cast_nullable_to_non_nullable
as double,freeRamKb: null == freeRamKb ? _self.freeRamKb : freeRamKb // ignore: cast_nullable_to_non_nullable
as double,usedRamKb: null == usedRamKb ? _self.usedRamKb : usedRamKb // ignore: cast_nullable_to_non_nullable
as double,appsRamKb: null == appsRamKb ? _self.appsRamKb : appsRamKb // ignore: cast_nullable_to_non_nullable
as double,isAutoUpdateEnabled: null == isAutoUpdateEnabled ? _self.isAutoUpdateEnabled : isAutoUpdateEnabled // ignore: cast_nullable_to_non_nullable
as bool,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
