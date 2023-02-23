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
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  VoyagerModel? get voyagerModel => throw _privateConstructorUsedError;

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
      String? errorMessage,
      String? successMessage,
      VoyagerModel? voyagerModel});

  $VoyagerModelCopyWith<$Res>? get voyagerModel;
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
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? voyagerModel = freezed,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagerModel: freezed == voyagerModel
          ? _value.voyagerModel
          : voyagerModel // ignore: cast_nullable_to_non_nullable
              as VoyagerModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VoyagerModelCopyWith<$Res>? get voyagerModel {
    if (_value.voyagerModel == null) {
      return null;
    }

    return $VoyagerModelCopyWith<$Res>(_value.voyagerModel!, (value) {
      return _then(_value.copyWith(voyagerModel: value) as $Val);
    });
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
      String? errorMessage,
      String? successMessage,
      VoyagerModel? voyagerModel});

  @override
  $VoyagerModelCopyWith<$Res>? get voyagerModel;
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
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? voyagerModel = freezed,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagerModel: freezed == voyagerModel
          ? _value.voyagerModel
          : voyagerModel // ignore: cast_nullable_to_non_nullable
              as VoyagerModel?,
    ));
  }
}

/// @nodoc

class _$_AddVoyagerState implements _AddVoyagerState {
  _$_AddVoyagerState(
      {this.status = Status.initial,
      this.formStatus = FormStatus.initial,
      this.errorMessage,
      this.successMessage,
      this.voyagerModel});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final FormStatus formStatus;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  final VoyagerModel? voyagerModel;

  @override
  String toString() {
    return 'AddVoyagerState(status: $status, formStatus: $formStatus, errorMessage: $errorMessage, successMessage: $successMessage, voyagerModel: $voyagerModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddVoyagerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.voyagerModel, voyagerModel) ||
                other.voyagerModel == voyagerModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, formStatus, errorMessage,
      successMessage, voyagerModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddVoyagerStateCopyWith<_$_AddVoyagerState> get copyWith =>
      __$$_AddVoyagerStateCopyWithImpl<_$_AddVoyagerState>(this, _$identity);
}

abstract class _AddVoyagerState implements AddVoyagerState {
  factory _AddVoyagerState(
      {final Status status,
      final FormStatus formStatus,
      final String? errorMessage,
      final String? successMessage,
      final VoyagerModel? voyagerModel}) = _$_AddVoyagerState;

  @override
  Status get status;
  @override
  FormStatus get formStatus;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  VoyagerModel? get voyagerModel;
  @override
  @JsonKey(ignore: true)
  _$$_AddVoyagerStateCopyWith<_$_AddVoyagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
