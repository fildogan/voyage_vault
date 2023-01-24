// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_expense_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddExpenseState {
  Status get status => throw _privateConstructorUsedError;
  bool get saved => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<String> get categoryTitles => throw _privateConstructorUsedError;
  List<String> get voyageTitles => throw _privateConstructorUsedError;
  String get voyageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddExpenseStateCopyWith<AddExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddExpenseStateCopyWith<$Res> {
  factory $AddExpenseStateCopyWith(
          AddExpenseState value, $Res Function(AddExpenseState) then) =
      _$AddExpenseStateCopyWithImpl<$Res, AddExpenseState>;
  @useResult
  $Res call(
      {Status status,
      bool saved,
      String? errorMessage,
      List<String> categoryTitles,
      List<String> voyageTitles,
      String voyageId});
}

/// @nodoc
class _$AddExpenseStateCopyWithImpl<$Res, $Val extends AddExpenseState>
    implements $AddExpenseStateCopyWith<$Res> {
  _$AddExpenseStateCopyWithImpl(this._value, this._then);

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
    Object? categoryTitles = null,
    Object? voyageTitles = null,
    Object? voyageId = null,
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
      categoryTitles: null == categoryTitles
          ? _value.categoryTitles
          : categoryTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voyageTitles: null == voyageTitles
          ? _value.voyageTitles
          : voyageTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voyageId: null == voyageId
          ? _value.voyageId
          : voyageId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddExpenseStateCopyWith<$Res>
    implements $AddExpenseStateCopyWith<$Res> {
  factory _$$_AddExpenseStateCopyWith(
          _$_AddExpenseState value, $Res Function(_$_AddExpenseState) then) =
      __$$_AddExpenseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      bool saved,
      String? errorMessage,
      List<String> categoryTitles,
      List<String> voyageTitles,
      String voyageId});
}

/// @nodoc
class __$$_AddExpenseStateCopyWithImpl<$Res>
    extends _$AddExpenseStateCopyWithImpl<$Res, _$_AddExpenseState>
    implements _$$_AddExpenseStateCopyWith<$Res> {
  __$$_AddExpenseStateCopyWithImpl(
      _$_AddExpenseState _value, $Res Function(_$_AddExpenseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? saved = null,
    Object? errorMessage = freezed,
    Object? categoryTitles = null,
    Object? voyageTitles = null,
    Object? voyageId = null,
  }) {
    return _then(_$_AddExpenseState(
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
      categoryTitles: null == categoryTitles
          ? _value._categoryTitles
          : categoryTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voyageTitles: null == voyageTitles
          ? _value._voyageTitles
          : voyageTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voyageId: null == voyageId
          ? _value.voyageId
          : voyageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddExpenseState implements _AddExpenseState {
  _$_AddExpenseState(
      {this.status = Status.initial,
      this.saved = false,
      this.errorMessage,
      final List<String> categoryTitles = const [],
      final List<String> voyageTitles = const [],
      this.voyageId = ''})
      : _categoryTitles = categoryTitles,
        _voyageTitles = voyageTitles;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final bool saved;
  @override
  final String? errorMessage;
  final List<String> _categoryTitles;
  @override
  @JsonKey()
  List<String> get categoryTitles {
    if (_categoryTitles is EqualUnmodifiableListView) return _categoryTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryTitles);
  }

  final List<String> _voyageTitles;
  @override
  @JsonKey()
  List<String> get voyageTitles {
    if (_voyageTitles is EqualUnmodifiableListView) return _voyageTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyageTitles);
  }

  @override
  @JsonKey()
  final String voyageId;

  @override
  String toString() {
    return 'AddExpenseState(status: $status, saved: $saved, errorMessage: $errorMessage, categoryTitles: $categoryTitles, voyageTitles: $voyageTitles, voyageId: $voyageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddExpenseState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._categoryTitles, _categoryTitles) &&
            const DeepCollectionEquality()
                .equals(other._voyageTitles, _voyageTitles) &&
            (identical(other.voyageId, voyageId) ||
                other.voyageId == voyageId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      saved,
      errorMessage,
      const DeepCollectionEquality().hash(_categoryTitles),
      const DeepCollectionEquality().hash(_voyageTitles),
      voyageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddExpenseStateCopyWith<_$_AddExpenseState> get copyWith =>
      __$$_AddExpenseStateCopyWithImpl<_$_AddExpenseState>(this, _$identity);
}

abstract class _AddExpenseState implements AddExpenseState {
  factory _AddExpenseState(
      {final Status status,
      final bool saved,
      final String? errorMessage,
      final List<String> categoryTitles,
      final List<String> voyageTitles,
      final String voyageId}) = _$_AddExpenseState;

  @override
  Status get status;
  @override
  bool get saved;
  @override
  String? get errorMessage;
  @override
  List<String> get categoryTitles;
  @override
  List<String> get voyageTitles;
  @override
  String get voyageId;
  @override
  @JsonKey(ignore: true)
  _$$_AddExpenseStateCopyWith<_$_AddExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}
