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
  FormStatus get formStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  List<String> get categoryTitles => throw _privateConstructorUsedError;
  List<VoyageModel> get voyages => throw _privateConstructorUsedError;
  String get voyageId => throw _privateConstructorUsedError;
  String get expenseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get voyagerIdList => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  VoyagerModel? get voyager => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  VoyageModel? get voyage => throw _privateConstructorUsedError;
  DateTime? get dateAdded => throw _privateConstructorUsedError;
  List<VoyagerModel> get voyagers => throw _privateConstructorUsedError;

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
      FormStatus formStatus,
      String? errorMessage,
      String? successMessage,
      List<String> categoryTitles,
      List<VoyageModel> voyages,
      String voyageId,
      String expenseId,
      String name,
      List<String> voyagerIdList,
      String? category,
      VoyagerModel? voyager,
      double price,
      VoyageModel? voyage,
      DateTime? dateAdded,
      List<VoyagerModel> voyagers});

  $VoyagerModelCopyWith<$Res>? get voyager;
  $VoyageModelCopyWith<$Res>? get voyage;
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
    Object? formStatus = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? categoryTitles = null,
    Object? voyages = null,
    Object? voyageId = null,
    Object? expenseId = null,
    Object? name = null,
    Object? voyagerIdList = null,
    Object? category = freezed,
    Object? voyager = freezed,
    Object? price = null,
    Object? voyage = freezed,
    Object? dateAdded = freezed,
    Object? voyagers = null,
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
      categoryTitles: null == categoryTitles
          ? _value.categoryTitles
          : categoryTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voyages: null == voyages
          ? _value.voyages
          : voyages // ignore: cast_nullable_to_non_nullable
              as List<VoyageModel>,
      voyageId: null == voyageId
          ? _value.voyageId
          : voyageId // ignore: cast_nullable_to_non_nullable
              as String,
      expenseId: null == expenseId
          ? _value.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      voyagerIdList: null == voyagerIdList
          ? _value.voyagerIdList
          : voyagerIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      voyager: freezed == voyager
          ? _value.voyager
          : voyager // ignore: cast_nullable_to_non_nullable
              as VoyagerModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      voyage: freezed == voyage
          ? _value.voyage
          : voyage // ignore: cast_nullable_to_non_nullable
              as VoyageModel?,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voyagers: null == voyagers
          ? _value.voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
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

  @override
  @pragma('vm:prefer-inline')
  $VoyageModelCopyWith<$Res>? get voyage {
    if (_value.voyage == null) {
      return null;
    }

    return $VoyageModelCopyWith<$Res>(_value.voyage!, (value) {
      return _then(_value.copyWith(voyage: value) as $Val);
    });
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
      FormStatus formStatus,
      String? errorMessage,
      String? successMessage,
      List<String> categoryTitles,
      List<VoyageModel> voyages,
      String voyageId,
      String expenseId,
      String name,
      List<String> voyagerIdList,
      String? category,
      VoyagerModel? voyager,
      double price,
      VoyageModel? voyage,
      DateTime? dateAdded,
      List<VoyagerModel> voyagers});

  @override
  $VoyagerModelCopyWith<$Res>? get voyager;
  @override
  $VoyageModelCopyWith<$Res>? get voyage;
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
    Object? formStatus = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
    Object? categoryTitles = null,
    Object? voyages = null,
    Object? voyageId = null,
    Object? expenseId = null,
    Object? name = null,
    Object? voyagerIdList = null,
    Object? category = freezed,
    Object? voyager = freezed,
    Object? price = null,
    Object? voyage = freezed,
    Object? dateAdded = freezed,
    Object? voyagers = null,
  }) {
    return _then(_$_AddExpenseState(
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
      categoryTitles: null == categoryTitles
          ? _value._categoryTitles
          : categoryTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      voyages: null == voyages
          ? _value._voyages
          : voyages // ignore: cast_nullable_to_non_nullable
              as List<VoyageModel>,
      voyageId: null == voyageId
          ? _value.voyageId
          : voyageId // ignore: cast_nullable_to_non_nullable
              as String,
      expenseId: null == expenseId
          ? _value.expenseId
          : expenseId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      voyagerIdList: null == voyagerIdList
          ? _value._voyagerIdList
          : voyagerIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      voyager: freezed == voyager
          ? _value.voyager
          : voyager // ignore: cast_nullable_to_non_nullable
              as VoyagerModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      voyage: freezed == voyage
          ? _value.voyage
          : voyage // ignore: cast_nullable_to_non_nullable
              as VoyageModel?,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voyagers: null == voyagers
          ? _value._voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
    ));
  }
}

/// @nodoc

