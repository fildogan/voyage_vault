// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voyager_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoyagerListState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<VoyagerModel> get voyagers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoyagerListStateCopyWith<VoyagerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoyagerListStateCopyWith<$Res> {
  factory $VoyagerListStateCopyWith(
          VoyagerListState value, $Res Function(VoyagerListState) then) =
      _$VoyagerListStateCopyWithImpl<$Res, VoyagerListState>;
  @useResult
  $Res call({Status status, String? errorMessage, List<VoyagerModel> voyagers});
}

/// @nodoc
class _$VoyagerListStateCopyWithImpl<$Res, $Val extends VoyagerListState>
    implements $VoyagerListStateCopyWith<$Res> {
  _$VoyagerListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? voyagers = null,
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
      voyagers: null == voyagers
          ? _value.voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VoyagerListStateCopyWith<$Res>
    implements $VoyagerListStateCopyWith<$Res> {
  factory _$$_VoyagerListStateCopyWith(
          _$_VoyagerListState value, $Res Function(_$_VoyagerListState) then) =
      __$$_VoyagerListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? errorMessage, List<VoyagerModel> voyagers});
}

/// @nodoc
class __$$_VoyagerListStateCopyWithImpl<$Res>
    extends _$VoyagerListStateCopyWithImpl<$Res, _$_VoyagerListState>
    implements _$$_VoyagerListStateCopyWith<$Res> {
  __$$_VoyagerListStateCopyWithImpl(
      _$_VoyagerListState _value, $Res Function(_$_VoyagerListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? voyagers = null,
  }) {
    return _then(_$_VoyagerListState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyagers: null == voyagers
          ? _value._voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
    ));
  }
}

/// @nodoc

class _$_VoyagerListState implements _VoyagerListState {
  const _$_VoyagerListState(
      {this.status = Status.initial,
      this.errorMessage,
      final List<VoyagerModel> voyagers = const []})
      : _voyagers = voyagers;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  final List<VoyagerModel> _voyagers;
  @override
  @JsonKey()
  List<VoyagerModel> get voyagers {
    if (_voyagers is EqualUnmodifiableListView) return _voyagers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyagers);
  }

  @override
  String toString() {
    return 'VoyagerListState(status: $status, errorMessage: $errorMessage, voyagers: $voyagers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoyagerListState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._voyagers, _voyagers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_voyagers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoyagerListStateCopyWith<_$_VoyagerListState> get copyWith =>
      __$$_VoyagerListStateCopyWithImpl<_$_VoyagerListState>(this, _$identity);
}

abstract class _VoyagerListState implements VoyagerListState {
  const factory _VoyagerListState(
      {final Status status,
      final String? errorMessage,
      final List<VoyagerModel> voyagers}) = _$_VoyagerListState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  List<VoyagerModel> get voyagers;
  @override
  @JsonKey(ignore: true)
  _$$_VoyagerListStateCopyWith<_$_VoyagerListState> get copyWith =>
      throw _privateConstructorUsedError;
}
