// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meminfo_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemInfoData {

 String get packageName; String get rawOutput; int get pid; List<MemInfoCategory> get categories; MemInfoTotal? get total; AppSummary? get appSummary; ObjectsInfo? get objects; NativeAllocations? get nativeAllocations;
/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemInfoDataCopyWith<MemInfoData> get copyWith => _$MemInfoDataCopyWithImpl<MemInfoData>(this as MemInfoData, _$identity);

  /// Serializes this MemInfoData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemInfoData&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.rawOutput, rawOutput) || other.rawOutput == rawOutput)&&(identical(other.pid, pid) || other.pid == pid)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.total, total) || other.total == total)&&(identical(other.appSummary, appSummary) || other.appSummary == appSummary)&&(identical(other.objects, objects) || other.objects == objects)&&(identical(other.nativeAllocations, nativeAllocations) || other.nativeAllocations == nativeAllocations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,rawOutput,pid,const DeepCollectionEquality().hash(categories),total,appSummary,objects,nativeAllocations);

@override
String toString() {
  return 'MemInfoData(packageName: $packageName, rawOutput: $rawOutput, pid: $pid, categories: $categories, total: $total, appSummary: $appSummary, objects: $objects, nativeAllocations: $nativeAllocations)';
}


}

/// @nodoc
abstract mixin class $MemInfoDataCopyWith<$Res>  {
  factory $MemInfoDataCopyWith(MemInfoData value, $Res Function(MemInfoData) _then) = _$MemInfoDataCopyWithImpl;
@useResult
$Res call({
 String packageName, String rawOutput, int pid, List<MemInfoCategory> categories, MemInfoTotal? total, AppSummary? appSummary, ObjectsInfo? objects, NativeAllocations? nativeAllocations
});


$MemInfoTotalCopyWith<$Res>? get total;$AppSummaryCopyWith<$Res>? get appSummary;$ObjectsInfoCopyWith<$Res>? get objects;$NativeAllocationsCopyWith<$Res>? get nativeAllocations;

}
/// @nodoc
class _$MemInfoDataCopyWithImpl<$Res>
    implements $MemInfoDataCopyWith<$Res> {
  _$MemInfoDataCopyWithImpl(this._self, this._then);

  final MemInfoData _self;
  final $Res Function(MemInfoData) _then;

/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? rawOutput = null,Object? pid = null,Object? categories = null,Object? total = freezed,Object? appSummary = freezed,Object? objects = freezed,Object? nativeAllocations = freezed,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,rawOutput: null == rawOutput ? _self.rawOutput : rawOutput // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<MemInfoCategory>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as MemInfoTotal?,appSummary: freezed == appSummary ? _self.appSummary : appSummary // ignore: cast_nullable_to_non_nullable
as AppSummary?,objects: freezed == objects ? _self.objects : objects // ignore: cast_nullable_to_non_nullable
as ObjectsInfo?,nativeAllocations: freezed == nativeAllocations ? _self.nativeAllocations : nativeAllocations // ignore: cast_nullable_to_non_nullable
as NativeAllocations?,
  ));
}
/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoTotalCopyWith<$Res>? get total {
    if (_self.total == null) {
    return null;
  }

  return $MemInfoTotalCopyWith<$Res>(_self.total!, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSummaryCopyWith<$Res>? get appSummary {
    if (_self.appSummary == null) {
    return null;
  }

  return $AppSummaryCopyWith<$Res>(_self.appSummary!, (value) {
    return _then(_self.copyWith(appSummary: value));
  });
}/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectsInfoCopyWith<$Res>? get objects {
    if (_self.objects == null) {
    return null;
  }

  return $ObjectsInfoCopyWith<$Res>(_self.objects!, (value) {
    return _then(_self.copyWith(objects: value));
  });
}/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NativeAllocationsCopyWith<$Res>? get nativeAllocations {
    if (_self.nativeAllocations == null) {
    return null;
  }

  return $NativeAllocationsCopyWith<$Res>(_self.nativeAllocations!, (value) {
    return _then(_self.copyWith(nativeAllocations: value));
  });
}
}


/// Adds pattern-matching-related methods to [MemInfoData].
extension MemInfoDataPatterns on MemInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemInfoData value)  $default,){
final _that = this;
switch (_that) {
case _MemInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _MemInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String rawOutput,  int pid,  List<MemInfoCategory> categories,  MemInfoTotal? total,  AppSummary? appSummary,  ObjectsInfo? objects,  NativeAllocations? nativeAllocations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemInfoData() when $default != null:
return $default(_that.packageName,_that.rawOutput,_that.pid,_that.categories,_that.total,_that.appSummary,_that.objects,_that.nativeAllocations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String rawOutput,  int pid,  List<MemInfoCategory> categories,  MemInfoTotal? total,  AppSummary? appSummary,  ObjectsInfo? objects,  NativeAllocations? nativeAllocations)  $default,) {final _that = this;
switch (_that) {
case _MemInfoData():
return $default(_that.packageName,_that.rawOutput,_that.pid,_that.categories,_that.total,_that.appSummary,_that.objects,_that.nativeAllocations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String rawOutput,  int pid,  List<MemInfoCategory> categories,  MemInfoTotal? total,  AppSummary? appSummary,  ObjectsInfo? objects,  NativeAllocations? nativeAllocations)?  $default,) {final _that = this;
switch (_that) {
case _MemInfoData() when $default != null:
return $default(_that.packageName,_that.rawOutput,_that.pid,_that.categories,_that.total,_that.appSummary,_that.objects,_that.nativeAllocations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemInfoData implements MemInfoData {
  const _MemInfoData({required this.packageName, required this.rawOutput, required this.pid, final  List<MemInfoCategory> categories = const [], this.total, this.appSummary, this.objects, this.nativeAllocations}): _categories = categories;
  factory _MemInfoData.fromJson(Map<String, dynamic> json) => _$MemInfoDataFromJson(json);

@override final  String packageName;
@override final  String rawOutput;
@override final  int pid;
 final  List<MemInfoCategory> _categories;
@override@JsonKey() List<MemInfoCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  MemInfoTotal? total;
@override final  AppSummary? appSummary;
@override final  ObjectsInfo? objects;
@override final  NativeAllocations? nativeAllocations;

/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemInfoDataCopyWith<_MemInfoData> get copyWith => __$MemInfoDataCopyWithImpl<_MemInfoData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemInfoDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemInfoData&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.rawOutput, rawOutput) || other.rawOutput == rawOutput)&&(identical(other.pid, pid) || other.pid == pid)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.total, total) || other.total == total)&&(identical(other.appSummary, appSummary) || other.appSummary == appSummary)&&(identical(other.objects, objects) || other.objects == objects)&&(identical(other.nativeAllocations, nativeAllocations) || other.nativeAllocations == nativeAllocations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,rawOutput,pid,const DeepCollectionEquality().hash(_categories),total,appSummary,objects,nativeAllocations);

@override
String toString() {
  return 'MemInfoData(packageName: $packageName, rawOutput: $rawOutput, pid: $pid, categories: $categories, total: $total, appSummary: $appSummary, objects: $objects, nativeAllocations: $nativeAllocations)';
}


}

/// @nodoc
abstract mixin class _$MemInfoDataCopyWith<$Res> implements $MemInfoDataCopyWith<$Res> {
  factory _$MemInfoDataCopyWith(_MemInfoData value, $Res Function(_MemInfoData) _then) = __$MemInfoDataCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String rawOutput, int pid, List<MemInfoCategory> categories, MemInfoTotal? total, AppSummary? appSummary, ObjectsInfo? objects, NativeAllocations? nativeAllocations
});


