// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingViewModel {

 String get key; String get displayName; String get group;
/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingViewModelCopyWith<SettingViewModel> get copyWith => _$SettingViewModelCopyWithImpl<SettingViewModel>(this as SettingViewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group);

@override
String toString() {
  return 'SettingViewModel(key: $key, displayName: $displayName, group: $group)';
}


}

/// @nodoc
abstract mixin class $SettingViewModelCopyWith<$Res>  {
  factory $SettingViewModelCopyWith(SettingViewModel value, $Res Function(SettingViewModel) _then) = _$SettingViewModelCopyWithImpl;
@useResult
$Res call({
 String key, String displayName, String group
});




}
/// @nodoc
class _$SettingViewModelCopyWithImpl<$Res>
    implements $SettingViewModelCopyWith<$Res> {
  _$SettingViewModelCopyWithImpl(this._self, this._then);

  final SettingViewModel _self;
  final $Res Function(SettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? displayName = null,Object? group = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingViewModel].
extension SettingViewModelPatterns on SettingViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BooleanSettingViewModel value)?  boolean,TResult Function( OptionsSettingViewModel value)?  options,TResult Function( StringSettingViewModel value)?  string,TResult Function( UnsupportedSettingViewModel value)?  unsupported,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that);case OptionsSettingViewModel() when options != null:
return options(_that);case StringSettingViewModel() when string != null:
return string(_that);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BooleanSettingViewModel value)  boolean,required TResult Function( OptionsSettingViewModel value)  options,required TResult Function( StringSettingViewModel value)  string,required TResult Function( UnsupportedSettingViewModel value)  unsupported,}){
final _that = this;
switch (_that) {
case BooleanSettingViewModel():
return boolean(_that);case OptionsSettingViewModel():
return options(_that);case StringSettingViewModel():
return string(_that);case UnsupportedSettingViewModel():
return unsupported(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BooleanSettingViewModel value)?  boolean,TResult? Function( OptionsSettingViewModel value)?  options,TResult? Function( StringSettingViewModel value)?  string,TResult? Function( UnsupportedSettingViewModel value)?  unsupported,}){
final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that);case OptionsSettingViewModel() when options != null:
return options(_that);case StringSettingViewModel() when string != null:
return string(_that);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  String displayName,  String group,  bool value)?  boolean,TResult Function( String key,  String displayName,  String group,  String currentValue,  List<String> options)?  options,TResult Function( String key,  String displayName,  String group,  String value)?  string,TResult Function( String key,  String displayName,  String group)?  unsupported,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that.key,_that.displayName,_that.group,_that.value);case OptionsSettingViewModel() when options != null:
return options(_that.key,_that.displayName,_that.group,_that.currentValue,_that.options);case StringSettingViewModel() when string != null:
return string(_that.key,_that.displayName,_that.group,_that.value);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that.key,_that.displayName,_that.group);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  String displayName,  String group,  bool value)  boolean,required TResult Function( String key,  String displayName,  String group,  String currentValue,  List<String> options)  options,required TResult Function( String key,  String displayName,  String group,  String value)  string,required TResult Function( String key,  String displayName,  String group)  unsupported,}) {final _that = this;
switch (_that) {
case BooleanSettingViewModel():
return boolean(_that.key,_that.displayName,_that.group,_that.value);case OptionsSettingViewModel():
return options(_that.key,_that.displayName,_that.group,_that.currentValue,_that.options);case StringSettingViewModel():
return string(_that.key,_that.displayName,_that.group,_that.value);case UnsupportedSettingViewModel():
return unsupported(_that.key,_that.displayName,_that.group);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  String displayName,  String group,  bool value)?  boolean,TResult? Function( String key,  String displayName,  String group,  String currentValue,  List<String> options)?  options,TResult? Function( String key,  String displayName,  String group,  String value)?  string,TResult? Function( String key,  String displayName,  String group)?  unsupported,}) {final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that.key,_that.displayName,_that.group,_that.value);case OptionsSettingViewModel() when options != null:
return options(_that.key,_that.displayName,_that.group,_that.currentValue,_that.options);case StringSettingViewModel() when string != null:
return string(_that.key,_that.displayName,_that.group,_that.value);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that.key,_that.displayName,_that.group);case _:
  return null;

}
}

}

/// @nodoc


