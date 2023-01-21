// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpenseModel {
  String get id => throw _privateConstructorUsedError;
  String get voyageId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) then) =
      _$ExpenseModelCopyWithImpl<$Res, ExpenseModel>;
  @useResult
  $Res call(
      {String id, String voyageId, String name, String category, double price});
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res, $Val extends ExpenseModel>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voyageId = null,
    Object? name = null,
    Object? category = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voyageId: null == voyageId
          ? _value.voyageId
          : voyageId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseModelCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$$_ExpenseModelCopyWith(
          _$_ExpenseModel value, $Res Function(_$_ExpenseModel) then) =
      __$$_ExpenseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String voyageId, String name, String category, double price});
}

/// @nodoc
class __$$_ExpenseModelCopyWithImpl<$Res>
    extends _$ExpenseModelCopyWithImpl<$Res, _$_ExpenseModel>
    implements _$$_ExpenseModelCopyWith<$Res> {
  __$$_ExpenseModelCopyWithImpl(
      _$_ExpenseModel _value, $Res Function(_$_ExpenseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voyageId = null,
    Object? name = null,
    Object? category = null,
    Object? price = null,
  }) {
    return _then(_$_ExpenseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voyageId: null == voyageId
          ? _value.voyageId
          : voyageId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ExpenseModel implements _ExpenseModel {
  const _$_ExpenseModel(
      {required this.id,
      required this.voyageId,
      required this.name,
      required this.category,
      required this.price});

  @override
  final String id;
  @override
  final String voyageId;
  @override
  final String name;
  @override
  final String category;
  @override
  final double price;

  @override
  String toString() {
    return 'ExpenseModel(id: $id, voyageId: $voyageId, name: $name, category: $category, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.voyageId, voyageId) ||
                other.voyageId == voyageId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, voyageId, name, category, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseModelCopyWith<_$_ExpenseModel> get copyWith =>
      __$$_ExpenseModelCopyWithImpl<_$_ExpenseModel>(this, _$identity);
}

abstract class _ExpenseModel implements ExpenseModel {
  const factory _ExpenseModel(
      {required final String id,
      required final String voyageId,
      required final String name,
      required final String category,
      required final double price}) = _$_ExpenseModel;

  @override
  String get id;
  @override
  String get voyageId;
  @override
  String get name;
  @override
  String get category;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseModelCopyWith<_$_ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