@override $MemInfoTotalCopyWith<$Res>? get total;@override $AppSummaryCopyWith<$Res>? get appSummary;@override $ObjectsInfoCopyWith<$Res>? get objects;@override $NativeAllocationsCopyWith<$Res>? get nativeAllocations;

}
/// @nodoc
class __$MemInfoDataCopyWithImpl<$Res>
    implements _$MemInfoDataCopyWith<$Res> {
  __$MemInfoDataCopyWithImpl(this._self, this._then);

  final _MemInfoData _self;
  final $Res Function(_MemInfoData) _then;

/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? rawOutput = null,Object? pid = null,Object? categories = null,Object? total = freezed,Object? appSummary = freezed,Object? objects = freezed,Object? nativeAllocations = freezed,}) {
  return _then(_MemInfoData(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,rawOutput: null == rawOutput ? _self.rawOutput : rawOutput // ignore: cast_nullable_to_non_nullable
as String,pid: null == pid ? _self.pid : pid // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MemInfoCategory>,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as MemInfoTotal?,appSummary: freezed == appSummary ? _self.appSummary : appSummary // ignore: cast_nullable_to_non_nullable
as AppSummary?,objects: freezed == objects ? _self.objects : objects // ignore: cast_nullable_to_non_nullable
as ObjectsInfo?,nativeAllocations: freezed == nativeAllocations ? _self.nativeAllocations : nativeAllocations // ignore: cast_nullable_to_non_nullable
as NativeAllocations?,
  ));
}

/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemInfoTotalCopyWith<$Res>? get total {
    if (_self.total == null) {
    return null;
  }

  return $MemInfoTotalCopyWith<$Res>(_self.total!, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSummaryCopyWith<$Res>? get appSummary {
    if (_self.appSummary == null) {
    return null;
  }

  return $AppSummaryCopyWith<$Res>(_self.appSummary!, (value) {
    return _then(_self.copyWith(appSummary: value));
  });
}/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectsInfoCopyWith<$Res>? get objects {
    if (_self.objects == null) {
    return null;
  }

  return $ObjectsInfoCopyWith<$Res>(_self.objects!, (value) {
    return _then(_self.copyWith(objects: value));
  });
}/// Create a copy of MemInfoData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NativeAllocationsCopyWith<$Res>? get nativeAllocations {
    if (_self.nativeAllocations == null) {
    return null;
  }

  return $NativeAllocationsCopyWith<$Res>(_self.nativeAllocations!, (value) {
    return _then(_self.copyWith(nativeAllocations: value));
  });
}
}


/// @nodoc
mixin _$MemInfoCategory {

 String get name; int get pssTotal; int get privateDirty; int get privateClean; int get swapPssDirty; int get rssTotal; int? get heapSize; int? get heapAlloc; int? get heapFree;
/// Create a copy of MemInfoCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemInfoCategoryCopyWith<MemInfoCategory> get copyWith => _$MemInfoCategoryCopyWithImpl<MemInfoCategory>(this as MemInfoCategory, _$identity);

  /// Serializes this MemInfoCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemInfoCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.pssTotal, pssTotal) || other.pssTotal == pssTotal)&&(identical(other.privateDirty, privateDirty) || other.privateDirty == privateDirty)&&(identical(other.privateClean, privateClean) || other.privateClean == privateClean)&&(identical(other.swapPssDirty, swapPssDirty) || other.swapPssDirty == swapPssDirty)&&(identical(other.rssTotal, rssTotal) || other.rssTotal == rssTotal)&&(identical(other.heapSize, heapSize) || other.heapSize == heapSize)&&(identical(other.heapAlloc, heapAlloc) || other.heapAlloc == heapAlloc)&&(identical(other.heapFree, heapFree) || other.heapFree == heapFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pssTotal,privateDirty,privateClean,swapPssDirty,rssTotal,heapSize,heapAlloc,heapFree);

@override
String toString() {
  return 'MemInfoCategory(name: $name, pssTotal: $pssTotal, privateDirty: $privateDirty, privateClean: $privateClean, swapPssDirty: $swapPssDirty, rssTotal: $rssTotal, heapSize: $heapSize, heapAlloc: $heapAlloc, heapFree: $heapFree)';
}


}

