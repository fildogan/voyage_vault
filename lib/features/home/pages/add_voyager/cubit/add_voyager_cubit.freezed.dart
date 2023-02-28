// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_voyager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddVoyagerState {
  Status get status => throw _privateConstructorUsedError;
  FormStatus get formStatus => throw _privateConstructorUsedError;
  List<VoyagerModel> get voyagers => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get voyagerName => throw _privateConstructorUsedError;
  Color? get voyagerColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddVoyagerStateCopyWith<AddVoyagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVoyagerStateCopyWith<$Res> {
  factory $AddVoyagerStateCopyWith(
          AddVoyagerState value, $Res Function(AddVoyagerState) then) =
      _$AddVoyagerStateCopyWithImpl<$Res, AddVoyagerState>;
  @useResult
  $Res call(
      {Status status,
      FormStatus formStatus,
      List<VoyagerModel> voyagers,
      String? errorMessage,
      String? successMessage,
      String? voyagerName,
      Color? voyagerColor});
}

/// @nodoc
class _$AddVoyagerStateCopyWithImpl<$Res, $Val extends AddVoyagerState>
    implements $AddVoyagerStateCopyWith<$Res> {
  _$AddVoyagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? formStatus = null,
    Object? voyagers = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? voyagerName = freezed,
    Object? voyagerColor = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      voyagers: null == voyagers
          ? _value.voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagerName: freezed == voyagerName
          ? _value.voyagerName
          : voyagerName // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagerColor: freezed == voyagerColor
          ? _value.voyagerColor
          : voyagerColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddVoyagerStateCopyWith<$Res>
    implements $AddVoyagerStateCopyWith<$Res> {
  factory _$$_AddVoyagerStateCopyWith(
          _$_AddVoyagerState value, $Res Function(_$_AddVoyagerState) then) =
      __$$_AddVoyagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      FormStatus formStatus,
      List<VoyagerModel> voyagers,
      String? errorMessage,
      String? successMessage,
      String? voyagerName,
      Color? voyagerColor});
}

/// @nodoc
class __$$_AddVoyagerStateCopyWithImpl<$Res>
    extends _$AddVoyagerStateCopyWithImpl<$Res, _$_AddVoyagerState>
    implements _$$_AddVoyagerStateCopyWith<$Res> {
  __$$_AddVoyagerStateCopyWithImpl(
      _$_AddVoyagerState _value, $Res Function(_$_AddVoyagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? formStatus = null,
    Object? voyagers = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? voyagerName = freezed,
    Object? voyagerColor = freezed,
  }) {
    return _then(_$_AddVoyagerState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      voyagers: null == voyagers
          ? _value._voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagerName: freezed == voyagerName
          ? _value.voyagerName
          : voyagerName // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagerColor: freezed == voyagerColor
          ? _value.voyagerColor
          : voyagerColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_AddVoyagerState extends _AddVoyagerState {
  _$_AddVoyagerState(
      {this.status = Status.initial,
      this.formStatus = FormStatus.initial,
      final List<VoyagerModel> voyagers = const [],
      this.errorMessage,
      this.successMessage,
      this.voyagerName,
      this.voyagerColor})
      : _voyagers = voyagers,
        super._();

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final FormStatus formStatus;
  final List<VoyagerModel> _voyagers;
  @override
  @JsonKey()
  List<VoyagerModel> get voyagers {
    if (_voyagers is EqualUnmodifiableListView) return _voyagers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyagers);
  }

  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  final String? voyagerName;
  @override
  final Color? voyagerColor;

  @override
  String toString() {
    return 'AddVoyagerState(status: $status, formStatus: $formStatus, voyagers: $voyagers, errorMessage: $errorMessage, successMessage: $successMessage, voyagerName: $voyagerName, voyagerColor: $voyagerColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddVoyagerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            const DeepCollectionEquality().equals(other._voyagers, _voyagers) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.voyagerName, voyagerName) ||
                other.voyagerName == voyagerName) &&
            (identical(other.voyagerColor, voyagerColor) ||
                other.voyagerColor == voyagerColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      formStatus,
      const DeepCollectionEquality().hash(_voyagers),
      errorMessage,
      successMessage,
      voyagerName,
      voyagerColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddVoyagerStateCopyWith<_$_AddVoyagerState> get copyWith =>
      __$$_AddVoyagerStateCopyWithImpl<_$_AddVoyagerState>(this, _$identity);
}

abstract class _AddVoyagerState extends AddVoyagerState {
  factory _AddVoyagerState(
      {final Status status,
      final FormStatus formStatus,
      final List<VoyagerModel> voyagers,
      final String? errorMessage,
      final String? successMessage,
      final String? voyagerName,
      final Color? voyagerColor}) = _$_AddVoyagerState;
  _AddVoyagerState._() : super._();

  @override
  Status get status;
  @override
  FormStatus get formStatus;
  @override
  List<VoyagerModel> get voyagers;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  String? get voyagerName;
  @override
  Color? get voyagerColor;
  @override
  @JsonKey(ignore: true)
  _$$_AddVoyagerStateCopyWith<_$_AddVoyagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