class BooleanSettingViewModel implements SettingViewModel {
  const BooleanSettingViewModel({required this.key, required this.displayName, required this.group, required this.value});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  bool value;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooleanSettingViewModelCopyWith<BooleanSettingViewModel> get copyWith => _$BooleanSettingViewModelCopyWithImpl<BooleanSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooleanSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value);

@override
String toString() {
  return 'SettingViewModel.boolean(key: $key, displayName: $displayName, group: $group, value: $value)';
}


}

/// @nodoc
abstract mixin class $BooleanSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $BooleanSettingViewModelCopyWith(BooleanSettingViewModel value, $Res Function(BooleanSettingViewModel) _then) = _$BooleanSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, bool value
});




}
/// @nodoc
class _$BooleanSettingViewModelCopyWithImpl<$Res>
    implements $BooleanSettingViewModelCopyWith<$Res> {
  _$BooleanSettingViewModelCopyWithImpl(this._self, this._then);

  final BooleanSettingViewModel _self;
  final $Res Function(BooleanSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,}) {
  return _then(BooleanSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OptionsSettingViewModel implements SettingViewModel {
  const OptionsSettingViewModel({required this.key, required this.displayName, required this.group, required this.currentValue, required final  List<String> options}): _options = options;
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  String currentValue;
 final  List<String> _options;
 List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionsSettingViewModelCopyWith<OptionsSettingViewModel> get copyWith => _$OptionsSettingViewModelCopyWithImpl<OptionsSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionsSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,currentValue,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'SettingViewModel.options(key: $key, displayName: $displayName, group: $group, currentValue: $currentValue, options: $options)';
}


}

/// @nodoc
abstract mixin class $OptionsSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $OptionsSettingViewModelCopyWith(OptionsSettingViewModel value, $Res Function(OptionsSettingViewModel) _then) = _$OptionsSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, String currentValue, List<String> options
});




}
/// @nodoc
class _$OptionsSettingViewModelCopyWithImpl<$Res>
    implements $OptionsSettingViewModelCopyWith<$Res> {
  _$OptionsSettingViewModelCopyWithImpl(this._self, this._then);

  final OptionsSettingViewModel _self;
  final $Res Function(OptionsSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? currentValue = null,Object? options = null,}) {
  return _then(OptionsSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class StringSettingViewModel implements SettingViewModel {
  const StringSettingViewModel({required this.key, required this.displayName, required this.group, required this.value});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  String value;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StringSettingViewModelCopyWith<StringSettingViewModel> get copyWith => _$StringSettingViewModelCopyWithImpl<StringSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StringSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value);

@override
String toString() {
  return 'SettingViewModel.string(key: $key, displayName: $displayName, group: $group, value: $value)';
}


}

/// @nodoc
abstract mixin class $StringSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $StringSettingViewModelCopyWith(StringSettingViewModel value, $Res Function(StringSettingViewModel) _then) = _$StringSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, String value
});




}
/// @nodoc
class _$StringSettingViewModelCopyWithImpl<$Res>
    implements $StringSettingViewModelCopyWith<$Res> {
  _$StringSettingViewModelCopyWithImpl(this._self, this._then);

  final StringSettingViewModel _self;
  final $Res Function(StringSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,}) {
  return _then(StringSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnsupportedSettingViewModel implements SettingViewModel {
  const UnsupportedSettingViewModel({required this.key, required this.displayName, required this.group});
  

@override final  String key;
@override final  String displayName;
@override final  String group;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnsupportedSettingViewModelCopyWith<UnsupportedSettingViewModel> get copyWith => _$UnsupportedSettingViewModelCopyWithImpl<UnsupportedSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnsupportedSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group);

@override
String toString() {
  return 'SettingViewModel.unsupported(key: $key, displayName: $displayName, group: $group)';
}


}

/// @nodoc
abstract mixin class $UnsupportedSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $UnsupportedSettingViewModelCopyWith(UnsupportedSettingViewModel value, $Res Function(UnsupportedSettingViewModel) _then) = _$UnsupportedSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group
});




}
/// @nodoc
class _$UnsupportedSettingViewModelCopyWithImpl<$Res>
    implements $UnsupportedSettingViewModelCopyWith<$Res> {
  _$UnsupportedSettingViewModelCopyWithImpl(this._self, this._then);

  final UnsupportedSettingViewModel _self;
  final $Res Function(UnsupportedSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,}) {
  return _then(UnsupportedSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
