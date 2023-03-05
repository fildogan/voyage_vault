// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_voyager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditVoyagerState {
  Status get status => throw _privateConstructorUsedError;
  FormStatus get formStatus => throw _privateConstructorUsedError;
  List<VoyagerModel> get voyagers => throw _privateConstructorUsedError;
  VoyagerModel? get voyager => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String get initialName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditVoyagerStateCopyWith<EditVoyagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditVoyagerStateCopyWith<$Res> {
  factory $EditVoyagerStateCopyWith(
          EditVoyagerState value, $Res Function(EditVoyagerState) then) =
      _$EditVoyagerStateCopyWithImpl<$Res, EditVoyagerState>;
  @useResult
  $Res call(
      {Status status,
      FormStatus formStatus,
      List<VoyagerModel> voyagers,
      VoyagerModel? voyager,
      String? errorMessage,
      String? successMessage,
      String initialName});

  $VoyagerModelCopyWith<$Res>? get voyager;
}

/// @nodoc
class _$EditVoyagerStateCopyWithImpl<$Res, $Val extends EditVoyagerState>
    implements $EditVoyagerStateCopyWith<$Res> {
  _$EditVoyagerStateCopyWithImpl(this._value, this._then);

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
    Object? voyager = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? initialName = null,
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
      voyager: freezed == voyager
          ? _value.voyager
          : voyager // ignore: cast_nullable_to_non_nullable
              as VoyagerModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      initialName: null == initialName
          ? _value.initialName
          : initialName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VoyagerModelCopyWith<$Res>? get voyager {
    if (_value.voyager == null) {
      return null;
    }

    return $VoyagerModelCopyWith<$Res>(_value.voyager!, (value) {
      return _then(_value.copyWith(voyager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EditVoyagerStateCopyWith<$Res>
    implements $EditVoyagerStateCopyWith<$Res> {
  factory _$$_EditVoyagerStateCopyWith(
          _$_EditVoyagerState value, $Res Function(_$_EditVoyagerState) then) =
      __$$_EditVoyagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      FormStatus formStatus,
      List<VoyagerModel> voyagers,
      VoyagerModel? voyager,
      String? errorMessage,
      String? successMessage,
      String initialName});

  @override
  $VoyagerModelCopyWith<$Res>? get voyager;
}

/// @nodoc
class __$$_EditVoyagerStateCopyWithImpl<$Res>
    extends _$EditVoyagerStateCopyWithImpl<$Res, _$_EditVoyagerState>
    implements _$$_EditVoyagerStateCopyWith<$Res> {
  __$$_EditVoyagerStateCopyWithImpl(
      _$_EditVoyagerState _value, $Res Function(_$_EditVoyagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? formStatus = null,
    Object? voyagers = null,
    Object? voyager = freezed,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? initialName = null,
  }) {
    return _then(_$_EditVoyagerState(
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
      voyager: freezed == voyager
          ? _value.voyager
          : voyager // ignore: cast_nullable_to_non_nullable
              as VoyagerModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      initialName: null == initialName
          ? _value.initialName
          : initialName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditVoyagerState extends _EditVoyagerState {
  _$_EditVoyagerState(
      {this.status = Status.initial,
      this.formStatus = FormStatus.initial,
      final List<VoyagerModel> voyagers = const [],
      this.voyager,
      this.errorMessage,
      this.successMessage,
      this.initialName = ''})
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
  final VoyagerModel? voyager;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;
  @override
  @JsonKey()
  final String initialName;

  @override
  String toString() {
    return 'EditVoyagerState(status: $status, formStatus: $formStatus, voyagers: $voyagers, voyager: $voyager, errorMessage: $errorMessage, successMessage: $successMessage, initialName: $initialName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditVoyagerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            const DeepCollectionEquality().equals(other._voyagers, _voyagers) &&
            (identical(other.voyager, voyager) || other.voyager == voyager) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.initialName, initialName) ||
                other.initialName == initialName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      formStatus,
      const DeepCollectionEquality().hash(_voyagers),
      voyager,
      errorMessage,
      successMessage,
      initialName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditVoyagerStateCopyWith<_$_EditVoyagerState> get copyWith =>
      __$$_EditVoyagerStateCopyWithImpl<_$_EditVoyagerState>(this, _$identity);
}

abstract class _EditVoyagerState extends EditVoyagerState {
  factory _EditVoyagerState(
      {final Status status,
      final FormStatus formStatus,
      final List<VoyagerModel> voyagers,
      final VoyagerModel? voyager,
      final String? errorMessage,
      final String? successMessage,
      final String initialName}) = _$_EditVoyagerState;
  _EditVoyagerState._() : super._();

  @override
  Status get status;
  @override
  FormStatus get formStatus;
  @override
  List<VoyagerModel> get voyagers;
  @override
  VoyagerModel? get voyager;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  String get initialName;
  @override
  @JsonKey(ignore: true)
  _$$_EditVoyagerStateCopyWith<_$_EditVoyagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