/// @nodoc
abstract mixin class $MemInfoCategoryCopyWith<$Res>  {
  factory $MemInfoCategoryCopyWith(MemInfoCategory value, $Res Function(MemInfoCategory) _then) = _$MemInfoCategoryCopyWithImpl;
@useResult
$Res call({
 String name, int pssTotal, int privateDirty, int privateClean, int swapPssDirty, int rssTotal, int? heapSize, int? heapAlloc, int? heapFree
});




}
/// @nodoc
class _$MemInfoCategoryCopyWithImpl<$Res>
    implements $MemInfoCategoryCopyWith<$Res> {
  _$MemInfoCategoryCopyWithImpl(this._self, this._then);

  final MemInfoCategory _self;
  final $Res Function(MemInfoCategory) _then;

/// Create a copy of MemInfoCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pssTotal = null,Object? privateDirty = null,Object? privateClean = null,Object? swapPssDirty = null,Object? rssTotal = null,Object? heapSize = freezed,Object? heapAlloc = freezed,Object? heapFree = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pssTotal: null == pssTotal ? _self.pssTotal : pssTotal // ignore: cast_nullable_to_non_nullable
as int,privateDirty: null == privateDirty ? _self.privateDirty : privateDirty // ignore: cast_nullable_to_non_nullable
as int,privateClean: null == privateClean ? _self.privateClean : privateClean // ignore: cast_nullable_to_non_nullable
as int,swapPssDirty: null == swapPssDirty ? _self.swapPssDirty : swapPssDirty // ignore: cast_nullable_to_non_nullable
as int,rssTotal: null == rssTotal ? _self.rssTotal : rssTotal // ignore: cast_nullable_to_non_nullable
as int,heapSize: freezed == heapSize ? _self.heapSize : heapSize // ignore: cast_nullable_to_non_nullable
as int?,heapAlloc: freezed == heapAlloc ? _self.heapAlloc : heapAlloc // ignore: cast_nullable_to_non_nullable
as int?,heapFree: freezed == heapFree ? _self.heapFree : heapFree // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MemInfoCategory].
extension MemInfoCategoryPatterns on MemInfoCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemInfoCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemInfoCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemInfoCategory value)  $default,){
final _that = this;
switch (_that) {
case _MemInfoCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemInfoCategory value)?  $default,){
final _that = this;
switch (_that) {
case _MemInfoCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int pssTotal,  int privateDirty,  int privateClean,  int swapPssDirty,  int rssTotal,  int? heapSize,  int? heapAlloc,  int? heapFree)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemInfoCategory() when $default != null:
return $default(_that.name,_that.pssTotal,_that.privateDirty,_that.privateClean,_that.swapPssDirty,_that.rssTotal,_that.heapSize,_that.heapAlloc,_that.heapFree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int pssTotal,  int privateDirty,  int privateClean,  int swapPssDirty,  int rssTotal,  int? heapSize,  int? heapAlloc,  int? heapFree)  $default,) {final _that = this;
switch (_that) {
case _MemInfoCategory():
return $default(_that.name,_that.pssTotal,_that.privateDirty,_that.privateClean,_that.swapPssDirty,_that.rssTotal,_that.heapSize,_that.heapAlloc,_that.heapFree);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int pssTotal,  int privateDirty,  int privateClean,  int swapPssDirty,  int rssTotal,  int? heapSize,  int? heapAlloc,  int? heapFree)?  $default,) {final _that = this;
switch (_that) {
case _MemInfoCategory() when $default != null:
return $default(_that.name,_that.pssTotal,_that.privateDirty,_that.privateClean,_that.swapPssDirty,_that.rssTotal,_that.heapSize,_that.heapAlloc,_that.heapFree);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemInfoCategory implements MemInfoCategory {
  const _MemInfoCategory({required this.name, required this.pssTotal, this.privateDirty = 0, this.privateClean = 0, this.swapPssDirty = 0, this.rssTotal = 0, this.heapSize, this.heapAlloc, this.heapFree});
  factory _MemInfoCategory.fromJson(Map<String, dynamic> json) => _$MemInfoCategoryFromJson(json);

@override final  String name;
@override final  int pssTotal;
@override@JsonKey() final  int privateDirty;
@override@JsonKey() final  int privateClean;
@override@JsonKey() final  int swapPssDirty;
@override@JsonKey() final  int rssTotal;
@override final  int? heapSize;
@override final  int? heapAlloc;
@override final  int? heapFree;

/// Create a copy of MemInfoCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemInfoCategoryCopyWith<_MemInfoCategory> get copyWith => __$MemInfoCategoryCopyWithImpl<_MemInfoCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemInfoCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemInfoCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.pssTotal, pssTotal) || other.pssTotal == pssTotal)&&(identical(other.privateDirty, privateDirty) || other.privateDirty == privateDirty)&&(identical(other.privateClean, privateClean) || other.privateClean == privateClean)&&(identical(other.swapPssDirty, swapPssDirty) || other.swapPssDirty == swapPssDirty)&&(identical(other.rssTotal, rssTotal) || other.rssTotal == rssTotal)&&(identical(other.heapSize, heapSize) || other.heapSize == heapSize)&&(identical(other.heapAlloc, heapAlloc) || other.heapAlloc == heapAlloc)&&(identical(other.heapFree, heapFree) || other.heapFree == heapFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pssTotal,privateDirty,privateClean,swapPssDirty,rssTotal,heapSize,heapAlloc,heapFree);

@override
String toString() {
  return 'MemInfoCategory(name: $name, pssTotal: $pssTotal, privateDirty: $privateDirty, privateClean: $privateClean, swapPssDirty: $swapPssDirty, rssTotal: $rssTotal, heapSize: $heapSize, heapAlloc: $heapAlloc, heapFree: $heapFree)';
}


}

/// @nodoc
abstract mixin class _$MemInfoCategoryCopyWith<$Res> implements $MemInfoCategoryCopyWith<$Res> {
  factory _$MemInfoCategoryCopyWith(_MemInfoCategory value, $Res Function(_MemInfoCategory) _then) = __$MemInfoCategoryCopyWithImpl;
@override @useResult
$Res call({
 String name, int pssTotal, int privateDirty, int privateClean, int swapPssDirty, int rssTotal, int? heapSize, int? heapAlloc, int? heapFree
});




}
/// @nodoc
class __$MemInfoCategoryCopyWithImpl<$Res>
    implements _$MemInfoCategoryCopyWith<$Res> {
  __$MemInfoCategoryCopyWithImpl(this._self, this._then);

  final _MemInfoCategory _self;
  final $Res Function(_MemInfoCategory) _then;

/// Create a copy of MemInfoCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pssTotal = null,Object? privateDirty = null,Object? privateClean = null,Object? swapPssDirty = null,Object? rssTotal = null,Object? heapSize = freezed,Object? heapAlloc = freezed,Object? heapFree = freezed,}) {
  return _then(_MemInfoCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pssTotal: null == pssTotal ? _self.pssTotal : pssTotal // ignore: cast_nullable_to_non_nullable
as int,privateDirty: null == privateDirty ? _self.privateDirty : privateDirty // ignore: cast_nullable_to_non_nullable
as int,privateClean: null == privateClean ? _self.privateClean : privateClean // ignore: cast_nullable_to_non_nullable
as int,swapPssDirty: null == swapPssDirty ? _self.swapPssDirty : swapPssDirty // ignore: cast_nullable_to_non_nullable
as int,rssTotal: null == rssTotal ? _self.rssTotal : rssTotal // ignore: cast_nullable_to_non_nullable
as int,heapSize: freezed == heapSize ? _self.heapSize : heapSize // ignore: cast_nullable_to_non_nullable
as int?,heapAlloc: freezed == heapAlloc ? _self.heapAlloc : heapAlloc // ignore: cast_nullable_to_non_nullable
as int?,heapFree: freezed == heapFree ? _self.heapFree : heapFree // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MemInfoTotal {

 int get pssTotal; int get privateDirty; int get privateClean; int get swapPssDirty; int get rssTotal; int get heapSize; int get heapAlloc; int get heapFree;
/// Create a copy of MemInfoTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemInfoTotalCopyWith<MemInfoTotal> get copyWith => _$MemInfoTotalCopyWithImpl<MemInfoTotal>(this as MemInfoTotal, _$identity);

  /// Serializes this MemInfoTotal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemInfoTotal&&(identical(other.pssTotal, pssTotal) || other.pssTotal == pssTotal)&&(identical(other.privateDirty, privateDirty) || other.privateDirty == privateDirty)&&(identical(other.privateClean, privateClean) || other.privateClean == privateClean)&&(identical(other.swapPssDirty, swapPssDirty) || other.swapPssDirty == swapPssDirty)&&(identical(other.rssTotal, rssTotal) || other.rssTotal == rssTotal)&&(identical(other.heapSize, heapSize) || other.heapSize == heapSize)&&(identical(other.heapAlloc, heapAlloc) || other.heapAlloc == heapAlloc)&&(identical(other.heapFree, heapFree) || other.heapFree == heapFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pssTotal,privateDirty,privateClean,swapPssDirty,rssTotal,heapSize,heapAlloc,heapFree);

@override
String toString() {
  return 'MemInfoTotal(pssTotal: $pssTotal, privateDirty: $privateDirty, privateClean: $privateClean, swapPssDirty: $swapPssDirty, rssTotal: $rssTotal, heapSize: $heapSize, heapAlloc: $heapAlloc, heapFree: $heapFree)';
}


}

/// @nodoc
abstract mixin class $MemInfoTotalCopyWith<$Res>  {
  factory $MemInfoTotalCopyWith(MemInfoTotal value, $Res Function(MemInfoTotal) _then) = _$MemInfoTotalCopyWithImpl;
@useResult
$Res call({
 int pssTotal, int privateDirty, int privateClean, int swapPssDirty, int rssTotal, int heapSize, int heapAlloc, int heapFree
});




}
/// @nodoc
class _$MemInfoTotalCopyWithImpl<$Res>
    implements $MemInfoTotalCopyWith<$Res> {
  _$MemInfoTotalCopyWithImpl(this._self, this._then);

  final MemInfoTotal _self;
  final $Res Function(MemInfoTotal) _then;

/// Create a copy of MemInfoTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pssTotal = null,Object? privateDirty = null,Object? privateClean = null,Object? swapPssDirty = null,Object? rssTotal = null,Object? heapSize = null,Object? heapAlloc = null,Object? heapFree = null,}) {
  return _then(_self.copyWith(
pssTotal: null == pssTotal ? _self.pssTotal : pssTotal // ignore: cast_nullable_to_non_nullable
as int,privateDirty: null == privateDirty ? _self.privateDirty : privateDirty // ignore: cast_nullable_to_non_nullable
as int,privateClean: null == privateClean ? _self.privateClean : privateClean // ignore: cast_nullable_to_non_nullable
as int,swapPssDirty: null == swapPssDirty ? _self.swapPssDirty : swapPssDirty // ignore: cast_nullable_to_non_nullable
as int,rssTotal: null == rssTotal ? _self.rssTotal : rssTotal // ignore: cast_nullable_to_non_nullable
as int,heapSize: null == heapSize ? _self.heapSize : heapSize // ignore: cast_nullable_to_non_nullable
as int,heapAlloc: null == heapAlloc ? _self.heapAlloc : heapAlloc // ignore: cast_nullable_to_non_nullable
as int,heapFree: null == heapFree ? _self.heapFree : heapFree // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MemInfoTotal].
extension MemInfoTotalPatterns on MemInfoTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemInfoTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemInfoTotal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemInfoTotal value)  $default,){
final _that = this;
switch (_that) {
case _MemInfoTotal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemInfoTotal value)?  $default,){
final _that = this;
switch (_that) {
case _MemInfoTotal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pssTotal,  int privateDirty,  int privateClean,  int swapPssDirty,  int rssTotal,  int heapSize,  int heapAlloc,  int heapFree)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemInfoTotal() when $default != null:
return $default(_that.pssTotal,_that.privateDirty,_that.privateClean,_that.swapPssDirty,_that.rssTotal,_that.heapSize,_that.heapAlloc,_that.heapFree);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pssTotal,  int privateDirty,  int privateClean,  int swapPssDirty,  int rssTotal,  int heapSize,  int heapAlloc,  int heapFree)  $default,) {final _that = this;
switch (_that) {
case _MemInfoTotal():
return $default(_that.pssTotal,_that.privateDirty,_that.privateClean,_that.swapPssDirty,_that.rssTotal,_that.heapSize,_that.heapAlloc,_that.heapFree);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pssTotal,  int privateDirty,  int privateClean,  int swapPssDirty,  int rssTotal,  int heapSize,  int heapAlloc,  int heapFree)?  $default,) {final _that = this;
switch (_that) {
case _MemInfoTotal() when $default != null:
return $default(_that.pssTotal,_that.privateDirty,_that.privateClean,_that.swapPssDirty,_that.rssTotal,_that.heapSize,_that.heapAlloc,_that.heapFree);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemInfoTotal implements MemInfoTotal {
  const _MemInfoTotal({required this.pssTotal, required this.privateDirty, required this.privateClean, required this.swapPssDirty, required this.rssTotal, required this.heapSize, required this.heapAlloc, required this.heapFree});
  factory _MemInfoTotal.fromJson(Map<String, dynamic> json) => _$MemInfoTotalFromJson(json);

@override final  int pssTotal;
@override final  int privateDirty;
@override final  int privateClean;
@override final  int swapPssDirty;
@override final  int rssTotal;
@override final  int heapSize;
@override final  int heapAlloc;
@override final  int heapFree;

/// Create a copy of MemInfoTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemInfoTotalCopyWith<_MemInfoTotal> get copyWith => __$MemInfoTotalCopyWithImpl<_MemInfoTotal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemInfoTotalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemInfoTotal&&(identical(other.pssTotal, pssTotal) || other.pssTotal == pssTotal)&&(identical(other.privateDirty, privateDirty) || other.privateDirty == privateDirty)&&(identical(other.privateClean, privateClean) || other.privateClean == privateClean)&&(identical(other.swapPssDirty, swapPssDirty) || other.swapPssDirty == swapPssDirty)&&(identical(other.rssTotal, rssTotal) || other.rssTotal == rssTotal)&&(identical(other.heapSize, heapSize) || other.heapSize == heapSize)&&(identical(other.heapAlloc, heapAlloc) || other.heapAlloc == heapAlloc)&&(identical(other.heapFree, heapFree) || other.heapFree == heapFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pssTotal,privateDirty,privateClean,swapPssDirty,rssTotal,heapSize,heapAlloc,heapFree);

@override
String toString() {
  return 'MemInfoTotal(pssTotal: $pssTotal, privateDirty: $privateDirty, privateClean: $privateClean, swapPssDirty: $swapPssDirty, rssTotal: $rssTotal, heapSize: $heapSize, heapAlloc: $heapAlloc, heapFree: $heapFree)';
}


}

/// @nodoc
abstract mixin class _$MemInfoTotalCopyWith<$Res> implements $MemInfoTotalCopyWith<$Res> {
  factory _$MemInfoTotalCopyWith(_MemInfoTotal value, $Res Function(_MemInfoTotal) _then) = __$MemInfoTotalCopyWithImpl;
@override @useResult
$Res call({
 int pssTotal, int privateDirty, int privateClean, int swapPssDirty, int rssTotal, int heapSize, int heapAlloc, int heapFree
});




}
/// @nodoc
class __$MemInfoTotalCopyWithImpl<$Res>
    implements _$MemInfoTotalCopyWith<$Res> {
  __$MemInfoTotalCopyWithImpl(this._self, this._then);

  final _MemInfoTotal _self;
  final $Res Function(_MemInfoTotal) _then;

/// Create a copy of MemInfoTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pssTotal = null,Object? privateDirty = null,Object? privateClean = null,Object? swapPssDirty = null,Object? rssTotal = null,Object? heapSize = null,Object? heapAlloc = null,Object? heapFree = null,}) {
  return _then(_MemInfoTotal(
pssTotal: null == pssTotal ? _self.pssTotal : pssTotal // ignore: cast_nullable_to_non_nullable
as int,privateDirty: null == privateDirty ? _self.privateDirty : privateDirty // ignore: cast_nullable_to_non_nullable
as int,privateClean: null == privateClean ? _self.privateClean : privateClean // ignore: cast_nullable_to_non_nullable
as int,swapPssDirty: null == swapPssDirty ? _self.swapPssDirty : swapPssDirty // ignore: cast_nullable_to_non_nullable
as int,rssTotal: null == rssTotal ? _self.rssTotal : rssTotal // ignore: cast_nullable_to_non_nullable
as int,heapSize: null == heapSize ? _self.heapSize : heapSize // ignore: cast_nullable_to_non_nullable
as int,heapAlloc: null == heapAlloc ? _self.heapAlloc : heapAlloc // ignore: cast_nullable_to_non_nullable
as int,heapFree: null == heapFree ? _self.heapFree : heapFree // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AppSummary {

 int get javaHeapPss; int get javaHeapRss; int get nativeHeapPss; int get nativeHeapRss; int get codePss; int get codeRss; int get stackPss; int get stackRss; int get graphicsPss; int get graphicsRss; int get privateOther; int get system; int get unknownRss; int get totalPss; int get totalRss; int get totalSwapPss;
/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSummaryCopyWith<AppSummary> get copyWith => _$AppSummaryCopyWithImpl<AppSummary>(this as AppSummary, _$identity);

  /// Serializes this AppSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSummary&&(identical(other.javaHeapPss, javaHeapPss) || other.javaHeapPss == javaHeapPss)&&(identical(other.javaHeapRss, javaHeapRss) || other.javaHeapRss == javaHeapRss)&&(identical(other.nativeHeapPss, nativeHeapPss) || other.nativeHeapPss == nativeHeapPss)&&(identical(other.nativeHeapRss, nativeHeapRss) || other.nativeHeapRss == nativeHeapRss)&&(identical(other.codePss, codePss) || other.codePss == codePss)&&(identical(other.codeRss, codeRss) || other.codeRss == codeRss)&&(identical(other.stackPss, stackPss) || other.stackPss == stackPss)&&(identical(other.stackRss, stackRss) || other.stackRss == stackRss)&&(identical(other.graphicsPss, graphicsPss) || other.graphicsPss == graphicsPss)&&(identical(other.graphicsRss, graphicsRss) || other.graphicsRss == graphicsRss)&&(identical(other.privateOther, privateOther) || other.privateOther == privateOther)&&(identical(other.system, system) || other.system == system)&&(identical(other.unknownRss, unknownRss) || other.unknownRss == unknownRss)&&(identical(other.totalPss, totalPss) || other.totalPss == totalPss)&&(identical(other.totalRss, totalRss) || other.totalRss == totalRss)&&(identical(other.totalSwapPss, totalSwapPss) || other.totalSwapPss == totalSwapPss));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,javaHeapPss,javaHeapRss,nativeHeapPss,nativeHeapRss,codePss,codeRss,stackPss,stackRss,graphicsPss,graphicsRss,privateOther,system,unknownRss,totalPss,totalRss,totalSwapPss);

@override
String toString() {
  return 'AppSummary(javaHeapPss: $javaHeapPss, javaHeapRss: $javaHeapRss, nativeHeapPss: $nativeHeapPss, nativeHeapRss: $nativeHeapRss, codePss: $codePss, codeRss: $codeRss, stackPss: $stackPss, stackRss: $stackRss, graphicsPss: $graphicsPss, graphicsRss: $graphicsRss, privateOther: $privateOther, system: $system, unknownRss: $unknownRss, totalPss: $totalPss, totalRss: $totalRss, totalSwapPss: $totalSwapPss)';
}


}

/// @nodoc
abstract mixin class $AppSummaryCopyWith<$Res>  {
  factory $AppSummaryCopyWith(AppSummary value, $Res Function(AppSummary) _then) = _$AppSummaryCopyWithImpl;
@useResult
$Res call({
 int javaHeapPss, int javaHeapRss, int nativeHeapPss, int nativeHeapRss, int codePss, int codeRss, int stackPss, int stackRss, int graphicsPss, int graphicsRss, int privateOther, int system, int unknownRss, int totalPss, int totalRss, int totalSwapPss
});




}
/// @nodoc
class _$AppSummaryCopyWithImpl<$Res>
    implements $AppSummaryCopyWith<$Res> {
  _$AppSummaryCopyWithImpl(this._self, this._then);

  final AppSummary _self;
  final $Res Function(AppSummary) _then;

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? javaHeapPss = null,Object? javaHeapRss = null,Object? nativeHeapPss = null,Object? nativeHeapRss = null,Object? codePss = null,Object? codeRss = null,Object? stackPss = null,Object? stackRss = null,Object? graphicsPss = null,Object? graphicsRss = null,Object? privateOther = null,Object? system = null,Object? unknownRss = null,Object? totalPss = null,Object? totalRss = null,Object? totalSwapPss = null,}) {
  return _then(_self.copyWith(
javaHeapPss: null == javaHeapPss ? _self.javaHeapPss : javaHeapPss // ignore: cast_nullable_to_non_nullable
as int,javaHeapRss: null == javaHeapRss ? _self.javaHeapRss : javaHeapRss // ignore: cast_nullable_to_non_nullable
as int,nativeHeapPss: null == nativeHeapPss ? _self.nativeHeapPss : nativeHeapPss // ignore: cast_nullable_to_non_nullable
as int,nativeHeapRss: null == nativeHeapRss ? _self.nativeHeapRss : nativeHeapRss // ignore: cast_nullable_to_non_nullable
as int,codePss: null == codePss ? _self.codePss : codePss // ignore: cast_nullable_to_non_nullable
as int,codeRss: null == codeRss ? _self.codeRss : codeRss // ignore: cast_nullable_to_non_nullable
as int,stackPss: null == stackPss ? _self.stackPss : stackPss // ignore: cast_nullable_to_non_nullable
as int,stackRss: null == stackRss ? _self.stackRss : stackRss // ignore: cast_nullable_to_non_nullable
as int,graphicsPss: null == graphicsPss ? _self.graphicsPss : graphicsPss // ignore: cast_nullable_to_non_nullable
as int,graphicsRss: null == graphicsRss ? _self.graphicsRss : graphicsRss // ignore: cast_nullable_to_non_nullable
as int,privateOther: null == privateOther ? _self.privateOther : privateOther // ignore: cast_nullable_to_non_nullable
as int,system: null == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as int,unknownRss: null == unknownRss ? _self.unknownRss : unknownRss // ignore: cast_nullable_to_non_nullable
as int,totalPss: null == totalPss ? _self.totalPss : totalPss // ignore: cast_nullable_to_non_nullable
as int,totalRss: null == totalRss ? _self.totalRss : totalRss // ignore: cast_nullable_to_non_nullable
as int,totalSwapPss: null == totalSwapPss ? _self.totalSwapPss : totalSwapPss // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSummary].
extension AppSummaryPatterns on AppSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSummary value)  $default,){
final _that = this;
switch (_that) {
case _AppSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int javaHeapPss,  int javaHeapRss,  int nativeHeapPss,  int nativeHeapRss,  int codePss,  int codeRss,  int stackPss,  int stackRss,  int graphicsPss,  int graphicsRss,  int privateOther,  int system,  int unknownRss,  int totalPss,  int totalRss,  int totalSwapPss)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
return $default(_that.javaHeapPss,_that.javaHeapRss,_that.nativeHeapPss,_that.nativeHeapRss,_that.codePss,_that.codeRss,_that.stackPss,_that.stackRss,_that.graphicsPss,_that.graphicsRss,_that.privateOther,_that.system,_that.unknownRss,_that.totalPss,_that.totalRss,_that.totalSwapPss);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int javaHeapPss,  int javaHeapRss,  int nativeHeapPss,  int nativeHeapRss,  int codePss,  int codeRss,  int stackPss,  int stackRss,  int graphicsPss,  int graphicsRss,  int privateOther,  int system,  int unknownRss,  int totalPss,  int totalRss,  int totalSwapPss)  $default,) {final _that = this;
switch (_that) {
case _AppSummary():
return $default(_that.javaHeapPss,_that.javaHeapRss,_that.nativeHeapPss,_that.nativeHeapRss,_that.codePss,_that.codeRss,_that.stackPss,_that.stackRss,_that.graphicsPss,_that.graphicsRss,_that.privateOther,_that.system,_that.unknownRss,_that.totalPss,_that.totalRss,_that.totalSwapPss);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int javaHeapPss,  int javaHeapRss,  int nativeHeapPss,  int nativeHeapRss,  int codePss,  int codeRss,  int stackPss,  int stackRss,  int graphicsPss,  int graphicsRss,  int privateOther,  int system,  int unknownRss,  int totalPss,  int totalRss,  int totalSwapPss)?  $default,) {final _that = this;
switch (_that) {
case _AppSummary() when $default != null:
return $default(_that.javaHeapPss,_that.javaHeapRss,_that.nativeHeapPss,_that.nativeHeapRss,_that.codePss,_that.codeRss,_that.stackPss,_that.stackRss,_that.graphicsPss,_that.graphicsRss,_that.privateOther,_that.system,_that.unknownRss,_that.totalPss,_that.totalRss,_that.totalSwapPss);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSummary implements AppSummary {
  const _AppSummary({this.javaHeapPss = 0, this.javaHeapRss = 0, this.nativeHeapPss = 0, this.nativeHeapRss = 0, this.codePss = 0, this.codeRss = 0, this.stackPss = 0, this.stackRss = 0, this.graphicsPss = 0, this.graphicsRss = 0, this.privateOther = 0, this.system = 0, this.unknownRss = 0, this.totalPss = 0, this.totalRss = 0, this.totalSwapPss = 0});
  factory _AppSummary.fromJson(Map<String, dynamic> json) => _$AppSummaryFromJson(json);

@override@JsonKey() final  int javaHeapPss;
@override@JsonKey() final  int javaHeapRss;
@override@JsonKey() final  int nativeHeapPss;
@override@JsonKey() final  int nativeHeapRss;
@override@JsonKey() final  int codePss;
@override@JsonKey() final  int codeRss;
@override@JsonKey() final  int stackPss;
@override@JsonKey() final  int stackRss;
@override@JsonKey() final  int graphicsPss;
@override@JsonKey() final  int graphicsRss;
@override@JsonKey() final  int privateOther;
@override@JsonKey() final  int system;
@override@JsonKey() final  int unknownRss;
@override@JsonKey() final  int totalPss;
@override@JsonKey() final  int totalRss;
@override@JsonKey() final  int totalSwapPss;

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSummaryCopyWith<_AppSummary> get copyWith => __$AppSummaryCopyWithImpl<_AppSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSummary&&(identical(other.javaHeapPss, javaHeapPss) || other.javaHeapPss == javaHeapPss)&&(identical(other.javaHeapRss, javaHeapRss) || other.javaHeapRss == javaHeapRss)&&(identical(other.nativeHeapPss, nativeHeapPss) || other.nativeHeapPss == nativeHeapPss)&&(identical(other.nativeHeapRss, nativeHeapRss) || other.nativeHeapRss == nativeHeapRss)&&(identical(other.codePss, codePss) || other.codePss == codePss)&&(identical(other.codeRss, codeRss) || other.codeRss == codeRss)&&(identical(other.stackPss, stackPss) || other.stackPss == stackPss)&&(identical(other.stackRss, stackRss) || other.stackRss == stackRss)&&(identical(other.graphicsPss, graphicsPss) || other.graphicsPss == graphicsPss)&&(identical(other.graphicsRss, graphicsRss) || other.graphicsRss == graphicsRss)&&(identical(other.privateOther, privateOther) || other.privateOther == privateOther)&&(identical(other.system, system) || other.system == system)&&(identical(other.unknownRss, unknownRss) || other.unknownRss == unknownRss)&&(identical(other.totalPss, totalPss) || other.totalPss == totalPss)&&(identical(other.totalRss, totalRss) || other.totalRss == totalRss)&&(identical(other.totalSwapPss, totalSwapPss) || other.totalSwapPss == totalSwapPss));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,javaHeapPss,javaHeapRss,nativeHeapPss,nativeHeapRss,codePss,codeRss,stackPss,stackRss,graphicsPss,graphicsRss,privateOther,system,unknownRss,totalPss,totalRss,totalSwapPss);

@override
String toString() {
  return 'AppSummary(javaHeapPss: $javaHeapPss, javaHeapRss: $javaHeapRss, nativeHeapPss: $nativeHeapPss, nativeHeapRss: $nativeHeapRss, codePss: $codePss, codeRss: $codeRss, stackPss: $stackPss, stackRss: $stackRss, graphicsPss: $graphicsPss, graphicsRss: $graphicsRss, privateOther: $privateOther, system: $system, unknownRss: $unknownRss, totalPss: $totalPss, totalRss: $totalRss, totalSwapPss: $totalSwapPss)';
}


}

/// @nodoc
abstract mixin class _$AppSummaryCopyWith<$Res> implements $AppSummaryCopyWith<$Res> {
  factory _$AppSummaryCopyWith(_AppSummary value, $Res Function(_AppSummary) _then) = __$AppSummaryCopyWithImpl;
@override @useResult
$Res call({
 int javaHeapPss, int javaHeapRss, int nativeHeapPss, int nativeHeapRss, int codePss, int codeRss, int stackPss, int stackRss, int graphicsPss, int graphicsRss, int privateOther, int system, int unknownRss, int totalPss, int totalRss, int totalSwapPss
});




}
/// @nodoc
class __$AppSummaryCopyWithImpl<$Res>
    implements _$AppSummaryCopyWith<$Res> {
  __$AppSummaryCopyWithImpl(this._self, this._then);

  final _AppSummary _self;
  final $Res Function(_AppSummary) _then;

/// Create a copy of AppSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? javaHeapPss = null,Object? javaHeapRss = null,Object? nativeHeapPss = null,Object? nativeHeapRss = null,Object? codePss = null,Object? codeRss = null,Object? stackPss = null,Object? stackRss = null,Object? graphicsPss = null,Object? graphicsRss = null,Object? privateOther = null,Object? system = null,Object? unknownRss = null,Object? totalPss = null,Object? totalRss = null,Object? totalSwapPss = null,}) {
  return _then(_AppSummary(
javaHeapPss: null == javaHeapPss ? _self.javaHeapPss : javaHeapPss // ignore: cast_nullable_to_non_nullable
as int,javaHeapRss: null == javaHeapRss ? _self.javaHeapRss : javaHeapRss // ignore: cast_nullable_to_non_nullable
as int,nativeHeapPss: null == nativeHeapPss ? _self.nativeHeapPss : nativeHeapPss // ignore: cast_nullable_to_non_nullable
as int,nativeHeapRss: null == nativeHeapRss ? _self.nativeHeapRss : nativeHeapRss // ignore: cast_nullable_to_non_nullable
as int,codePss: null == codePss ? _self.codePss : codePss // ignore: cast_nullable_to_non_nullable
as int,codeRss: null == codeRss ? _self.codeRss : codeRss // ignore: cast_nullable_to_non_nullable
as int,stackPss: null == stackPss ? _self.stackPss : stackPss // ignore: cast_nullable_to_non_nullable
as int,stackRss: null == stackRss ? _self.stackRss : stackRss // ignore: cast_nullable_to_non_nullable
as int,graphicsPss: null == graphicsPss ? _self.graphicsPss : graphicsPss // ignore: cast_nullable_to_non_nullable
as int,graphicsRss: null == graphicsRss ? _self.graphicsRss : graphicsRss // ignore: cast_nullable_to_non_nullable
as int,privateOther: null == privateOther ? _self.privateOther : privateOther // ignore: cast_nullable_to_non_nullable
as int,system: null == system ? _self.system : system // ignore: cast_nullable_to_non_nullable
as int,unknownRss: null == unknownRss ? _self.unknownRss : unknownRss // ignore: cast_nullable_to_non_nullable
as int,totalPss: null == totalPss ? _self.totalPss : totalPss // ignore: cast_nullable_to_non_nullable
as int,totalRss: null == totalRss ? _self.totalRss : totalRss // ignore: cast_nullable_to_non_nullable
as int,totalSwapPss: null == totalSwapPss ? _self.totalSwapPss : totalSwapPss // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ObjectsInfo {

 int get views; int get viewRootImpl; int get appContexts; int get activities; int get assets; int get assetManagers; int get localBinders; int get proxyBinders; int get parcelMemory; int get parcelCount; int get deathRecipients; int get webViews;
/// Create a copy of ObjectsInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectsInfoCopyWith<ObjectsInfo> get copyWith => _$ObjectsInfoCopyWithImpl<ObjectsInfo>(this as ObjectsInfo, _$identity);

  /// Serializes this ObjectsInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectsInfo&&(identical(other.views, views) || other.views == views)&&(identical(other.viewRootImpl, viewRootImpl) || other.viewRootImpl == viewRootImpl)&&(identical(other.appContexts, appContexts) || other.appContexts == appContexts)&&(identical(other.activities, activities) || other.activities == activities)&&(identical(other.assets, assets) || other.assets == assets)&&(identical(other.assetManagers, assetManagers) || other.assetManagers == assetManagers)&&(identical(other.localBinders, localBinders) || other.localBinders == localBinders)&&(identical(other.proxyBinders, proxyBinders) || other.proxyBinders == proxyBinders)&&(identical(other.parcelMemory, parcelMemory) || other.parcelMemory == parcelMemory)&&(identical(other.parcelCount, parcelCount) || other.parcelCount == parcelCount)&&(identical(other.deathRecipients, deathRecipients) || other.deathRecipients == deathRecipients)&&(identical(other.webViews, webViews) || other.webViews == webViews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,views,viewRootImpl,appContexts,activities,assets,assetManagers,localBinders,proxyBinders,parcelMemory,parcelCount,deathRecipients,webViews);

@override
String toString() {
  return 'ObjectsInfo(views: $views, viewRootImpl: $viewRootImpl, appContexts: $appContexts, activities: $activities, assets: $assets, assetManagers: $assetManagers, localBinders: $localBinders, proxyBinders: $proxyBinders, parcelMemory: $parcelMemory, parcelCount: $parcelCount, deathRecipients: $deathRecipients, webViews: $webViews)';
}


}

/// @nodoc
abstract mixin class $ObjectsInfoCopyWith<$Res>  {
  factory $ObjectsInfoCopyWith(ObjectsInfo value, $Res Function(ObjectsInfo) _then) = _$ObjectsInfoCopyWithImpl;
@useResult
$Res call({
 int views, int viewRootImpl, int appContexts, int activities, int assets, int assetManagers, int localBinders, int proxyBinders, int parcelMemory, int parcelCount, int deathRecipients, int webViews
});




}
/// @nodoc
class _$ObjectsInfoCopyWithImpl<$Res>
    implements $ObjectsInfoCopyWith<$Res> {
  _$ObjectsInfoCopyWithImpl(this._self, this._then);

  final ObjectsInfo _self;
  final $Res Function(ObjectsInfo) _then;

/// Create a copy of ObjectsInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? views = null,Object? viewRootImpl = null,Object? appContexts = null,Object? activities = null,Object? assets = null,Object? assetManagers = null,Object? localBinders = null,Object? proxyBinders = null,Object? parcelMemory = null,Object? parcelCount = null,Object? deathRecipients = null,Object? webViews = null,}) {
  return _then(_self.copyWith(
views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,viewRootImpl: null == viewRootImpl ? _self.viewRootImpl : viewRootImpl // ignore: cast_nullable_to_non_nullable
as int,appContexts: null == appContexts ? _self.appContexts : appContexts // ignore: cast_nullable_to_non_nullable
as int,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as int,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as int,assetManagers: null == assetManagers ? _self.assetManagers : assetManagers // ignore: cast_nullable_to_non_nullable
as int,localBinders: null == localBinders ? _self.localBinders : localBinders // ignore: cast_nullable_to_non_nullable
as int,proxyBinders: null == proxyBinders ? _self.proxyBinders : proxyBinders // ignore: cast_nullable_to_non_nullable
as int,parcelMemory: null == parcelMemory ? _self.parcelMemory : parcelMemory // ignore: cast_nullable_to_non_nullable
as int,parcelCount: null == parcelCount ? _self.parcelCount : parcelCount // ignore: cast_nullable_to_non_nullable
as int,deathRecipients: null == deathRecipients ? _self.deathRecipients : deathRecipients // ignore: cast_nullable_to_non_nullable
as int,webViews: null == webViews ? _self.webViews : webViews // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ObjectsInfo].
extension ObjectsInfoPatterns on ObjectsInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ObjectsInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ObjectsInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ObjectsInfo value)  $default,){
final _that = this;
switch (_that) {
case _ObjectsInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ObjectsInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ObjectsInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int views,  int viewRootImpl,  int appContexts,  int activities,  int assets,  int assetManagers,  int localBinders,  int proxyBinders,  int parcelMemory,  int parcelCount,  int deathRecipients,  int webViews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ObjectsInfo() when $default != null:
return $default(_that.views,_that.viewRootImpl,_that.appContexts,_that.activities,_that.assets,_that.assetManagers,_that.localBinders,_that.proxyBinders,_that.parcelMemory,_that.parcelCount,_that.deathRecipients,_that.webViews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int views,  int viewRootImpl,  int appContexts,  int activities,  int assets,  int assetManagers,  int localBinders,  int proxyBinders,  int parcelMemory,  int parcelCount,  int deathRecipients,  int webViews)  $default,) {final _that = this;
switch (_that) {
case _ObjectsInfo():
return $default(_that.views,_that.viewRootImpl,_that.appContexts,_that.activities,_that.assets,_that.assetManagers,_that.localBinders,_that.proxyBinders,_that.parcelMemory,_that.parcelCount,_that.deathRecipients,_that.webViews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int views,  int viewRootImpl,  int appContexts,  int activities,  int assets,  int assetManagers,  int localBinders,  int proxyBinders,  int parcelMemory,  int parcelCount,  int deathRecipients,  int webViews)?  $default,) {final _that = this;
switch (_that) {
case _ObjectsInfo() when $default != null:
return $default(_that.views,_that.viewRootImpl,_that.appContexts,_that.activities,_that.assets,_that.assetManagers,_that.localBinders,_that.proxyBinders,_that.parcelMemory,_that.parcelCount,_that.deathRecipients,_that.webViews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ObjectsInfo implements ObjectsInfo {
  const _ObjectsInfo({this.views = 0, this.viewRootImpl = 0, this.appContexts = 0, this.activities = 0, this.assets = 0, this.assetManagers = 0, this.localBinders = 0, this.proxyBinders = 0, this.parcelMemory = 0, this.parcelCount = 0, this.deathRecipients = 0, this.webViews = 0});
  factory _ObjectsInfo.fromJson(Map<String, dynamic> json) => _$ObjectsInfoFromJson(json);

@override@JsonKey() final  int views;
@override@JsonKey() final  int viewRootImpl;
@override@JsonKey() final  int appContexts;
@override@JsonKey() final  int activities;
@override@JsonKey() final  int assets;
@override@JsonKey() final  int assetManagers;
@override@JsonKey() final  int localBinders;
@override@JsonKey() final  int proxyBinders;
@override@JsonKey() final  int parcelMemory;
@override@JsonKey() final  int parcelCount;
@override@JsonKey() final  int deathRecipients;
@override@JsonKey() final  int webViews;

/// Create a copy of ObjectsInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectsInfoCopyWith<_ObjectsInfo> get copyWith => __$ObjectsInfoCopyWithImpl<_ObjectsInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ObjectsInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObjectsInfo&&(identical(other.views, views) || other.views == views)&&(identical(other.viewRootImpl, viewRootImpl) || other.viewRootImpl == viewRootImpl)&&(identical(other.appContexts, appContexts) || other.appContexts == appContexts)&&(identical(other.activities, activities) || other.activities == activities)&&(identical(other.assets, assets) || other.assets == assets)&&(identical(other.assetManagers, assetManagers) || other.assetManagers == assetManagers)&&(identical(other.localBinders, localBinders) || other.localBinders == localBinders)&&(identical(other.proxyBinders, proxyBinders) || other.proxyBinders == proxyBinders)&&(identical(other.parcelMemory, parcelMemory) || other.parcelMemory == parcelMemory)&&(identical(other.parcelCount, parcelCount) || other.parcelCount == parcelCount)&&(identical(other.deathRecipients, deathRecipients) || other.deathRecipients == deathRecipients)&&(identical(other.webViews, webViews) || other.webViews == webViews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,views,viewRootImpl,appContexts,activities,assets,assetManagers,localBinders,proxyBinders,parcelMemory,parcelCount,deathRecipients,webViews);

@override
String toString() {
  return 'ObjectsInfo(views: $views, viewRootImpl: $viewRootImpl, appContexts: $appContexts, activities: $activities, assets: $assets, assetManagers: $assetManagers, localBinders: $localBinders, proxyBinders: $proxyBinders, parcelMemory: $parcelMemory, parcelCount: $parcelCount, deathRecipients: $deathRecipients, webViews: $webViews)';
}


}

/// @nodoc
abstract mixin class _$ObjectsInfoCopyWith<$Res> implements $ObjectsInfoCopyWith<$Res> {
  factory _$ObjectsInfoCopyWith(_ObjectsInfo value, $Res Function(_ObjectsInfo) _then) = __$ObjectsInfoCopyWithImpl;
@override @useResult
$Res call({
 int views, int viewRootImpl, int appContexts, int activities, int assets, int assetManagers, int localBinders, int proxyBinders, int parcelMemory, int parcelCount, int deathRecipients, int webViews
});




}
/// @nodoc
class __$ObjectsInfoCopyWithImpl<$Res>
    implements _$ObjectsInfoCopyWith<$Res> {
  __$ObjectsInfoCopyWithImpl(this._self, this._then);

  final _ObjectsInfo _self;
  final $Res Function(_ObjectsInfo) _then;

/// Create a copy of ObjectsInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? views = null,Object? viewRootImpl = null,Object? appContexts = null,Object? activities = null,Object? assets = null,Object? assetManagers = null,Object? localBinders = null,Object? proxyBinders = null,Object? parcelMemory = null,Object? parcelCount = null,Object? deathRecipients = null,Object? webViews = null,}) {
  return _then(_ObjectsInfo(
views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,viewRootImpl: null == viewRootImpl ? _self.viewRootImpl : viewRootImpl // ignore: cast_nullable_to_non_nullable
as int,appContexts: null == appContexts ? _self.appContexts : appContexts // ignore: cast_nullable_to_non_nullable
as int,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as int,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as int,assetManagers: null == assetManagers ? _self.assetManagers : assetManagers // ignore: cast_nullable_to_non_nullable
as int,localBinders: null == localBinders ? _self.localBinders : localBinders // ignore: cast_nullable_to_non_nullable
as int,proxyBinders: null == proxyBinders ? _self.proxyBinders : proxyBinders // ignore: cast_nullable_to_non_nullable
as int,parcelMemory: null == parcelMemory ? _self.parcelMemory : parcelMemory // ignore: cast_nullable_to_non_nullable
as int,parcelCount: null == parcelCount ? _self.parcelCount : parcelCount // ignore: cast_nullable_to_non_nullable
as int,deathRecipients: null == deathRecipients ? _self.deathRecipients : deathRecipients // ignore: cast_nullable_to_non_nullable
as int,webViews: null == webViews ? _self.webViews : webViews // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NativeAllocations {

 int get bitmapCount; int get bitmapTotalKb; int get otherMallocedCount; int get otherMallocedKb; int get otherNonMallocedCount; int get otherNonMallocedKb;
/// Create a copy of NativeAllocations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NativeAllocationsCopyWith<NativeAllocations> get copyWith => _$NativeAllocationsCopyWithImpl<NativeAllocations>(this as NativeAllocations, _$identity);

  /// Serializes this NativeAllocations to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NativeAllocations&&(identical(other.bitmapCount, bitmapCount) || other.bitmapCount == bitmapCount)&&(identical(other.bitmapTotalKb, bitmapTotalKb) || other.bitmapTotalKb == bitmapTotalKb)&&(identical(other.otherMallocedCount, otherMallocedCount) || other.otherMallocedCount == otherMallocedCount)&&(identical(other.otherMallocedKb, otherMallocedKb) || other.otherMallocedKb == otherMallocedKb)&&(identical(other.otherNonMallocedCount, otherNonMallocedCount) || other.otherNonMallocedCount == otherNonMallocedCount)&&(identical(other.otherNonMallocedKb, otherNonMallocedKb) || other.otherNonMallocedKb == otherNonMallocedKb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bitmapCount,bitmapTotalKb,otherMallocedCount,otherMallocedKb,otherNonMallocedCount,otherNonMallocedKb);

@override
String toString() {
  return 'NativeAllocations(bitmapCount: $bitmapCount, bitmapTotalKb: $bitmapTotalKb, otherMallocedCount: $otherMallocedCount, otherMallocedKb: $otherMallocedKb, otherNonMallocedCount: $otherNonMallocedCount, otherNonMallocedKb: $otherNonMallocedKb)';
}


}

/// @nodoc
abstract mixin class $NativeAllocationsCopyWith<$Res>  {
  factory $NativeAllocationsCopyWith(NativeAllocations value, $Res Function(NativeAllocations) _then) = _$NativeAllocationsCopyWithImpl;
@useResult
$Res call({
 int bitmapCount, int bitmapTotalKb, int otherMallocedCount, int otherMallocedKb, int otherNonMallocedCount, int otherNonMallocedKb
});




}
/// @nodoc
class _$NativeAllocationsCopyWithImpl<$Res>
    implements $NativeAllocationsCopyWith<$Res> {
  _$NativeAllocationsCopyWithImpl(this._self, this._then);

  final NativeAllocations _self;
  final $Res Function(NativeAllocations) _then;

/// Create a copy of NativeAllocations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bitmapCount = null,Object? bitmapTotalKb = null,Object? otherMallocedCount = null,Object? otherMallocedKb = null,Object? otherNonMallocedCount = null,Object? otherNonMallocedKb = null,}) {
  return _then(_self.copyWith(
bitmapCount: null == bitmapCount ? _self.bitmapCount : bitmapCount // ignore: cast_nullable_to_non_nullable
as int,bitmapTotalKb: null == bitmapTotalKb ? _self.bitmapTotalKb : bitmapTotalKb // ignore: cast_nullable_to_non_nullable
as int,otherMallocedCount: null == otherMallocedCount ? _self.otherMallocedCount : otherMallocedCount // ignore: cast_nullable_to_non_nullable
as int,otherMallocedKb: null == otherMallocedKb ? _self.otherMallocedKb : otherMallocedKb // ignore: cast_nullable_to_non_nullable
as int,otherNonMallocedCount: null == otherNonMallocedCount ? _self.otherNonMallocedCount : otherNonMallocedCount // ignore: cast_nullable_to_non_nullable
as int,otherNonMallocedKb: null == otherNonMallocedKb ? _self.otherNonMallocedKb : otherNonMallocedKb // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NativeAllocations].
extension NativeAllocationsPatterns on NativeAllocations {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NativeAllocations value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NativeAllocations() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NativeAllocations value)  $default,){
final _that = this;
switch (_that) {
case _NativeAllocations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NativeAllocations value)?  $default,){
final _that = this;
switch (_that) {
case _NativeAllocations() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int bitmapCount,  int bitmapTotalKb,  int otherMallocedCount,  int otherMallocedKb,  int otherNonMallocedCount,  int otherNonMallocedKb)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NativeAllocations() when $default != null:
return $default(_that.bitmapCount,_that.bitmapTotalKb,_that.otherMallocedCount,_that.otherMallocedKb,_that.otherNonMallocedCount,_that.otherNonMallocedKb);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int bitmapCount,  int bitmapTotalKb,  int otherMallocedCount,  int otherMallocedKb,  int otherNonMallocedCount,  int otherNonMallocedKb)  $default,) {final _that = this;
switch (_that) {
case _NativeAllocations():
return $default(_that.bitmapCount,_that.bitmapTotalKb,_that.otherMallocedCount,_that.otherMallocedKb,_that.otherNonMallocedCount,_that.otherNonMallocedKb);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int bitmapCount,  int bitmapTotalKb,  int otherMallocedCount,  int otherMallocedKb,  int otherNonMallocedCount,  int otherNonMallocedKb)?  $default,) {final _that = this;
switch (_that) {
case _NativeAllocations() when $default != null:
return $default(_that.bitmapCount,_that.bitmapTotalKb,_that.otherMallocedCount,_that.otherMallocedKb,_that.otherNonMallocedCount,_that.otherNonMallocedKb);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NativeAllocations implements NativeAllocations {
  const _NativeAllocations({this.bitmapCount = 0, this.bitmapTotalKb = 0, this.otherMallocedCount = 0, this.otherMallocedKb = 0, this.otherNonMallocedCount = 0, this.otherNonMallocedKb = 0});
  factory _NativeAllocations.fromJson(Map<String, dynamic> json) => _$NativeAllocationsFromJson(json);

@override@JsonKey() final  int bitmapCount;
@override@JsonKey() final  int bitmapTotalKb;
@override@JsonKey() final  int otherMallocedCount;
@override@JsonKey() final  int otherMallocedKb;
@override@JsonKey() final  int otherNonMallocedCount;
@override@JsonKey() final  int otherNonMallocedKb;

/// Create a copy of NativeAllocations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NativeAllocationsCopyWith<_NativeAllocations> get copyWith => __$NativeAllocationsCopyWithImpl<_NativeAllocations>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NativeAllocationsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NativeAllocations&&(identical(other.bitmapCount, bitmapCount) || other.bitmapCount == bitmapCount)&&(identical(other.bitmapTotalKb, bitmapTotalKb) || other.bitmapTotalKb == bitmapTotalKb)&&(identical(other.otherMallocedCount, otherMallocedCount) || other.otherMallocedCount == otherMallocedCount)&&(identical(other.otherMallocedKb, otherMallocedKb) || other.otherMallocedKb == otherMallocedKb)&&(identical(other.otherNonMallocedCount, otherNonMallocedCount) || other.otherNonMallocedCount == otherNonMallocedCount)&&(identical(other.otherNonMallocedKb, otherNonMallocedKb) || other.otherNonMallocedKb == otherNonMallocedKb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bitmapCount,bitmapTotalKb,otherMallocedCount,otherMallocedKb,otherNonMallocedCount,otherNonMallocedKb);

@override
String toString() {
  return 'NativeAllocations(bitmapCount: $bitmapCount, bitmapTotalKb: $bitmapTotalKb, otherMallocedCount: $otherMallocedCount, otherMallocedKb: $otherMallocedKb, otherNonMallocedCount: $otherNonMallocedCount, otherNonMallocedKb: $otherNonMallocedKb)';
}


}

/// @nodoc
abstract mixin class _$NativeAllocationsCopyWith<$Res> implements $NativeAllocationsCopyWith<$Res> {
  factory _$NativeAllocationsCopyWith(_NativeAllocations value, $Res Function(_NativeAllocations) _then) = __$NativeAllocationsCopyWithImpl;
@override @useResult
$Res call({
 int bitmapCount, int bitmapTotalKb, int otherMallocedCount, int otherMallocedKb, int otherNonMallocedCount, int otherNonMallocedKb
});




}
/// @nodoc
class __$NativeAllocationsCopyWithImpl<$Res>
    implements _$NativeAllocationsCopyWith<$Res> {
  __$NativeAllocationsCopyWithImpl(this._self, this._then);

  final _NativeAllocations _self;
  final $Res Function(_NativeAllocations) _then;

/// Create a copy of NativeAllocations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bitmapCount = null,Object? bitmapTotalKb = null,Object? otherMallocedCount = null,Object? otherMallocedKb = null,Object? otherNonMallocedCount = null,Object? otherNonMallocedKb = null,}) {
  return _then(_NativeAllocations(
bitmapCount: null == bitmapCount ? _self.bitmapCount : bitmapCount // ignore: cast_nullable_to_non_nullable
as int,bitmapTotalKb: null == bitmapTotalKb ? _self.bitmapTotalKb : bitmapTotalKb // ignore: cast_nullable_to_non_nullable
as int,otherMallocedCount: null == otherMallocedCount ? _self.otherMallocedCount : otherMallocedCount // ignore: cast_nullable_to_non_nullable
as int,otherMallocedKb: null == otherMallocedKb ? _self.otherMallocedKb : otherMallocedKb // ignore: cast_nullable_to_non_nullable
as int,otherNonMallocedCount: null == otherNonMallocedCount ? _self.otherNonMallocedCount : otherNonMallocedCount // ignore: cast_nullable_to_non_nullable
as int,otherNonMallocedKb: null == otherNonMallocedKb ? _self.otherNonMallocedKb : otherNonMallocedKb // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