class _$_AddExpenseState extends _AddExpenseState {
  _$_AddExpenseState(
      {this.status = Status.initial,
      this.formStatus = FormStatus.initial,
      this.errorMessage,
      this.successMessage,
      final List<String> categoryTitles = expenseCategoryList,
      final List<VoyageModel> voyages = const [],
      this.voyageId = '',
      this.expenseId = '',
      this.name = '',
      final List<String> voyagerIdList = const [],
      this.category,
      this.voyager,
      this.price = 0,
      this.voyage,
      this.dateAdded,
      final List<VoyagerModel> voyagers = const []})
      : _categoryTitles = categoryTitles,
        _voyages = voyages,
        _voyagerIdList = voyagerIdList,
        _voyagers = voyagers,
        super._();

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
  final List<String> _categoryTitles;
  @override
  @JsonKey()
  List<String> get categoryTitles {
    if (_categoryTitles is EqualUnmodifiableListView) return _categoryTitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryTitles);
  }

  final List<VoyageModel> _voyages;
  @override
  @JsonKey()
  List<VoyageModel> get voyages {
    if (_voyages is EqualUnmodifiableListView) return _voyages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyages);
  }

  @override
  @JsonKey()
  final String voyageId;
  @override
  @JsonKey()
  final String expenseId;
  @override
  @JsonKey()
  final String name;
  final List<String> _voyagerIdList;
  @override
  @JsonKey()
  List<String> get voyagerIdList {
    if (_voyagerIdList is EqualUnmodifiableListView) return _voyagerIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voyagerIdList);
  }

  @override
  final String? category;
  @override
  final VoyagerModel? voyager;
  @override
  @JsonKey()
  final double price;
  @override
  final VoyageModel? voyage;
  @override
  final DateTime? dateAdded;
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
    return 'AddExpenseState(status: $status, formStatus: $formStatus, errorMessage: $errorMessage, successMessage: $successMessage, categoryTitles: $categoryTitles, voyages: $voyages, voyageId: $voyageId, expenseId: $expenseId, name: $name, voyagerIdList: $voyagerIdList, category: $category, voyager: $voyager, price: $price, voyage: $voyage, dateAdded: $dateAdded, voyagers: $voyagers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddExpenseState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            const DeepCollectionEquality()
                .equals(other._categoryTitles, _categoryTitles) &&
            const DeepCollectionEquality().equals(other._voyages, _voyages) &&
            (identical(other.voyageId, voyageId) ||
                other.voyageId == voyageId) &&
            (identical(other.expenseId, expenseId) ||
                other.expenseId == expenseId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._voyagerIdList, _voyagerIdList) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.voyager, voyager) || other.voyager == voyager) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.voyage, voyage) || other.voyage == voyage) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            const DeepCollectionEquality().equals(other._voyagers, _voyagers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      formStatus,
      errorMessage,
      successMessage,
      const DeepCollectionEquality().hash(_categoryTitles),
      const DeepCollectionEquality().hash(_voyages),
      voyageId,
      expenseId,
      name,
      const DeepCollectionEquality().hash(_voyagerIdList),
      category,
      voyager,
      price,
      voyage,
      dateAdded,
      const DeepCollectionEquality().hash(_voyagers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddExpenseStateCopyWith<_$_AddExpenseState> get copyWith =>
      __$$_AddExpenseStateCopyWithImpl<_$_AddExpenseState>(this, _$identity);
}

abstract class _AddExpenseState extends AddExpenseState {
  factory _AddExpenseState(
      {final Status status,
      final FormStatus formStatus,
      final String? errorMessage,
      final String? successMessage,
      final List<String> categoryTitles,
      final List<VoyageModel> voyages,
      final String voyageId,
      final String expenseId,
      final String name,
      final List<String> voyagerIdList,
      final String? category,
      final VoyagerModel? voyager,
      final double price,
      final VoyageModel? voyage,
      final DateTime? dateAdded,
      final List<VoyagerModel> voyagers}) = _$_AddExpenseState;
  _AddExpenseState._() : super._();

  @override
  Status get status;
  @override
  FormStatus get formStatus;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  List<String> get categoryTitles;
  @override
  List<VoyageModel> get voyages;
  @override
  String get voyageId;
  @override
  String get expenseId;
  @override
  String get name;
  @override
  List<String> get voyagerIdList;
  @override
  String? get category;
  @override
  VoyagerModel? get voyager;
  @override
  double get price;
  @override
  VoyageModel? get voyage;
  @override
  DateTime? get dateAdded;
  @override
  List<VoyagerModel> get voyagers;
  @override
  @JsonKey(ignore: true)
  _$$_AddExpenseStateCopyWith<_$_AddExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}
