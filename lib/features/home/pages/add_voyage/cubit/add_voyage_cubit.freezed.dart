// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_voyage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddVoyageState {
  Status get status => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<String> get voyageTitles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddVoyageStateCopyWith<AddVoyageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVoyageStateCopyWith<$Res> {
  factory $AddVoyageStateCopyWith(
          AddVoyageState value, $Res Function(AddVoyageState) then) =
      _$AddVoyageStateCopyWithImpl<$Res, AddVoyageState>;
  @useResult
  $Res call(
      {Status status,
      bool saved,
      String? errorMessage,
      List<String> voyageTitles});
}

/// @nodoc
class _$AddVoyageStateCopyWithImpl<$Res, $Val extends AddVoyageState>
    implements $AddVoyageStateCopyWith<$Res> {
  _$AddVoyageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? saved = null,
    Object? errorMessage = freezed,
    Object? voyageTitles = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyageTitles: null == voyageTitles
          ? _value.voyageTitles
          : voyageTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddVoyageStateCopyWith<$Res>
    implements $AddVoyageStateCopyWith<$Res> {
  factory _$$_AddVoyageStateCopyWith(
          _$_AddVoyageState value, $Res Function(_$_AddVoyageState) then) =
      __$$_AddVoyageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      bool saved,
      String? errorMessage,
      List<String> voyageTitles});
}

/// @nodoc
class __$$_AddVoyageStateCopyWithImpl<$Res>
    extends _$AddVoyageStateCopyWithImpl<$Res, _$_AddVoyageState>
    implements _$$_AddVoyageStateCopyWith<$Res> {
  __$$_AddVoyageStateCopyWithImpl(
      _$_AddVoyageState _value, $Res Function(_$_AddVoyageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? saved = null,
    Object? errorMessage = freezed,
    Object? voyageTitles = null,
  }) {
    return _then(_$_AddVoyageState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyageTitles: null == voyageTitles
          ? _value._voyageTitles
          : voyageTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AddVoyageState implements _AddVoyageState {
  _$_AddVoyageState(
      {this.status = Status.initial,
      this.saved = false,
      this.errorMessage,
      final List<String> voyageTitles = const []})
      : _voyageTitles = voyageTitles;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final bool saved;
  @override
  final String? errorMessage;
  final List<String> _voyageTitles;
  @override
  @JsonKey()
  List<String> get voyageTitles {
    if (_voyageTitles is EqualUnmodifiableListView) return _voyageTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyageTitles);
  }

  @override
  String toString() {
    return 'AddVoyageState(status: $status, saved: $saved, errorMessage: $errorMessage, voyageTitles: $voyageTitles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddVoyageState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._voyageTitles, _voyageTitles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, saved, errorMessage,
      const DeepCollectionEquality().hash(_voyageTitles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddVoyageStateCopyWith<_$_AddVoyageState> get copyWith =>
      __$$_AddVoyageStateCopyWithImpl<_$_AddVoyageState>(this, _$identity);
}

abstract class _AddVoyageState implements AddVoyageState {
  factory _AddVoyageState(
      {final Status status,
      final bool saved,
      final String? errorMessage,
      final List<String> voyageTitles}) = _$_AddVoyageState;

  @override
  Status get status;
  @override
  bool get saved;
  @override
  String? get errorMessage;
  @override
  List<String> get voyageTitles;
  @override
  @JsonKey(ignore: true)
  _$$_AddVoyageStateCopyWith<_$_AddVoyageState> get copyWith =>
      throw _privateConstructorUsedError;
}
