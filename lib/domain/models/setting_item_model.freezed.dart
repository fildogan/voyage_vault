// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingItemModel {
  String get title => throw _privateConstructorUsedError;
  Widget get trailing => throw _privateConstructorUsedError;
  void Function()? get onTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingItemModelCopyWith<SettingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingItemModelCopyWith<$Res> {
  factory $SettingItemModelCopyWith(
          SettingItemModel value, $Res Function(SettingItemModel) then) =
      _$SettingItemModelCopyWithImpl<$Res, SettingItemModel>;
  @useResult
  $Res call({String title, Widget trailing, void Function()? onTap});
}

/// @nodoc
class _$SettingItemModelCopyWithImpl<$Res, $Val extends SettingItemModel>
    implements $SettingItemModelCopyWith<$Res> {
  _$SettingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? trailing = null,
    Object? onTap = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      trailing: null == trailing
          ? _value.trailing
          : trailing // ignore: cast_nullable_to_non_nullable
              as Widget,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingItemModelCopyWith<$Res>
    implements $SettingItemModelCopyWith<$Res> {
  factory _$$_SettingItemModelCopyWith(
          _$_SettingItemModel value, $Res Function(_$_SettingItemModel) then) =
      __$$_SettingItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, Widget trailing, void Function()? onTap});
}

/// @nodoc
class __$$_SettingItemModelCopyWithImpl<$Res>
    extends _$SettingItemModelCopyWithImpl<$Res, _$_SettingItemModel>
    implements _$$_SettingItemModelCopyWith<$Res> {
  __$$_SettingItemModelCopyWithImpl(
      _$_SettingItemModel _value, $Res Function(_$_SettingItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? trailing = null,
    Object? onTap = freezed,
  }) {
    return _then(_$_SettingItemModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      trailing: null == trailing
          ? _value.trailing
          : trailing // ignore: cast_nullable_to_non_nullable
              as Widget,
      onTap: freezed == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$_SettingItemModel extends _SettingItemModel {
  const _$_SettingItemModel(
      {required this.title, required this.trailing, this.onTap})
      : super._();

  @override
  final String title;
  @override
  final Widget trailing;
  @override
  final void Function()? onTap;

  @override
  String toString() {
    return 'SettingItemModel(title: $title, trailing: $trailing, onTap: $onTap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingItemModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.trailing, trailing) ||
                other.trailing == trailing) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, trailing, onTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingItemModelCopyWith<_$_SettingItemModel> get copyWith =>
      __$$_SettingItemModelCopyWithImpl<_$_SettingItemModel>(this, _$identity);
}

abstract class _SettingItemModel extends SettingItemModel {
  const factory _SettingItemModel(
      {required final String title,
      required final Widget trailing,
      final void Function()? onTap}) = _$_SettingItemModel;
  const _SettingItemModel._() : super._();

  @override
  String get title;
  @override
  Widget get trailing;
  @override
  void Function()? get onTap;
  @override
  @JsonKey(ignore: true)
  _$$_SettingItemModelCopyWith<_$_SettingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
