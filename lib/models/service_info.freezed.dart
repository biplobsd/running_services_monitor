// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RunningServiceInfo {

 String get user; int get pid; String get processName; String get serviceName; String get packageName; bool get isSystemApp; String? get serviceClass; String? get appName; String? get ramUsage; double? get ramInKb; Uint8List? get icon;
/// Create a copy of RunningServiceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningServiceInfoCopyWith<RunningServiceInfo> get copyWith => _$RunningServiceInfoCopyWithImpl<RunningServiceInfo>(this as RunningServiceInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningServiceInfo&&(identical(other.user, user) || other.user == user)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.serviceClass, serviceClass) || other.serviceClass == serviceClass)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.ramUsage, ramUsage) || other.ramUsage == ramUsage)&&(identical(other.ramInKb, ramInKb) || other.ramInKb == ramInKb)&&const DeepCollectionEquality().equals(other.icon, icon));
}


@override
int get hashCode => Object.hash(runtimeType,user,pid,processName,serviceName,packageName,isSystemApp,serviceClass,appName,ramUsage,ramInKb,const DeepCollectionEquality().hash(icon));

@override
String toString() {
  return 'RunningServiceInfo(user: $user, pid: $pid, processName: $processName, serviceName: $serviceName, packageName: $packageName, isSystemApp: $isSystemApp, serviceClass: $serviceClass, appName: $appName, ramUsage: $ramUsage, ramInKb: $ramInKb, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $RunningServiceInfoCopyWith<$Res>  {
  factory $RunningServiceInfoCopyWith(RunningServiceInfo value, $Res Function(RunningServiceInfo) _then) = _$RunningServiceInfoCopyWithImpl;
@useResult
$Res call({
 String user, int pid, String processName, String serviceName, String packageName, bool isSystemApp, String? serviceClass, String? appName, String? ramUsage, double? ramInKb, Uint8List? icon
});




}
/// @nodoc
class _$RunningServiceInfoCopyWithImpl<$Res>
    implements $RunningServiceInfoCopyWith<$Res> {
  _$RunningServiceInfoCopyWithImpl(this._self, this._then);

  final RunningServiceInfo _self;
  final $Res Function(RunningServiceInfo) _then;

/// Create a copy of RunningServiceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? pid = null,Object? processName = null,Object? serviceName = null,Object? packageName = null,Object? isSystemApp = null,Object? serviceClass = freezed,Object? appName = freezed,Object? ramUsage = freezed,Object? ramInKb = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,serviceClass: freezed == serviceClass ? _self.serviceClass : serviceClass // ignore: cast_nullable_to_non_nullable
as String?,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,ramUsage: freezed == ramUsage ? _self.ramUsage : ramUsage // ignore: cast_nullable_to_non_nullable
as String?,ramInKb: freezed == ramInKb ? _self.ramInKb : ramInKb // ignore: cast_nullable_to_non_nullable
as double?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// Adds pattern-matching-related methods to [RunningServiceInfo].
extension RunningServiceInfoPatterns on RunningServiceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RunningServiceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RunningServiceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RunningServiceInfo value)  $default,){
final _that = this;
switch (_that) {
case _RunningServiceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RunningServiceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RunningServiceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String user,  int pid,  String processName,  String serviceName,  String packageName,  bool isSystemApp,  String? serviceClass,  String? appName,  String? ramUsage,  double? ramInKb,  Uint8List? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RunningServiceInfo() when $default != null:
return $default(_that.user,_that.pid,_that.processName,_that.serviceName,_that.packageName,_that.isSystemApp,_that.serviceClass,_that.appName,_that.ramUsage,_that.ramInKb,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String user,  int pid,  String processName,  String serviceName,  String packageName,  bool isSystemApp,  String? serviceClass,  String? appName,  String? ramUsage,  double? ramInKb,  Uint8List? icon)  $default,) {final _that = this;
switch (_that) {
case _RunningServiceInfo():
return $default(_that.user,_that.pid,_that.processName,_that.serviceName,_that.packageName,_that.isSystemApp,_that.serviceClass,_that.appName,_that.ramUsage,_that.ramInKb,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String user,  int pid,  String processName,  String serviceName,  String packageName,  bool isSystemApp,  String? serviceClass,  String? appName,  String? ramUsage,  double? ramInKb,  Uint8List? icon)?  $default,) {final _that = this;
switch (_that) {
case _RunningServiceInfo() when $default != null:
return $default(_that.user,_that.pid,_that.processName,_that.serviceName,_that.packageName,_that.isSystemApp,_that.serviceClass,_that.appName,_that.ramUsage,_that.ramInKb,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _RunningServiceInfo implements RunningServiceInfo {
  const _RunningServiceInfo({required this.user, required this.pid, required this.processName, required this.serviceName, required this.packageName, required this.isSystemApp, this.serviceClass, this.appName, this.ramUsage, this.ramInKb, this.icon});
  

@override final  String user;
@override final  int pid;
@override final  String processName;
@override final  String serviceName;
@override final  String packageName;
@override final  bool isSystemApp;
@override final  String? serviceClass;
@override final  String? appName;
@override final  String? ramUsage;
@override final  double? ramInKb;
@override final  Uint8List? icon;

/// Create a copy of RunningServiceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunningServiceInfoCopyWith<_RunningServiceInfo> get copyWith => __$RunningServiceInfoCopyWithImpl<_RunningServiceInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunningServiceInfo&&(identical(other.user, user) || other.user == user)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.serviceClass, serviceClass) || other.serviceClass == serviceClass)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.ramUsage, ramUsage) || other.ramUsage == ramUsage)&&(identical(other.ramInKb, ramInKb) || other.ramInKb == ramInKb)&&const DeepCollectionEquality().equals(other.icon, icon));
}


@override
int get hashCode => Object.hash(runtimeType,user,pid,processName,serviceName,packageName,isSystemApp,serviceClass,appName,ramUsage,ramInKb,const DeepCollectionEquality().hash(icon));

@override
String toString() {
  return 'RunningServiceInfo(user: $user, pid: $pid, processName: $processName, serviceName: $serviceName, packageName: $packageName, isSystemApp: $isSystemApp, serviceClass: $serviceClass, appName: $appName, ramUsage: $ramUsage, ramInKb: $ramInKb, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$RunningServiceInfoCopyWith<$Res> implements $RunningServiceInfoCopyWith<$Res> {
  factory _$RunningServiceInfoCopyWith(_RunningServiceInfo value, $Res Function(_RunningServiceInfo) _then) = __$RunningServiceInfoCopyWithImpl;
@override @useResult
$Res call({
 String user, int pid, String processName, String serviceName, String packageName, bool isSystemApp, String? serviceClass, String? appName, String? ramUsage, double? ramInKb, Uint8List? icon
});




}
/// @nodoc
class __$RunningServiceInfoCopyWithImpl<$Res>
    implements _$RunningServiceInfoCopyWith<$Res> {
  __$RunningServiceInfoCopyWithImpl(this._self, this._then);

  final _RunningServiceInfo _self;
  final $Res Function(_RunningServiceInfo) _then;

/// Create a copy of RunningServiceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? pid = null,Object? processName = null,Object? serviceName = null,Object? packageName = null,Object? isSystemApp = null,Object? serviceClass = freezed,Object? appName = freezed,Object? ramUsage = freezed,Object? ramInKb = freezed,Object? icon = freezed,}) {
  return _then(_RunningServiceInfo(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,serviceClass: freezed == serviceClass ? _self.serviceClass : serviceClass // ignore: cast_nullable_to_non_nullable
as String?,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,ramUsage: freezed == ramUsage ? _self.ramUsage : ramUsage // ignore: cast_nullable_to_non_nullable
as String?,ramInKb: freezed == ramInKb ? _self.ramInKb : ramInKb // ignore: cast_nullable_to_non_nullable
as double?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc
mixin _$AppProcessInfo {

 String get packageName; String get appName; List<RunningServiceInfo> get services; List<int> get pids; String get totalRam; double get totalRamInKb; bool get isSystemApp; AppInfo? get appInfo;
/// Create a copy of AppProcessInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppProcessInfoCopyWith<AppProcessInfo> get copyWith => _$AppProcessInfoCopyWithImpl<AppProcessInfo>(this as AppProcessInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.appName, appName) || other.appName == appName)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.pids, pids)&&(identical(other.totalRam, totalRam) || other.totalRam == totalRam)&&(identical(other.totalRamInKb, totalRamInKb) || other.totalRamInKb == totalRamInKb)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,appName,const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(pids),totalRam,totalRamInKb,isSystemApp,appInfo);

@override
String toString() {
  return 'AppProcessInfo(packageName: $packageName, appName: $appName, services: $services, pids: $pids, totalRam: $totalRam, totalRamInKb: $totalRamInKb, isSystemApp: $isSystemApp, appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class $AppProcessInfoCopyWith<$Res>  {
  factory $AppProcessInfoCopyWith(AppProcessInfo value, $Res Function(AppProcessInfo) _then) = _$AppProcessInfoCopyWithImpl;
@useResult
$Res call({
 String packageName, String appName, List<RunningServiceInfo> services, List<int> pids, String totalRam, double totalRamInKb, bool isSystemApp, AppInfo? appInfo
});




}
/// @nodoc
class _$AppProcessInfoCopyWithImpl<$Res>
    implements $AppProcessInfoCopyWith<$Res> {
  _$AppProcessInfoCopyWithImpl(this._self, this._then);

  final AppProcessInfo _self;
  final $Res Function(AppProcessInfo) _then;

/// Create a copy of AppProcessInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? appName = null,Object? services = null,Object? pids = null,Object? totalRam = null,Object? totalRamInKb = null,Object? isSystemApp = null,Object? appInfo = freezed,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<RunningServiceInfo>,pids: null == pids ? _self.pids : pids // ignore: cast_nullable_to_non_nullable
as List<int>,totalRam: null == totalRam ? _self.totalRam : totalRam // ignore: cast_nullable_to_non_nullable
as String,totalRamInKb: null == totalRamInKb ? _self.totalRamInKb : totalRamInKb // ignore: cast_nullable_to_non_nullable
as double,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,appInfo: freezed == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppInfo?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppProcessInfo].
extension AppProcessInfoPatterns on AppProcessInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppProcessInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppProcessInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppProcessInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppProcessInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppProcessInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppProcessInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String appName,  List<RunningServiceInfo> services,  List<int> pids,  String totalRam,  double totalRamInKb,  bool isSystemApp,  AppInfo? appInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppProcessInfo() when $default != null:
return $default(_that.packageName,_that.appName,_that.services,_that.pids,_that.totalRam,_that.totalRamInKb,_that.isSystemApp,_that.appInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String appName,  List<RunningServiceInfo> services,  List<int> pids,  String totalRam,  double totalRamInKb,  bool isSystemApp,  AppInfo? appInfo)  $default,) {final _that = this;
switch (_that) {
case _AppProcessInfo():
return $default(_that.packageName,_that.appName,_that.services,_that.pids,_that.totalRam,_that.totalRamInKb,_that.isSystemApp,_that.appInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String appName,  List<RunningServiceInfo> services,  List<int> pids,  String totalRam,  double totalRamInKb,  bool isSystemApp,  AppInfo? appInfo)?  $default,) {final _that = this;
switch (_that) {
case _AppProcessInfo() when $default != null:
return $default(_that.packageName,_that.appName,_that.services,_that.pids,_that.totalRam,_that.totalRamInKb,_that.isSystemApp,_that.appInfo);case _:
  return null;

}
}

}

/// @nodoc


class _AppProcessInfo implements AppProcessInfo {
  const _AppProcessInfo({required this.packageName, required this.appName, required final  List<RunningServiceInfo> services, required final  List<int> pids, required this.totalRam, required this.totalRamInKb, required this.isSystemApp, this.appInfo}): _services = services,_pids = pids;
  

@override final  String packageName;
@override final  String appName;
 final  List<RunningServiceInfo> _services;
@override List<RunningServiceInfo> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<int> _pids;
@override List<int> get pids {
  if (_pids is EqualUnmodifiableListView) return _pids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pids);
}

@override final  String totalRam;
@override final  double totalRamInKb;
@override final  bool isSystemApp;
@override final  AppInfo? appInfo;

/// Create a copy of AppProcessInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppProcessInfoCopyWith<_AppProcessInfo> get copyWith => __$AppProcessInfoCopyWithImpl<_AppProcessInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.appName, appName) || other.appName == appName)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._pids, _pids)&&(identical(other.totalRam, totalRam) || other.totalRam == totalRam)&&(identical(other.totalRamInKb, totalRamInKb) || other.totalRamInKb == totalRamInKb)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,appName,const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_pids),totalRam,totalRamInKb,isSystemApp,appInfo);

@override
String toString() {
  return 'AppProcessInfo(packageName: $packageName, appName: $appName, services: $services, pids: $pids, totalRam: $totalRam, totalRamInKb: $totalRamInKb, isSystemApp: $isSystemApp, appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class _$AppProcessInfoCopyWith<$Res> implements $AppProcessInfoCopyWith<$Res> {
  factory _$AppProcessInfoCopyWith(_AppProcessInfo value, $Res Function(_AppProcessInfo) _then) = __$AppProcessInfoCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String appName, List<RunningServiceInfo> services, List<int> pids, String totalRam, double totalRamInKb, bool isSystemApp, AppInfo? appInfo
});




}
/// @nodoc
class __$AppProcessInfoCopyWithImpl<$Res>
    implements _$AppProcessInfoCopyWith<$Res> {
  __$AppProcessInfoCopyWithImpl(this._self, this._then);

  final _AppProcessInfo _self;
  final $Res Function(_AppProcessInfo) _then;

/// Create a copy of AppProcessInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? appName = null,Object? services = null,Object? pids = null,Object? totalRam = null,Object? totalRamInKb = null,Object? isSystemApp = null,Object? appInfo = freezed,}) {
  return _then(_AppProcessInfo(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,appName: null == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<RunningServiceInfo>,pids: null == pids ? _self._pids : pids // ignore: cast_nullable_to_non_nullable
as List<int>,totalRam: null == totalRam ? _self.totalRam : totalRam // ignore: cast_nullable_to_non_nullable
as String,totalRamInKb: null == totalRamInKb ? _self.totalRamInKb : totalRamInKb // ignore: cast_nullable_to_non_nullable
as double,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,appInfo: freezed == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppInfo?,
  ));
}


}

/// @nodoc
mixin _$RunningProcessInfo {

 String get packageName; String get processName; int get pid; int get uid; String? get appName; bool get isSystemApp; String get importance;
/// Create a copy of RunningProcessInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningProcessInfoCopyWith<RunningProcessInfo> get copyWith => _$RunningProcessInfoCopyWithImpl<RunningProcessInfo>(this as RunningProcessInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.importance, importance) || other.importance == importance));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,processName,pid,uid,appName,isSystemApp,importance);

@override
String toString() {
  return 'RunningProcessInfo(packageName: $packageName, processName: $processName, pid: $pid, uid: $uid, appName: $appName, isSystemApp: $isSystemApp, importance: $importance)';
}


}

/// @nodoc
abstract mixin class $RunningProcessInfoCopyWith<$Res>  {
  factory $RunningProcessInfoCopyWith(RunningProcessInfo value, $Res Function(RunningProcessInfo) _then) = _$RunningProcessInfoCopyWithImpl;
@useResult
$Res call({
 String packageName, String processName, int pid, int uid, String? appName, bool isSystemApp, String importance
});




}
/// @nodoc
class _$RunningProcessInfoCopyWithImpl<$Res>
    implements $RunningProcessInfoCopyWith<$Res> {
  _$RunningProcessInfoCopyWithImpl(this._self, this._then);

  final RunningProcessInfo _self;
  final $Res Function(RunningProcessInfo) _then;

/// Create a copy of RunningProcessInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? processName = null,Object? pid = null,Object? uid = null,Object? appName = freezed,Object? isSystemApp = null,Object? importance = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,importance: null == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RunningProcessInfo].
extension RunningProcessInfoPatterns on RunningProcessInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RunningProcessInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RunningProcessInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RunningProcessInfo value)  $default,){
final _that = this;
switch (_that) {
case _RunningProcessInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RunningProcessInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RunningProcessInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String processName,  int pid,  int uid,  String? appName,  bool isSystemApp,  String importance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RunningProcessInfo() when $default != null:
return $default(_that.packageName,_that.processName,_that.pid,_that.uid,_that.appName,_that.isSystemApp,_that.importance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String processName,  int pid,  int uid,  String? appName,  bool isSystemApp,  String importance)  $default,) {final _that = this;
switch (_that) {
case _RunningProcessInfo():
return $default(_that.packageName,_that.processName,_that.pid,_that.uid,_that.appName,_that.isSystemApp,_that.importance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String processName,  int pid,  int uid,  String? appName,  bool isSystemApp,  String importance)?  $default,) {final _that = this;
switch (_that) {
case _RunningProcessInfo() when $default != null:
return $default(_that.packageName,_that.processName,_that.pid,_that.uid,_that.appName,_that.isSystemApp,_that.importance);case _:
  return null;

}
}

}

/// @nodoc


class _RunningProcessInfo implements RunningProcessInfo {
  const _RunningProcessInfo({required this.packageName, required this.processName, required this.pid, required this.uid, this.appName, required this.isSystemApp, required this.importance});
  

@override final  String packageName;
@override final  String processName;
@override final  int pid;
@override final  int uid;
@override final  String? appName;
@override final  bool isSystemApp;
@override final  String importance;

/// Create a copy of RunningProcessInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunningProcessInfoCopyWith<_RunningProcessInfo> get copyWith => __$RunningProcessInfoCopyWithImpl<_RunningProcessInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunningProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.importance, importance) || other.importance == importance));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,processName,pid,uid,appName,isSystemApp,importance);

@override
String toString() {
  return 'RunningProcessInfo(packageName: $packageName, processName: $processName, pid: $pid, uid: $uid, appName: $appName, isSystemApp: $isSystemApp, importance: $importance)';
}


}

/// @nodoc
abstract mixin class _$RunningProcessInfoCopyWith<$Res> implements $RunningProcessInfoCopyWith<$Res> {
  factory _$RunningProcessInfoCopyWith(_RunningProcessInfo value, $Res Function(_RunningProcessInfo) _then) = __$RunningProcessInfoCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String processName, int pid, int uid, String? appName, bool isSystemApp, String importance
});




}
/// @nodoc
class __$RunningProcessInfoCopyWithImpl<$Res>
    implements _$RunningProcessInfoCopyWith<$Res> {
  __$RunningProcessInfoCopyWithImpl(this._self, this._then);

  final _RunningProcessInfo _self;
  final $Res Function(_RunningProcessInfo) _then;

/// Create a copy of RunningProcessInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? processName = null,Object? pid = null,Object? uid = null,Object? appName = freezed,Object? isSystemApp = null,Object? importance = null,}) {
  return _then(_RunningProcessInfo(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,importance: null == importance ? _self.importance : importance // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
