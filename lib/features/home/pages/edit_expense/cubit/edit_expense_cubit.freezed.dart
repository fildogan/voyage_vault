// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_expense_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditExpenseState {
  Status get status => throw _privateConstructorUsedError;
  FormStatus get formStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  List<String> get categoryTitles => throw _privateConstructorUsedError;
  List<VoyageModel> get voyages =>
      throw _privateConstructorUsedError; //TODO: delete list voyagetitles
  List<String> get voyageTitles => throw _privateConstructorUsedError;
  String get voyageId => throw _privateConstructorUsedError;
  String get expenseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get voyagerIdList => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  VoyagerModel? get voyager => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  VoyageModel? get voyage => throw _privateConstructorUsedError;
  ExpenseModel? get expense => throw _privateConstructorUsedError;
  String get voyageTitle => throw _privateConstructorUsedError;
  DateTime? get dateAdded => throw _privateConstructorUsedError;
  List<VoyagerModel> get voyagers => throw _privateConstructorUsedError;
  String get initialVoyagerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditExpenseStateCopyWith<EditExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditExpenseStateCopyWith<$Res> {
  factory $EditExpenseStateCopyWith(
          EditExpenseState value, $Res Function(EditExpenseState) then) =
      _$EditExpenseStateCopyWithImpl<$Res, EditExpenseState>;
  @useResult
  $Res call(
      {Status status,
      FormStatus formStatus,
      String? errorMessage,
      String? successMessage,
      List<String> categoryTitles,
      List<VoyageModel> voyages,
      List<String> voyageTitles,
      String voyageId,
      String expenseId,
      String name,
      List<String> voyagerIdList,
      String category,
      VoyagerModel? voyager,
      double price,
      VoyageModel? voyage,
      ExpenseModel? expense,
      String voyageTitle,
      DateTime? dateAdded,
      List<VoyagerModel> voyagers,
      String initialVoyagerId});

  $VoyagerModelCopyWith<$Res>? get voyager;
  $VoyageModelCopyWith<$Res>? get voyage;
  $ExpenseModelCopyWith<$Res>? get expense;
}

