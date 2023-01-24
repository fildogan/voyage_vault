// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voyages_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoyagesState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<VoyageModel> get voyages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoyagesStateCopyWith<VoyagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoyagesStateCopyWith<$Res> {
  factory $VoyagesStateCopyWith(
          VoyagesState value, $Res Function(VoyagesState) then) =
      _$VoyagesStateCopyWithImpl<$Res, VoyagesState>;
  @useResult
  $Res call({Status status, String? errorMessage, List<VoyageModel> voyages});
}

/// @nodoc
class _$VoyagesStateCopyWithImpl<$Res, $Val extends VoyagesState>
    implements $VoyagesStateCopyWith<$Res> {
  _$VoyagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? voyages = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyages: null == voyages
          ? _value.voyages
          : voyages // ignore: cast_nullable_to_non_nullable
              as List<VoyageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VoyagesStateCopyWith<$Res>
    implements $VoyagesStateCopyWith<$Res> {
  factory _$$_VoyagesStateCopyWith(
          _$_VoyagesState value, $Res Function(_$_VoyagesState) then) =
      __$$_VoyagesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? errorMessage, List<VoyageModel> voyages});
}

/// @nodoc
class __$$_VoyagesStateCopyWithImpl<$Res>
    extends _$VoyagesStateCopyWithImpl<$Res, _$_VoyagesState>
    implements _$$_VoyagesStateCopyWith<$Res> {
  __$$_VoyagesStateCopyWithImpl(
      _$_VoyagesState _value, $Res Function(_$_VoyagesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? voyages = null,
  }) {
    return _then(_$_VoyagesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyages: null == voyages
          ? _value._voyages
          : voyages // ignore: cast_nullable_to_non_nullable
              as List<VoyageModel>,
    ));
  }
}

/// @nodoc

class _$_VoyagesState implements _VoyagesState {
  _$_VoyagesState(
      {this.status = Status.initial,
      this.errorMessage,
      final List<VoyageModel> voyages = const []})
      : _voyages = voyages;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  final List<VoyageModel> _voyages;
  @override
  @JsonKey()
  List<VoyageModel> get voyages {
    if (_voyages is EqualUnmodifiableListView) return _voyages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyages);
  }

  @override
  String toString() {
    return 'VoyagesState(status: $status, errorMessage: $errorMessage, voyages: $voyages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoyagesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._voyages, _voyages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_voyages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoyagesStateCopyWith<_$_VoyagesState> get copyWith =>
      __$$_VoyagesStateCopyWithImpl<_$_VoyagesState>(this, _$identity);
}

abstract class _VoyagesState implements VoyagesState {
  factory _VoyagesState(
      {final Status status,
      final String? errorMessage,
      final List<VoyageModel> voyages}) = _$_VoyagesState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  List<VoyageModel> get voyages;
  @override
  @JsonKey(ignore: true)
  _$$_VoyagesStateCopyWith<_$_VoyagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
