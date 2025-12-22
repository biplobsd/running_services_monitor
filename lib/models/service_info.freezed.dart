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

 String get user; int? get pid; String get processName; String get serviceName; String get packageName; bool get isSystemApp; String? get serviceClass; double? get ramInKb; String? get intent; String? get baseDir; String? get dataDir; bool? get isForeground; int? get foregroundId; String? get createTime; String? get lastActivityTime; bool? get startRequested; bool? get createdFromFg; String? get rawServiceRecord; int? get uid; int? get recentCallingUid; List<ConnectionRecord> get connections; bool get hasBound;
/// Create a copy of RunningServiceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunningServiceInfoCopyWith<RunningServiceInfo> get copyWith => _$RunningServiceInfoCopyWithImpl<RunningServiceInfo>(this as RunningServiceInfo, _$identity);

  /// Serializes this RunningServiceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningServiceInfo&&(identical(other.user, user) || other.user == user)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.serviceClass, serviceClass) || other.serviceClass == serviceClass)&&(identical(other.ramInKb, ramInKb) || other.ramInKb == ramInKb)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.baseDir, baseDir) || other.baseDir == baseDir)&&(identical(other.dataDir, dataDir) || other.dataDir == dataDir)&&(identical(other.isForeground, isForeground) || other.isForeground == isForeground)&&(identical(other.foregroundId, foregroundId) || other.foregroundId == foregroundId)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.lastActivityTime, lastActivityTime) || other.lastActivityTime == lastActivityTime)&&(identical(other.startRequested, startRequested) || other.startRequested == startRequested)&&(identical(other.createdFromFg, createdFromFg) || other.createdFromFg == createdFromFg)&&(identical(other.rawServiceRecord, rawServiceRecord) || other.rawServiceRecord == rawServiceRecord)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.recentCallingUid, recentCallingUid) || other.recentCallingUid == recentCallingUid)&&const DeepCollectionEquality().equals(other.connections, connections)&&(identical(other.hasBound, hasBound) || other.hasBound == hasBound));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,user,pid,processName,serviceName,packageName,isSystemApp,serviceClass,ramInKb,intent,baseDir,dataDir,isForeground,foregroundId,createTime,lastActivityTime,startRequested,createdFromFg,rawServiceRecord,uid,recentCallingUid,const DeepCollectionEquality().hash(connections),hasBound]);

@override
String toString() {
  return 'RunningServiceInfo(user: $user, pid: $pid, processName: $processName, serviceName: $serviceName, packageName: $packageName, isSystemApp: $isSystemApp, serviceClass: $serviceClass, ramInKb: $ramInKb, intent: $intent, baseDir: $baseDir, dataDir: $dataDir, isForeground: $isForeground, foregroundId: $foregroundId, createTime: $createTime, lastActivityTime: $lastActivityTime, startRequested: $startRequested, createdFromFg: $createdFromFg, rawServiceRecord: $rawServiceRecord, uid: $uid, recentCallingUid: $recentCallingUid, connections: $connections, hasBound: $hasBound)';
}


}