/// @nodoc
class _$EditExpenseStateCopyWithImpl<$Res, $Val extends EditExpenseState>
    implements $EditExpenseStateCopyWith<$Res> {
  _$EditExpenseStateCopyWithImpl(this._value, this._then);

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
    Object? voyageTitles = null,
    Object? voyageId = null,
    Object? expenseId = null,
    Object? name = null,
    Object? voyagerIdList = null,
    Object? category = null,
    Object? voyager = freezed,
    Object? price = null,
    Object? voyage = freezed,
    Object? expense = freezed,
    Object? voyageTitle = null,
    Object? dateAdded = freezed,
    Object? voyagers = null,
    Object? initialVoyagerId = null,
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
      voyageTitles: null == voyageTitles
          ? _value.voyageTitles
          : voyageTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
      expense: freezed == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as ExpenseModel?,
      voyageTitle: null == voyageTitle
          ? _value.voyageTitle
          : voyageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voyagers: null == voyagers
          ? _value.voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
      initialVoyagerId: null == initialVoyagerId
          ? _value.initialVoyagerId
          : initialVoyagerId // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $ExpenseModelCopyWith<$Res>? get expense {
    if (_value.expense == null) {
      return null;
    }

    return $ExpenseModelCopyWith<$Res>(_value.expense!, (value) {
      return _then(_value.copyWith(expense: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EditExpenseStateCopyWith<$Res>
    implements $EditExpenseStateCopyWith<$Res> {
  factory _$$_EditExpenseStateCopyWith(
          _$_EditExpenseState value, $Res Function(_$_EditExpenseState) then) =
      __$$_EditExpenseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      FormStatus formStatus,
      String? errorMessage,
      String? successMessage,
      List<String> categoryTitles,
      List<VoyageModel> voyages,
      List<String> voyageTitles,
      String voyageId,
      String expenseId,
      String name,
      List<String> voyagerIdList,
      String category,
      VoyagerModel? voyager,
      double price,
      VoyageModel? voyage,
      ExpenseModel? expense,
      String voyageTitle,
      DateTime? dateAdded,
      List<VoyagerModel> voyagers,
      String initialVoyagerId});

  @override
  $VoyagerModelCopyWith<$Res>? get voyager;
  @override
  $VoyageModelCopyWith<$Res>? get voyage;
  @override
  $ExpenseModelCopyWith<$Res>? get expense;
}

/// @nodoc
class __$$_EditExpenseStateCopyWithImpl<$Res>
    extends _$EditExpenseStateCopyWithImpl<$Res, _$_EditExpenseState>
    implements _$$_EditExpenseStateCopyWith<$Res> {
  __$$_EditExpenseStateCopyWithImpl(
      _$_EditExpenseState _value, $Res Function(_$_EditExpenseState) _then)
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
    Object? voyageTitles = null,
    Object? voyageId = null,
    Object? expenseId = null,
    Object? name = null,
    Object? voyagerIdList = null,
    Object? category = null,
    Object? voyager = freezed,
    Object? price = null,
    Object? voyage = freezed,
    Object? expense = freezed,
    Object? voyageTitle = null,
    Object? dateAdded = freezed,
    Object? voyagers = null,
    Object? initialVoyagerId = null,
  }) {
    return _then(_$_EditExpenseState(
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
      voyageTitles: null == voyageTitles
          ? _value._voyageTitles
          : voyageTitles // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
      expense: freezed == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as ExpenseModel?,
      voyageTitle: null == voyageTitle
          ? _value.voyageTitle
          : voyageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voyagers: null == voyagers
          ? _value._voyagers
          : voyagers // ignore: cast_nullable_to_non_nullable
              as List<VoyagerModel>,
      initialVoyagerId: null == initialVoyagerId
          ? _value.initialVoyagerId
          : initialVoyagerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditExpenseState extends _EditExpenseState {
  _$_EditExpenseState(
      {this.status = Status.initial,
      this.formStatus = FormStatus.initial,
      this.errorMessage,
      this.successMessage,
      final List<String> categoryTitles = expenseCategoryList,
      final List<VoyageModel> voyages = const [],
      final List<String> voyageTitles = const [],
      this.voyageId = '',
      this.expenseId = '',
      this.name = '',
      final List<String> voyagerIdList = const [],
      this.category = '',
      this.voyager,
      this.price = 0,
      this.voyage,
      this.expense,
      this.voyageTitle = '',
      this.dateAdded,
      final List<VoyagerModel> voyagers = const [],
      this.initialVoyagerId = ''})
      : _categoryTitles = categoryTitles,
        _voyages = voyages,
        _voyageTitles = voyageTitles,
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

//TODO: delete list voyagetitles
  final List<String> _voyageTitles;
//TODO: delete list voyagetitles
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
  @JsonKey()
  final String category;
  @override
  final VoyagerModel? voyager;
  @override
  @JsonKey()
  final double price;
  @override
  final VoyageModel? voyage;
  @override
  final ExpenseModel? expense;
  @override
  @JsonKey()
  final String voyageTitle;
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
  @JsonKey()
  final String initialVoyagerId;

  @override
  String toString() {
    return 'EditExpenseState(status: $status, formStatus: $formStatus, errorMessage: $errorMessage, successMessage: $successMessage, categoryTitles: $categoryTitles, voyages: $voyages, voyageTitles: $voyageTitles, voyageId: $voyageId, expenseId: $expenseId, name: $name, voyagerIdList: $voyagerIdList, category: $category, voyager: $voyager, price: $price, voyage: $voyage, expense: $expense, voyageTitle: $voyageTitle, dateAdded: $dateAdded, voyagers: $voyagers, initialVoyagerId: $initialVoyagerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditExpenseState &&
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
            const DeepCollectionEquality()
                .equals(other._voyageTitles, _voyageTitles) &&
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
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.voyageTitle, voyageTitle) ||
                other.voyageTitle == voyageTitle) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            const DeepCollectionEquality().equals(other._voyagers, _voyagers) &&
            (identical(other.initialVoyagerId, initialVoyagerId) ||
                other.initialVoyagerId == initialVoyagerId));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        formStatus,
        errorMessage,
        successMessage,
        const DeepCollectionEquality().hash(_categoryTitles),
        const DeepCollectionEquality().hash(_voyages),
        const DeepCollectionEquality().hash(_voyageTitles),
        voyageId,
        expenseId,
        name,
        const DeepCollectionEquality().hash(_voyagerIdList),
        category,
        voyager,
        price,
        voyage,
        expense,
        voyageTitle,
        dateAdded,
        const DeepCollectionEquality().hash(_voyagers),
        initialVoyagerId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditExpenseStateCopyWith<_$_EditExpenseState> get copyWith =>
      __$$_EditExpenseStateCopyWithImpl<_$_EditExpenseState>(this, _$identity);
}

abstract class _EditExpenseState extends EditExpenseState {
  factory _EditExpenseState(
      {final Status status,
      final FormStatus formStatus,
      final String? errorMessage,
      final String? successMessage,
      final List<String> categoryTitles,
      final List<VoyageModel> voyages,
      final List<String> voyageTitles,
      final String voyageId,
      final String expenseId,
      final String name,
      final List<String> voyagerIdList,
      final String category,
      final VoyagerModel? voyager,
      final double price,
      final VoyageModel? voyage,
      final ExpenseModel? expense,
      final String voyageTitle,
      final DateTime? dateAdded,
      final List<VoyagerModel> voyagers,
      final String initialVoyagerId}) = _$_EditExpenseState;
  _EditExpenseState._() : super._();

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
  @override //TODO: delete list voyagetitles
  List<String> get voyageTitles;
  @override
  String get voyageId;
  @override
  String get expenseId;
  @override
  String get name;
  @override
  List<String> get voyagerIdList;
  @override
  String get category;
  @override
  VoyagerModel? get voyager;
  @override
  double get price;
  @override
  VoyageModel? get voyage;
  @override
  ExpenseModel? get expense;
  @override
  String get voyageTitle;
  @override
  DateTime? get dateAdded;
  @override
  List<VoyagerModel> get voyagers;
  @override
  String get initialVoyagerId;
  @override
  @JsonKey(ignore: true)
  _$$_EditExpenseStateCopyWith<_$_EditExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}
