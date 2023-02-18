// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsModel {
  SelectedLanguage get selectedLanguage => throw _privateConstructorUsedError;
  SelectedTheme get selectedTheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call({SelectedLanguage selectedLanguage, SelectedTheme selectedTheme});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
    Object? selectedTheme = null,
  }) {
    return _then(_value.copyWith(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as SelectedLanguage,
      selectedTheme: null == selectedTheme
          ? _value.selectedTheme
          : selectedTheme // ignore: cast_nullable_to_non_nullable
              as SelectedTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsModelCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$_SettingsModelCopyWith(
          _$_SettingsModel value, $Res Function(_$_SettingsModel) then) =
      __$$_SettingsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SelectedLanguage selectedLanguage, SelectedTheme selectedTheme});
}

/// @nodoc
class __$$_SettingsModelCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$_SettingsModel>
    implements _$$_SettingsModelCopyWith<$Res> {
  __$$_SettingsModelCopyWithImpl(
      _$_SettingsModel _value, $Res Function(_$_SettingsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
    Object? selectedTheme = null,
  }) {
    return _then(_$_SettingsModel(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as SelectedLanguage,
      selectedTheme: null == selectedTheme
          ? _value.selectedTheme
          : selectedTheme // ignore: cast_nullable_to_non_nullable
              as SelectedTheme,
    ));
  }
}

/// @nodoc

class _$_SettingsModel implements _SettingsModel {
  const _$_SettingsModel(
      {required this.selectedLanguage, required this.selectedTheme});

  @override
  final SelectedLanguage selectedLanguage;
  @override
  final SelectedTheme selectedTheme;

  @override
  String toString() {
    return 'SettingsModel(selectedLanguage: $selectedLanguage, selectedTheme: $selectedTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsModel &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage) &&
            (identical(other.selectedTheme, selectedTheme) ||
                other.selectedTheme == selectedTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguage, selectedTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      __$$_SettingsModelCopyWithImpl<_$_SettingsModel>(this, _$identity);
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {required final SelectedLanguage selectedLanguage,
      required final SelectedTheme selectedTheme}) = _$_SettingsModel;

  @override
  SelectedLanguage get selectedLanguage;
  @override
  SelectedTheme get selectedTheme;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
