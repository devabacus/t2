// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagModel {

 String get id; DateTime get lastModified; int get userId; String get title;
/// Create a copy of TagModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagModelCopyWith<TagModel> get copyWith => _$TagModelCopyWithImpl<TagModel>(this as TagModel, _$identity);

  /// Serializes this TagModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lastModified,userId,title);

@override
String toString() {
  return 'TagModel(id: $id, lastModified: $lastModified, userId: $userId, title: $title)';
}


}

/// @nodoc
abstract mixin class $TagModelCopyWith<$Res>  {
  factory $TagModelCopyWith(TagModel value, $Res Function(TagModel) _then) = _$TagModelCopyWithImpl;
@useResult
$Res call({
 String id, DateTime lastModified, int userId, String title
});




}
/// @nodoc
class _$TagModelCopyWithImpl<$Res>
    implements $TagModelCopyWith<$Res> {
  _$TagModelCopyWithImpl(this._self, this._then);

  final TagModel _self;
  final $Res Function(TagModel) _then;

/// Create a copy of TagModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lastModified = null,Object? userId = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TagModel].
extension TagModelPatterns on TagModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagModel value)  $default,){
final _that = this;
switch (_that) {
case _TagModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagModel value)?  $default,){
final _that = this;
switch (_that) {
case _TagModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime lastModified,  int userId,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagModel() when $default != null:
return $default(_that.id,_that.lastModified,_that.userId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime lastModified,  int userId,  String title)  $default,) {final _that = this;
switch (_that) {
case _TagModel():
return $default(_that.id,_that.lastModified,_that.userId,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime lastModified,  int userId,  String title)?  $default,) {final _that = this;
switch (_that) {
case _TagModel() when $default != null:
return $default(_that.id,_that.lastModified,_that.userId,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TagModel implements TagModel {
  const _TagModel({required this.id, required this.lastModified, required this.userId, required this.title});
  factory _TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);

@override final  String id;
@override final  DateTime lastModified;
@override final  int userId;
@override final  String title;

/// Create a copy of TagModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagModelCopyWith<_TagModel> get copyWith => __$TagModelCopyWithImpl<_TagModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lastModified,userId,title);

@override
String toString() {
  return 'TagModel(id: $id, lastModified: $lastModified, userId: $userId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$TagModelCopyWith<$Res> implements $TagModelCopyWith<$Res> {
  factory _$TagModelCopyWith(_TagModel value, $Res Function(_TagModel) _then) = __$TagModelCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime lastModified, int userId, String title
});




}
/// @nodoc
class __$TagModelCopyWithImpl<$Res>
    implements _$TagModelCopyWith<$Res> {
  __$TagModelCopyWithImpl(this._self, this._then);

  final _TagModel _self;
  final $Res Function(_TagModel) _then;

/// Create a copy of TagModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lastModified = null,Object? userId = null,Object? title = null,}) {
  return _then(_TagModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
