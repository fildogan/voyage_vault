// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voyage_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoyageDetailsState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  VoyageModel? get voyageModel => throw _privateConstructorUsedError;
  List<ExpenseModel> get expenses => throw _privateConstructorUsedError;
  List<VoyagerModel> get voyagers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoyageDetailsStateCopyWith<VoyageDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoyageDetailsStateCopyWith<$Res> {
  factory $VoyageDetailsStateCopyWith(
          VoyageDetailsState value, $Res Function(VoyageDetailsState) then) =
      _$VoyageDetailsStateCopyWithImpl<$Res, VoyageDetailsState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      VoyageModel? voyageModel,
      List<ExpenseModel> expenses,
      List<VoyagerModel> voyagers});

  $VoyageModelCopyWith<$Res>? get voyageModel;
}

/// @nodoc
class _$VoyageDetailsStateCopyWithImpl<$Res, $Val extends VoyageDetailsState>
    implements $VoyageDetailsStateCopyWith<$Res> {
  _$VoyageDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? voyageModel = freezed,
    Object? expenses = null,
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
      voyageModel: freezed == voyageModel
          ? _value.voyageModel
          : voyageModel // ignore: cast_nullable_to_non_nullable
              as VoyageModel?,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>,
      voyagers: null == voyagers
          ? _value.voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VoyageModelCopyWith<$Res>? get voyageModel {
    if (_value.voyageModel == null) {
      return null;
    }

    return $VoyageModelCopyWith<$Res>(_value.voyageModel!, (value) {
      return _then(_value.copyWith(voyageModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VoyageDetailsStateCopyWith<$Res>
    implements $VoyageDetailsStateCopyWith<$Res> {
  factory _$$_VoyageDetailsStateCopyWith(_$_VoyageDetailsState value,
          $Res Function(_$_VoyageDetailsState) then) =
      __$$_VoyageDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      VoyageModel? voyageModel,
      List<ExpenseModel> expenses,
      List<VoyagerModel> voyagers});

  @override
  $VoyageModelCopyWith<$Res>? get voyageModel;
}

/// @nodoc
class __$$_VoyageDetailsStateCopyWithImpl<$Res>
    extends _$VoyageDetailsStateCopyWithImpl<$Res, _$_VoyageDetailsState>
    implements _$$_VoyageDetailsStateCopyWith<$Res> {
  __$$_VoyageDetailsStateCopyWithImpl(
      _$_VoyageDetailsState _value, $Res Function(_$_VoyageDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? voyageModel = freezed,
    Object? expenses = null,
    Object? voyagers = null,
  }) {
    return _then(_$_VoyageDetailsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      voyageModel: freezed == voyageModel
          ? _value.voyageModel
          : voyageModel // ignore: cast_nullable_to_non_nullable
              as VoyageModel?,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>,
      voyagers: null == voyagers
          ? _value._voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
    ));
  }
}

/// @nodoc

class _$_VoyageDetailsState implements _VoyageDetailsState {
  _$_VoyageDetailsState(
      {this.status = Status.initial,
      this.errorMessage,
      this.voyageModel,
      final List<ExpenseModel> expenses = const [],
      final List<VoyagerModel> voyagers = const []})
      : _expenses = expenses,
        _voyagers = voyagers;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  @override
  final VoyageModel? voyageModel;
  final List<ExpenseModel> _expenses;
  @override
  @JsonKey()
  List<ExpenseModel> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

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
    return 'VoyageDetailsState(status: $status, errorMessage: $errorMessage, voyageModel: $voyageModel, expenses: $expenses, voyagers: $voyagers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoyageDetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.voyageModel, voyageModel) ||
                other.voyageModel == voyageModel) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._voyagers, _voyagers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      voyageModel,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_voyagers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoyageDetailsStateCopyWith<_$_VoyageDetailsState> get copyWith =>
      __$$_VoyageDetailsStateCopyWithImpl<_$_VoyageDetailsState>(
          this, _$identity);
}

abstract class _VoyageDetailsState implements VoyageDetailsState {
  factory _VoyageDetailsState(
      {final Status status,
      final String? errorMessage,
      final VoyageModel? voyageModel,
      final List<ExpenseModel> expenses,
      final List<VoyagerModel> voyagers}) = _$_VoyageDetailsState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  VoyageModel? get voyageModel;
  @override
  List<ExpenseModel> get expenses;
  @override
  List<VoyagerModel> get voyagers;
  @override
  @JsonKey(ignore: true)
  _$$_VoyageDetailsStateCopyWith<_$_VoyageDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