/// @nodoc
abstract mixin class $RunningServiceInfoCopyWith<$Res>  {
  factory $RunningServiceInfoCopyWith(RunningServiceInfo value, $Res Function(RunningServiceInfo) _then) = _$RunningServiceInfoCopyWithImpl;
@useResult
$Res call({
 String user, int? pid, String processName, String serviceName, String packageName, bool isSystemApp, String? serviceClass, double? ramInKb, String? intent, String? baseDir, String? dataDir, bool? isForeground, int? foregroundId, String? createTime, String? lastActivityTime, bool? startRequested, bool? createdFromFg, String? rawServiceRecord, int? uid, int? recentCallingUid, List<ConnectionRecord> connections, bool hasBound
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
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? pid = freezed,Object? processName = null,Object? serviceName = null,Object? packageName = null,Object? isSystemApp = null,Object? serviceClass = freezed,Object? ramInKb = freezed,Object? intent = freezed,Object? baseDir = freezed,Object? dataDir = freezed,Object? isForeground = freezed,Object? foregroundId = freezed,Object? createTime = freezed,Object? lastActivityTime = freezed,Object? startRequested = freezed,Object? createdFromFg = freezed,Object? rawServiceRecord = freezed,Object? uid = freezed,Object? recentCallingUid = freezed,Object? connections = null,Object? hasBound = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,serviceClass: freezed == serviceClass ? _self.serviceClass : serviceClass // ignore: cast_nullable_to_non_nullable
as String?,ramInKb: freezed == ramInKb ? _self.ramInKb : ramInKb // ignore: cast_nullable_to_non_nullable
as double?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,baseDir: freezed == baseDir ? _self.baseDir : baseDir // ignore: cast_nullable_to_non_nullable
as String?,dataDir: freezed == dataDir ? _self.dataDir : dataDir // ignore: cast_nullable_to_non_nullable
as String?,isForeground: freezed == isForeground ? _self.isForeground : isForeground // ignore: cast_nullable_to_non_nullable
as bool?,foregroundId: freezed == foregroundId ? _self.foregroundId : foregroundId // ignore: cast_nullable_to_non_nullable
as int?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String?,lastActivityTime: freezed == lastActivityTime ? _self.lastActivityTime : lastActivityTime // ignore: cast_nullable_to_non_nullable
as String?,startRequested: freezed == startRequested ? _self.startRequested : startRequested // ignore: cast_nullable_to_non_nullable
as bool?,createdFromFg: freezed == createdFromFg ? _self.createdFromFg : createdFromFg // ignore: cast_nullable_to_non_nullable
as bool?,rawServiceRecord: freezed == rawServiceRecord ? _self.rawServiceRecord : rawServiceRecord // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,recentCallingUid: freezed == recentCallingUid ? _self.recentCallingUid : recentCallingUid // ignore: cast_nullable_to_non_nullable
as int?,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectionRecord>,hasBound: null == hasBound ? _self.hasBound : hasBound // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String user,  int? pid,  String processName,  String serviceName,  String packageName,  bool isSystemApp,  String? serviceClass,  double? ramInKb,  String? intent,  String? baseDir,  String? dataDir,  bool? isForeground,  int? foregroundId,  String? createTime,  String? lastActivityTime,  bool? startRequested,  bool? createdFromFg,  String? rawServiceRecord,  int? uid,  int? recentCallingUid,  List<ConnectionRecord> connections,  bool hasBound)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RunningServiceInfo() when $default != null:
return $default(_that.user,_that.pid,_that.processName,_that.serviceName,_that.packageName,_that.isSystemApp,_that.serviceClass,_that.ramInKb,_that.intent,_that.baseDir,_that.dataDir,_that.isForeground,_that.foregroundId,_that.createTime,_that.lastActivityTime,_that.startRequested,_that.createdFromFg,_that.rawServiceRecord,_that.uid,_that.recentCallingUid,_that.connections,_that.hasBound);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String user,  int? pid,  String processName,  String serviceName,  String packageName,  bool isSystemApp,  String? serviceClass,  double? ramInKb,  String? intent,  String? baseDir,  String? dataDir,  bool? isForeground,  int? foregroundId,  String? createTime,  String? lastActivityTime,  bool? startRequested,  bool? createdFromFg,  String? rawServiceRecord,  int? uid,  int? recentCallingUid,  List<ConnectionRecord> connections,  bool hasBound)  $default,) {final _that = this;
switch (_that) {
case _RunningServiceInfo():
return $default(_that.user,_that.pid,_that.processName,_that.serviceName,_that.packageName,_that.isSystemApp,_that.serviceClass,_that.ramInKb,_that.intent,_that.baseDir,_that.dataDir,_that.isForeground,_that.foregroundId,_that.createTime,_that.lastActivityTime,_that.startRequested,_that.createdFromFg,_that.rawServiceRecord,_that.uid,_that.recentCallingUid,_that.connections,_that.hasBound);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String user,  int? pid,  String processName,  String serviceName,  String packageName,  bool isSystemApp,  String? serviceClass,  double? ramInKb,  String? intent,  String? baseDir,  String? dataDir,  bool? isForeground,  int? foregroundId,  String? createTime,  String? lastActivityTime,  bool? startRequested,  bool? createdFromFg,  String? rawServiceRecord,  int? uid,  int? recentCallingUid,  List<ConnectionRecord> connections,  bool hasBound)?  $default,) {final _that = this;
switch (_that) {
case _RunningServiceInfo() when $default != null:
return $default(_that.user,_that.pid,_that.processName,_that.serviceName,_that.packageName,_that.isSystemApp,_that.serviceClass,_that.ramInKb,_that.intent,_that.baseDir,_that.dataDir,_that.isForeground,_that.foregroundId,_that.createTime,_that.lastActivityTime,_that.startRequested,_that.createdFromFg,_that.rawServiceRecord,_that.uid,_that.recentCallingUid,_that.connections,_that.hasBound);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RunningServiceInfo extends RunningServiceInfo {
  const _RunningServiceInfo({required this.user, this.pid, required this.processName, required this.serviceName, required this.packageName, required this.isSystemApp, this.serviceClass, this.ramInKb, this.intent, this.baseDir, this.dataDir, this.isForeground, this.foregroundId, this.createTime, this.lastActivityTime, this.startRequested, this.createdFromFg, this.rawServiceRecord, this.uid, this.recentCallingUid, final  List<ConnectionRecord> connections = const [], this.hasBound = false}): _connections = connections,super._();
  factory _RunningServiceInfo.fromJson(Map<String, dynamic> json) => _$RunningServiceInfoFromJson(json);

@override final  String user;
@override final  int? pid;
@override final  String processName;
@override final  String serviceName;
@override final  String packageName;
@override final  bool isSystemApp;
@override final  String? serviceClass;
@override final  double? ramInKb;
@override final  String? intent;
@override final  String? baseDir;
@override final  String? dataDir;
@override final  bool? isForeground;
@override final  int? foregroundId;
@override final  String? createTime;
@override final  String? lastActivityTime;
@override final  bool? startRequested;
@override final  bool? createdFromFg;
@override final  String? rawServiceRecord;
@override final  int? uid;
@override final  int? recentCallingUid;
 final  List<ConnectionRecord> _connections;
@override@JsonKey() List<ConnectionRecord> get connections {
  if (_connections is EqualUnmodifiableListView) return _connections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connections);
}

@override@JsonKey() final  bool hasBound;

/// Create a copy of RunningServiceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunningServiceInfoCopyWith<_RunningServiceInfo> get copyWith => __$RunningServiceInfoCopyWithImpl<_RunningServiceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunningServiceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunningServiceInfo&&(identical(other.user, user) || other.user == user)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.serviceClass, serviceClass) || other.serviceClass == serviceClass)&&(identical(other.ramInKb, ramInKb) || other.ramInKb == ramInKb)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.baseDir, baseDir) || other.baseDir == baseDir)&&(identical(other.dataDir, dataDir) || other.dataDir == dataDir)&&(identical(other.isForeground, isForeground) || other.isForeground == isForeground)&&(identical(other.foregroundId, foregroundId) || other.foregroundId == foregroundId)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.lastActivityTime, lastActivityTime) || other.lastActivityTime == lastActivityTime)&&(identical(other.startRequested, startRequested) || other.startRequested == startRequested)&&(identical(other.createdFromFg, createdFromFg) || other.createdFromFg == createdFromFg)&&(identical(other.rawServiceRecord, rawServiceRecord) || other.rawServiceRecord == rawServiceRecord)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.recentCallingUid, recentCallingUid) || other.recentCallingUid == recentCallingUid)&&const DeepCollectionEquality().equals(other._connections, _connections)&&(identical(other.hasBound, hasBound) || other.hasBound == hasBound));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,user,pid,processName,serviceName,packageName,isSystemApp,serviceClass,ramInKb,intent,baseDir,dataDir,isForeground,foregroundId,createTime,lastActivityTime,startRequested,createdFromFg,rawServiceRecord,uid,recentCallingUid,const DeepCollectionEquality().hash(_connections),hasBound]);

@override
String toString() {
  return 'RunningServiceInfo(user: $user, pid: $pid, processName: $processName, serviceName: $serviceName, packageName: $packageName, isSystemApp: $isSystemApp, serviceClass: $serviceClass, ramInKb: $ramInKb, intent: $intent, baseDir: $baseDir, dataDir: $dataDir, isForeground: $isForeground, foregroundId: $foregroundId, createTime: $createTime, lastActivityTime: $lastActivityTime, startRequested: $startRequested, createdFromFg: $createdFromFg, rawServiceRecord: $rawServiceRecord, uid: $uid, recentCallingUid: $recentCallingUid, connections: $connections, hasBound: $hasBound)';
}


}

/// @nodoc
abstract mixin class _$RunningServiceInfoCopyWith<$Res> implements $RunningServiceInfoCopyWith<$Res> {
  factory _$RunningServiceInfoCopyWith(_RunningServiceInfo value, $Res Function(_RunningServiceInfo) _then) = __$RunningServiceInfoCopyWithImpl;
@override @useResult
$Res call({
 String user, int? pid, String processName, String serviceName, String packageName, bool isSystemApp, String? serviceClass, double? ramInKb, String? intent, String? baseDir, String? dataDir, bool? isForeground, int? foregroundId, String? createTime, String? lastActivityTime, bool? startRequested, bool? createdFromFg, String? rawServiceRecord, int? uid, int? recentCallingUid, List<ConnectionRecord> connections, bool hasBound
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
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? pid = freezed,Object? processName = null,Object? serviceName = null,Object? packageName = null,Object? isSystemApp = null,Object? serviceClass = freezed,Object? ramInKb = freezed,Object? intent = freezed,Object? baseDir = freezed,Object? dataDir = freezed,Object? isForeground = freezed,Object? foregroundId = freezed,Object? createTime = freezed,Object? lastActivityTime = freezed,Object? startRequested = freezed,Object? createdFromFg = freezed,Object? rawServiceRecord = freezed,Object? uid = freezed,Object? recentCallingUid = freezed,Object? connections = null,Object? hasBound = null,}) {
  return _then(_RunningServiceInfo(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,isSystemApp: null == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool,serviceClass: freezed == serviceClass ? _self.serviceClass : serviceClass // ignore: cast_nullable_to_non_nullable
as String?,ramInKb: freezed == ramInKb ? _self.ramInKb : ramInKb // ignore: cast_nullable_to_non_nullable
as double?,intent: freezed == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String?,baseDir: freezed == baseDir ? _self.baseDir : baseDir // ignore: cast_nullable_to_non_nullable
as String?,dataDir: freezed == dataDir ? _self.dataDir : dataDir // ignore: cast_nullable_to_non_nullable
as String?,isForeground: freezed == isForeground ? _self.isForeground : isForeground // ignore: cast_nullable_to_non_nullable
as bool?,foregroundId: freezed == foregroundId ? _self.foregroundId : foregroundId // ignore: cast_nullable_to_non_nullable
as int?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String?,lastActivityTime: freezed == lastActivityTime ? _self.lastActivityTime : lastActivityTime // ignore: cast_nullable_to_non_nullable
as String?,startRequested: freezed == startRequested ? _self.startRequested : startRequested // ignore: cast_nullable_to_non_nullable
as bool?,createdFromFg: freezed == createdFromFg ? _self.createdFromFg : createdFromFg // ignore: cast_nullable_to_non_nullable
as bool?,rawServiceRecord: freezed == rawServiceRecord ? _self.rawServiceRecord : rawServiceRecord // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int?,recentCallingUid: freezed == recentCallingUid ? _self.recentCallingUid : recentCallingUid // ignore: cast_nullable_to_non_nullable
as int?,connections: null == connections ? _self._connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectionRecord>,hasBound: null == hasBound ? _self.hasBound : hasBound // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AppProcessInfo {

 String get packageName; List<RunningServiceInfo> get services; List<int> get pids; double get totalRamInKb; bool? get isSystemApp; List<ConnectionRecord> get connections; String? get processState; String? get adjLevel; bool get hasServices; List<RamSourceInfo> get ramSources; double get cachedMemoryKb; List<ProcessEntry> get processes; bool get isCoreApp;
/// Create a copy of AppProcessInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppProcessInfoCopyWith<AppProcessInfo> get copyWith => _$AppProcessInfoCopyWithImpl<AppProcessInfo>(this as AppProcessInfo, _$identity);

  /// Serializes this AppProcessInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.pids, pids)&&(identical(other.totalRamInKb, totalRamInKb) || other.totalRamInKb == totalRamInKb)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&const DeepCollectionEquality().equals(other.connections, connections)&&(identical(other.processState, processState) || other.processState == processState)&&(identical(other.adjLevel, adjLevel) || other.adjLevel == adjLevel)&&(identical(other.hasServices, hasServices) || other.hasServices == hasServices)&&const DeepCollectionEquality().equals(other.ramSources, ramSources)&&(identical(other.cachedMemoryKb, cachedMemoryKb) || other.cachedMemoryKb == cachedMemoryKb)&&const DeepCollectionEquality().equals(other.processes, processes)&&(identical(other.isCoreApp, isCoreApp) || other.isCoreApp == isCoreApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(pids),totalRamInKb,isSystemApp,const DeepCollectionEquality().hash(connections),processState,adjLevel,hasServices,const DeepCollectionEquality().hash(ramSources),cachedMemoryKb,const DeepCollectionEquality().hash(processes),isCoreApp);

@override
String toString() {
  return 'AppProcessInfo(packageName: $packageName, services: $services, pids: $pids, totalRamInKb: $totalRamInKb, isSystemApp: $isSystemApp, connections: $connections, processState: $processState, adjLevel: $adjLevel, hasServices: $hasServices, ramSources: $ramSources, cachedMemoryKb: $cachedMemoryKb, processes: $processes, isCoreApp: $isCoreApp)';
}


}

/// @nodoc
abstract mixin class $AppProcessInfoCopyWith<$Res>  {
  factory $AppProcessInfoCopyWith(AppProcessInfo value, $Res Function(AppProcessInfo) _then) = _$AppProcessInfoCopyWithImpl;
@useResult
$Res call({
 String packageName, List<RunningServiceInfo> services, List<int> pids, double totalRamInKb, bool? isSystemApp, List<ConnectionRecord> connections, String? processState, String? adjLevel, bool hasServices, List<RamSourceInfo> ramSources, double cachedMemoryKb, List<ProcessEntry> processes, bool isCoreApp
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
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? services = null,Object? pids = null,Object? totalRamInKb = null,Object? isSystemApp = freezed,Object? connections = null,Object? processState = freezed,Object? adjLevel = freezed,Object? hasServices = null,Object? ramSources = null,Object? cachedMemoryKb = null,Object? processes = null,Object? isCoreApp = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<RunningServiceInfo>,pids: null == pids ? _self.pids : pids // ignore: cast_nullable_to_non_nullable
as List<int>,totalRamInKb: null == totalRamInKb ? _self.totalRamInKb : totalRamInKb // ignore: cast_nullable_to_non_nullable
as double,isSystemApp: freezed == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool?,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectionRecord>,processState: freezed == processState ? _self.processState : processState // ignore: cast_nullable_to_non_nullable
as String?,adjLevel: freezed == adjLevel ? _self.adjLevel : adjLevel // ignore: cast_nullable_to_non_nullable
as String?,hasServices: null == hasServices ? _self.hasServices : hasServices // ignore: cast_nullable_to_non_nullable
as bool,ramSources: null == ramSources ? _self.ramSources : ramSources // ignore: cast_nullable_to_non_nullable
as List<RamSourceInfo>,cachedMemoryKb: null == cachedMemoryKb ? _self.cachedMemoryKb : cachedMemoryKb // ignore: cast_nullable_to_non_nullable
as double,processes: null == processes ? _self.processes : processes // ignore: cast_nullable_to_non_nullable
as List<ProcessEntry>,isCoreApp: null == isCoreApp ? _self.isCoreApp : isCoreApp // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  List<RunningServiceInfo> services,  List<int> pids,  double totalRamInKb,  bool? isSystemApp,  List<ConnectionRecord> connections,  String? processState,  String? adjLevel,  bool hasServices,  List<RamSourceInfo> ramSources,  double cachedMemoryKb,  List<ProcessEntry> processes,  bool isCoreApp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppProcessInfo() when $default != null:
return $default(_that.packageName,_that.services,_that.pids,_that.totalRamInKb,_that.isSystemApp,_that.connections,_that.processState,_that.adjLevel,_that.hasServices,_that.ramSources,_that.cachedMemoryKb,_that.processes,_that.isCoreApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  List<RunningServiceInfo> services,  List<int> pids,  double totalRamInKb,  bool? isSystemApp,  List<ConnectionRecord> connections,  String? processState,  String? adjLevel,  bool hasServices,  List<RamSourceInfo> ramSources,  double cachedMemoryKb,  List<ProcessEntry> processes,  bool isCoreApp)  $default,) {final _that = this;
switch (_that) {
case _AppProcessInfo():
return $default(_that.packageName,_that.services,_that.pids,_that.totalRamInKb,_that.isSystemApp,_that.connections,_that.processState,_that.adjLevel,_that.hasServices,_that.ramSources,_that.cachedMemoryKb,_that.processes,_that.isCoreApp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  List<RunningServiceInfo> services,  List<int> pids,  double totalRamInKb,  bool? isSystemApp,  List<ConnectionRecord> connections,  String? processState,  String? adjLevel,  bool hasServices,  List<RamSourceInfo> ramSources,  double cachedMemoryKb,  List<ProcessEntry> processes,  bool isCoreApp)?  $default,) {final _that = this;
switch (_that) {
case _AppProcessInfo() when $default != null:
return $default(_that.packageName,_that.services,_that.pids,_that.totalRamInKb,_that.isSystemApp,_that.connections,_that.processState,_that.adjLevel,_that.hasServices,_that.ramSources,_that.cachedMemoryKb,_that.processes,_that.isCoreApp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppProcessInfo extends AppProcessInfo {
  const _AppProcessInfo({required this.packageName, required final  List<RunningServiceInfo> services, required final  List<int> pids, required this.totalRamInKb, this.isSystemApp, final  List<ConnectionRecord> connections = const [], this.processState, this.adjLevel, this.hasServices = true, final  List<RamSourceInfo> ramSources = const [], this.cachedMemoryKb = 0, final  List<ProcessEntry> processes = const [], this.isCoreApp = false}): _services = services,_pids = pids,_connections = connections,_ramSources = ramSources,_processes = processes,super._();
  factory _AppProcessInfo.fromJson(Map<String, dynamic> json) => _$AppProcessInfoFromJson(json);

@override final  String packageName;
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

@override final  double totalRamInKb;
@override final  bool? isSystemApp;
 final  List<ConnectionRecord> _connections;
@override@JsonKey() List<ConnectionRecord> get connections {
  if (_connections is EqualUnmodifiableListView) return _connections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connections);
}

@override final  String? processState;
@override final  String? adjLevel;
@override@JsonKey() final  bool hasServices;
 final  List<RamSourceInfo> _ramSources;
@override@JsonKey() List<RamSourceInfo> get ramSources {
  if (_ramSources is EqualUnmodifiableListView) return _ramSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ramSources);
}

@override@JsonKey() final  double cachedMemoryKb;
 final  List<ProcessEntry> _processes;
@override@JsonKey() List<ProcessEntry> get processes {
  if (_processes is EqualUnmodifiableListView) return _processes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_processes);
}

@override@JsonKey() final  bool isCoreApp;

/// Create a copy of AppProcessInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppProcessInfoCopyWith<_AppProcessInfo> get copyWith => __$AppProcessInfoCopyWithImpl<_AppProcessInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppProcessInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._pids, _pids)&&(identical(other.totalRamInKb, totalRamInKb) || other.totalRamInKb == totalRamInKb)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&const DeepCollectionEquality().equals(other._connections, _connections)&&(identical(other.processState, processState) || other.processState == processState)&&(identical(other.adjLevel, adjLevel) || other.adjLevel == adjLevel)&&(identical(other.hasServices, hasServices) || other.hasServices == hasServices)&&const DeepCollectionEquality().equals(other._ramSources, _ramSources)&&(identical(other.cachedMemoryKb, cachedMemoryKb) || other.cachedMemoryKb == cachedMemoryKb)&&const DeepCollectionEquality().equals(other._processes, _processes)&&(identical(other.isCoreApp, isCoreApp) || other.isCoreApp == isCoreApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_pids),totalRamInKb,isSystemApp,const DeepCollectionEquality().hash(_connections),processState,adjLevel,hasServices,const DeepCollectionEquality().hash(_ramSources),cachedMemoryKb,const DeepCollectionEquality().hash(_processes),isCoreApp);

@override
String toString() {
  return 'AppProcessInfo(packageName: $packageName, services: $services, pids: $pids, totalRamInKb: $totalRamInKb, isSystemApp: $isSystemApp, connections: $connections, processState: $processState, adjLevel: $adjLevel, hasServices: $hasServices, ramSources: $ramSources, cachedMemoryKb: $cachedMemoryKb, processes: $processes, isCoreApp: $isCoreApp)';
}


}

/// @nodoc
abstract mixin class _$AppProcessInfoCopyWith<$Res> implements $AppProcessInfoCopyWith<$Res> {
  factory _$AppProcessInfoCopyWith(_AppProcessInfo value, $Res Function(_AppProcessInfo) _then) = __$AppProcessInfoCopyWithImpl;
@override @useResult
$Res call({
 String packageName, List<RunningServiceInfo> services, List<int> pids, double totalRamInKb, bool? isSystemApp, List<ConnectionRecord> connections, String? processState, String? adjLevel, bool hasServices, List<RamSourceInfo> ramSources, double cachedMemoryKb, List<ProcessEntry> processes, bool isCoreApp
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
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? services = null,Object? pids = null,Object? totalRamInKb = null,Object? isSystemApp = freezed,Object? connections = null,Object? processState = freezed,Object? adjLevel = freezed,Object? hasServices = null,Object? ramSources = null,Object? cachedMemoryKb = null,Object? processes = null,Object? isCoreApp = null,}) {
  return _then(_AppProcessInfo(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<RunningServiceInfo>,pids: null == pids ? _self._pids : pids // ignore: cast_nullable_to_non_nullable
as List<int>,totalRamInKb: null == totalRamInKb ? _self.totalRamInKb : totalRamInKb // ignore: cast_nullable_to_non_nullable
as double,isSystemApp: freezed == isSystemApp ? _self.isSystemApp : isSystemApp // ignore: cast_nullable_to_non_nullable
as bool?,connections: null == connections ? _self._connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectionRecord>,processState: freezed == processState ? _self.processState : processState // ignore: cast_nullable_to_non_nullable
as String?,adjLevel: freezed == adjLevel ? _self.adjLevel : adjLevel // ignore: cast_nullable_to_non_nullable
as String?,hasServices: null == hasServices ? _self.hasServices : hasServices // ignore: cast_nullable_to_non_nullable
as bool,ramSources: null == ramSources ? _self._ramSources : ramSources // ignore: cast_nullable_to_non_nullable
as List<RamSourceInfo>,cachedMemoryKb: null == cachedMemoryKb ? _self.cachedMemoryKb : cachedMemoryKb // ignore: cast_nullable_to_non_nullable
as double,processes: null == processes ? _self._processes : processes // ignore: cast_nullable_to_non_nullable
as List<ProcessEntry>,isCoreApp: null == isCoreApp ? _self.isCoreApp : isCoreApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RamSourceInfo {

 RamSourceType get source; double get ramKb; int? get pid; String? get processName;
/// Create a copy of RamSourceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RamSourceInfoCopyWith<RamSourceInfo> get copyWith => _$RamSourceInfoCopyWithImpl<RamSourceInfo>(this as RamSourceInfo, _$identity);

  /// Serializes this RamSourceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RamSourceInfo&&(identical(other.source, source) || other.source == source)&&(identical(other.ramKb, ramKb) || other.ramKb == ramKb)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.processName, processName) || other.processName == processName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,ramKb,pid,processName);

@override
String toString() {
  return 'RamSourceInfo(source: $source, ramKb: $ramKb, pid: $pid, processName: $processName)';
}


}

/// @nodoc
abstract mixin class $RamSourceInfoCopyWith<$Res>  {
  factory $RamSourceInfoCopyWith(RamSourceInfo value, $Res Function(RamSourceInfo) _then) = _$RamSourceInfoCopyWithImpl;
@useResult
$Res call({
 RamSourceType source, double ramKb, int? pid, String? processName
});




}
/// @nodoc
class _$RamSourceInfoCopyWithImpl<$Res>
    implements $RamSourceInfoCopyWith<$Res> {
  _$RamSourceInfoCopyWithImpl(this._self, this._then);

  final RamSourceInfo _self;
  final $Res Function(RamSourceInfo) _then;

/// Create a copy of RamSourceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? ramKb = null,Object? pid = freezed,Object? processName = freezed,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as RamSourceType,ramKb: null == ramKb ? _self.ramKb : ramKb // ignore: cast_nullable_to_non_nullable
as double,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,processName: freezed == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RamSourceInfo].
extension RamSourceInfoPatterns on RamSourceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RamSourceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RamSourceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RamSourceInfo value)  $default,){
final _that = this;
switch (_that) {
case _RamSourceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RamSourceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RamSourceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RamSourceType source,  double ramKb,  int? pid,  String? processName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RamSourceInfo() when $default != null:
return $default(_that.source,_that.ramKb,_that.pid,_that.processName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RamSourceType source,  double ramKb,  int? pid,  String? processName)  $default,) {final _that = this;
switch (_that) {
case _RamSourceInfo():
return $default(_that.source,_that.ramKb,_that.pid,_that.processName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RamSourceType source,  double ramKb,  int? pid,  String? processName)?  $default,) {final _that = this;
switch (_that) {
case _RamSourceInfo() when $default != null:
return $default(_that.source,_that.ramKb,_that.pid,_that.processName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RamSourceInfo implements RamSourceInfo {
  const _RamSourceInfo({required this.source, required this.ramKb, this.pid, this.processName});
  factory _RamSourceInfo.fromJson(Map<String, dynamic> json) => _$RamSourceInfoFromJson(json);

@override final  RamSourceType source;
@override final  double ramKb;
@override final  int? pid;
@override final  String? processName;

/// Create a copy of RamSourceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RamSourceInfoCopyWith<_RamSourceInfo> get copyWith => __$RamSourceInfoCopyWithImpl<_RamSourceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RamSourceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RamSourceInfo&&(identical(other.source, source) || other.source == source)&&(identical(other.ramKb, ramKb) || other.ramKb == ramKb)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.processName, processName) || other.processName == processName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,ramKb,pid,processName);

@override
String toString() {
  return 'RamSourceInfo(source: $source, ramKb: $ramKb, pid: $pid, processName: $processName)';
}


}

/// @nodoc
abstract mixin class _$RamSourceInfoCopyWith<$Res> implements $RamSourceInfoCopyWith<$Res> {
  factory _$RamSourceInfoCopyWith(_RamSourceInfo value, $Res Function(_RamSourceInfo) _then) = __$RamSourceInfoCopyWithImpl;
@override @useResult
$Res call({
 RamSourceType source, double ramKb, int? pid, String? processName
});




}
/// @nodoc
class __$RamSourceInfoCopyWithImpl<$Res>
    implements _$RamSourceInfoCopyWith<$Res> {
  __$RamSourceInfoCopyWithImpl(this._self, this._then);

  final _RamSourceInfo _self;
  final $Res Function(_RamSourceInfo) _then;

/// Create a copy of RamSourceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? ramKb = null,Object? pid = freezed,Object? processName = freezed,}) {
  return _then(_RamSourceInfo(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as RamSourceType,ramKb: null == ramKb ? _self.ramKb : ramKb // ignore: cast_nullable_to_non_nullable
as double,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,processName: freezed == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProcessEntry {

 String get processName; double get ramKb; int? get pid;
/// Create a copy of ProcessEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessEntryCopyWith<ProcessEntry> get copyWith => _$ProcessEntryCopyWithImpl<ProcessEntry>(this as ProcessEntry, _$identity);

  /// Serializes this ProcessEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessEntry&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.ramKb, ramKb) || other.ramKb == ramKb)&&(identical(other.pid, pid) || other.pid == pid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,processName,ramKb,pid);

@override
String toString() {
  return 'ProcessEntry(processName: $processName, ramKb: $ramKb, pid: $pid)';
}


}

/// @nodoc
abstract mixin class $ProcessEntryCopyWith<$Res>  {
  factory $ProcessEntryCopyWith(ProcessEntry value, $Res Function(ProcessEntry) _then) = _$ProcessEntryCopyWithImpl;
@useResult
$Res call({
 String processName, double ramKb, int? pid
});




}
/// @nodoc
class _$ProcessEntryCopyWithImpl<$Res>
    implements $ProcessEntryCopyWith<$Res> {
  _$ProcessEntryCopyWithImpl(this._self, this._then);

  final ProcessEntry _self;
  final $Res Function(ProcessEntry) _then;

/// Create a copy of ProcessEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? processName = null,Object? ramKb = null,Object? pid = freezed,}) {
  return _then(_self.copyWith(
processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,ramKb: null == ramKb ? _self.ramKb : ramKb // ignore: cast_nullable_to_non_nullable
as double,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessEntry].
extension ProcessEntryPatterns on ProcessEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessEntry value)  $default,){
final _that = this;
switch (_that) {
case _ProcessEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String processName,  double ramKb,  int? pid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessEntry() when $default != null:
return $default(_that.processName,_that.ramKb,_that.pid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String processName,  double ramKb,  int? pid)  $default,) {final _that = this;
switch (_that) {
case _ProcessEntry():
return $default(_that.processName,_that.ramKb,_that.pid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String processName,  double ramKb,  int? pid)?  $default,) {final _that = this;
switch (_that) {
case _ProcessEntry() when $default != null:
return $default(_that.processName,_that.ramKb,_that.pid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessEntry implements ProcessEntry {
  const _ProcessEntry({required this.processName, required this.ramKb, this.pid});
  factory _ProcessEntry.fromJson(Map<String, dynamic> json) => _$ProcessEntryFromJson(json);

@override final  String processName;
@override final  double ramKb;
@override final  int? pid;

/// Create a copy of ProcessEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessEntryCopyWith<_ProcessEntry> get copyWith => __$ProcessEntryCopyWithImpl<_ProcessEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessEntry&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.ramKb, ramKb) || other.ramKb == ramKb)&&(identical(other.pid, pid) || other.pid == pid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,processName,ramKb,pid);

@override
String toString() {
  return 'ProcessEntry(processName: $processName, ramKb: $ramKb, pid: $pid)';
}


}

/// @nodoc
abstract mixin class _$ProcessEntryCopyWith<$Res> implements $ProcessEntryCopyWith<$Res> {
  factory _$ProcessEntryCopyWith(_ProcessEntry value, $Res Function(_ProcessEntry) _then) = __$ProcessEntryCopyWithImpl;
@override @useResult
$Res call({
 String processName, double ramKb, int? pid
});




}
/// @nodoc
class __$ProcessEntryCopyWithImpl<$Res>
    implements _$ProcessEntryCopyWith<$Res> {
  __$ProcessEntryCopyWithImpl(this._self, this._then);

  final _ProcessEntry _self;
  final $Res Function(_ProcessEntry) _then;

/// Create a copy of ProcessEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? processName = null,Object? ramKb = null,Object? pid = freezed,}) {
  return _then(_ProcessEntry(
processName: null == processName ? _self.processName : processName // ignore: cast_nullable_to_non_nullable
as String,ramKb: null == ramKb ? _self.ramKb : ramKb // ignore: cast_nullable_to_non_nullable
as double,pid: freezed == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int?,
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

  /// Serializes this RunningProcessInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunningProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.importance, importance) || other.importance == importance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
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
@JsonSerializable()

class _RunningProcessInfo implements RunningProcessInfo {
  const _RunningProcessInfo({required this.packageName, required this.processName, required this.pid, required this.uid, this.appName, required this.isSystemApp, required this.importance});
  factory _RunningProcessInfo.fromJson(Map<String, dynamic> json) => _$RunningProcessInfoFromJson(json);

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
Map<String, dynamic> toJson() {
  return _$RunningProcessInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RunningProcessInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.processName, processName) || other.processName == processName)&&(identical(other.pid, pid) || other.pid == pid)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.isSystemApp, isSystemApp) || other.isSystemApp == isSystemApp)&&(identical(other.importance, importance) || other.importance == importance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
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


/// @nodoc
mixin _$ConnectionRecord {

 String get packageName; String get serviceName; String? get bindingPackage; String? get bindingProcess; String? get conn; String? get flags; bool? get isForeground; bool? get isVisible; bool? get hasCapabilities; String? get rawConnectionRecord;
/// Create a copy of ConnectionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionRecordCopyWith<ConnectionRecord> get copyWith => _$ConnectionRecordCopyWithImpl<ConnectionRecord>(this as ConnectionRecord, _$identity);

  /// Serializes this ConnectionRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionRecord&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.bindingPackage, bindingPackage) || other.bindingPackage == bindingPackage)&&(identical(other.bindingProcess, bindingProcess) || other.bindingProcess == bindingProcess)&&(identical(other.conn, conn) || other.conn == conn)&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.isForeground, isForeground) || other.isForeground == isForeground)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.hasCapabilities, hasCapabilities) || other.hasCapabilities == hasCapabilities)&&(identical(other.rawConnectionRecord, rawConnectionRecord) || other.rawConnectionRecord == rawConnectionRecord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,serviceName,bindingPackage,bindingProcess,conn,flags,isForeground,isVisible,hasCapabilities,rawConnectionRecord);

@override
String toString() {
  return 'ConnectionRecord(packageName: $packageName, serviceName: $serviceName, bindingPackage: $bindingPackage, bindingProcess: $bindingProcess, conn: $conn, flags: $flags, isForeground: $isForeground, isVisible: $isVisible, hasCapabilities: $hasCapabilities, rawConnectionRecord: $rawConnectionRecord)';
}


}

/// @nodoc
abstract mixin class $ConnectionRecordCopyWith<$Res>  {
  factory $ConnectionRecordCopyWith(ConnectionRecord value, $Res Function(ConnectionRecord) _then) = _$ConnectionRecordCopyWithImpl;
@useResult
$Res call({
 String packageName, String serviceName, String? bindingPackage, String? bindingProcess, String? conn, String? flags, bool? isForeground, bool? isVisible, bool? hasCapabilities, String? rawConnectionRecord
});




}
/// @nodoc
class _$ConnectionRecordCopyWithImpl<$Res>
    implements $ConnectionRecordCopyWith<$Res> {
  _$ConnectionRecordCopyWithImpl(this._self, this._then);

  final ConnectionRecord _self;
  final $Res Function(ConnectionRecord) _then;

/// Create a copy of ConnectionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? serviceName = null,Object? bindingPackage = freezed,Object? bindingProcess = freezed,Object? conn = freezed,Object? flags = freezed,Object? isForeground = freezed,Object? isVisible = freezed,Object? hasCapabilities = freezed,Object? rawConnectionRecord = freezed,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,bindingPackage: freezed == bindingPackage ? _self.bindingPackage : bindingPackage // ignore: cast_nullable_to_non_nullable
as String?,bindingProcess: freezed == bindingProcess ? _self.bindingProcess : bindingProcess // ignore: cast_nullable_to_non_nullable
as String?,conn: freezed == conn ? _self.conn : conn // ignore: cast_nullable_to_non_nullable
as String?,flags: freezed == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as String?,isForeground: freezed == isForeground ? _self.isForeground : isForeground // ignore: cast_nullable_to_non_nullable
as bool?,isVisible: freezed == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool?,hasCapabilities: freezed == hasCapabilities ? _self.hasCapabilities : hasCapabilities // ignore: cast_nullable_to_non_nullable
as bool?,rawConnectionRecord: freezed == rawConnectionRecord ? _self.rawConnectionRecord : rawConnectionRecord // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionRecord].
extension ConnectionRecordPatterns on ConnectionRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionRecord value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String serviceName,  String? bindingPackage,  String? bindingProcess,  String? conn,  String? flags,  bool? isForeground,  bool? isVisible,  bool? hasCapabilities,  String? rawConnectionRecord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionRecord() when $default != null:
return $default(_that.packageName,_that.serviceName,_that.bindingPackage,_that.bindingProcess,_that.conn,_that.flags,_that.isForeground,_that.isVisible,_that.hasCapabilities,_that.rawConnectionRecord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String serviceName,  String? bindingPackage,  String? bindingProcess,  String? conn,  String? flags,  bool? isForeground,  bool? isVisible,  bool? hasCapabilities,  String? rawConnectionRecord)  $default,) {final _that = this;
switch (_that) {
case _ConnectionRecord():
return $default(_that.packageName,_that.serviceName,_that.bindingPackage,_that.bindingProcess,_that.conn,_that.flags,_that.isForeground,_that.isVisible,_that.hasCapabilities,_that.rawConnectionRecord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String serviceName,  String? bindingPackage,  String? bindingProcess,  String? conn,  String? flags,  bool? isForeground,  bool? isVisible,  bool? hasCapabilities,  String? rawConnectionRecord)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionRecord() when $default != null:
return $default(_that.packageName,_that.serviceName,_that.bindingPackage,_that.bindingProcess,_that.conn,_that.flags,_that.isForeground,_that.isVisible,_that.hasCapabilities,_that.rawConnectionRecord);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionRecord implements ConnectionRecord {
  const _ConnectionRecord({required this.packageName, required this.serviceName, this.bindingPackage, this.bindingProcess, this.conn, this.flags, this.isForeground, this.isVisible, this.hasCapabilities, this.rawConnectionRecord});
  factory _ConnectionRecord.fromJson(Map<String, dynamic> json) => _$ConnectionRecordFromJson(json);

@override final  String packageName;
@override final  String serviceName;
@override final  String? bindingPackage;
@override final  String? bindingProcess;
@override final  String? conn;
@override final  String? flags;
@override final  bool? isForeground;
@override final  bool? isVisible;
@override final  bool? hasCapabilities;
@override final  String? rawConnectionRecord;

/// Create a copy of ConnectionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionRecordCopyWith<_ConnectionRecord> get copyWith => __$ConnectionRecordCopyWithImpl<_ConnectionRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionRecord&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.bindingPackage, bindingPackage) || other.bindingPackage == bindingPackage)&&(identical(other.bindingProcess, bindingProcess) || other.bindingProcess == bindingProcess)&&(identical(other.conn, conn) || other.conn == conn)&&(identical(other.flags, flags) || other.flags == flags)&&(identical(other.isForeground, isForeground) || other.isForeground == isForeground)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.hasCapabilities, hasCapabilities) || other.hasCapabilities == hasCapabilities)&&(identical(other.rawConnectionRecord, rawConnectionRecord) || other.rawConnectionRecord == rawConnectionRecord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,serviceName,bindingPackage,bindingProcess,conn,flags,isForeground,isVisible,hasCapabilities,rawConnectionRecord);

@override
String toString() {
  return 'ConnectionRecord(packageName: $packageName, serviceName: $serviceName, bindingPackage: $bindingPackage, bindingProcess: $bindingProcess, conn: $conn, flags: $flags, isForeground: $isForeground, isVisible: $isVisible, hasCapabilities: $hasCapabilities, rawConnectionRecord: $rawConnectionRecord)';
}


}

/// @nodoc
abstract mixin class _$ConnectionRecordCopyWith<$Res> implements $ConnectionRecordCopyWith<$Res> {
  factory _$ConnectionRecordCopyWith(_ConnectionRecord value, $Res Function(_ConnectionRecord) _then) = __$ConnectionRecordCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String serviceName, String? bindingPackage, String? bindingProcess, String? conn, String? flags, bool? isForeground, bool? isVisible, bool? hasCapabilities, String? rawConnectionRecord
});




}
/// @nodoc
class __$ConnectionRecordCopyWithImpl<$Res>
    implements _$ConnectionRecordCopyWith<$Res> {
  __$ConnectionRecordCopyWithImpl(this._self, this._then);

  final _ConnectionRecord _self;
  final $Res Function(_ConnectionRecord) _then;

/// Create a copy of ConnectionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? serviceName = null,Object? bindingPackage = freezed,Object? bindingProcess = freezed,Object? conn = freezed,Object? flags = freezed,Object? isForeground = freezed,Object? isVisible = freezed,Object? hasCapabilities = freezed,Object? rawConnectionRecord = freezed,}) {
  return _then(_ConnectionRecord(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,bindingPackage: freezed == bindingPackage ? _self.bindingPackage : bindingPackage // ignore: cast_nullable_to_non_nullable
as String?,bindingProcess: freezed == bindingProcess ? _self.bindingProcess : bindingProcess // ignore: cast_nullable_to_non_nullable
as String?,conn: freezed == conn ? _self.conn : conn // ignore: cast_nullable_to_non_nullable
as String?,flags: freezed == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as String?,isForeground: freezed == isForeground ? _self.isForeground : isForeground // ignore: cast_nullable_to_non_nullable
as bool?,isVisible: freezed == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool?,hasCapabilities: freezed == hasCapabilities ? _self.hasCapabilities : hasCapabilities // ignore: cast_nullable_to_non_nullable
as bool?,rawConnectionRecord: freezed == rawConnectionRecord ? _self.rawConnectionRecord : rawConnectionRecord // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
