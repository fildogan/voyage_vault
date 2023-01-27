// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voyage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoyageModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoyageModelCopyWith<VoyageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoyageModelCopyWith<$Res> {
  factory $VoyageModelCopyWith(
          VoyageModel value, $Res Function(VoyageModel) then) =
      _$VoyageModelCopyWithImpl<$Res, VoyageModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startDate,
      DateTime endDate,
      String location,
      String description,
      double budget});
}

/// @nodoc
class _$VoyageModelCopyWithImpl<$Res, $Val extends VoyageModel>
    implements $VoyageModelCopyWith<$Res> {
  _$VoyageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? description = null,
    Object? budget = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VoyageModelCopyWith<$Res>
    implements $VoyageModelCopyWith<$Res> {
  factory _$$_VoyageModelCopyWith(
          _$_VoyageModel value, $Res Function(_$_VoyageModel) then) =
      __$$_VoyageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime startDate,
      DateTime endDate,
      String location,
      String description,
      double budget});
}

/// @nodoc
class __$$_VoyageModelCopyWithImpl<$Res>
    extends _$VoyageModelCopyWithImpl<$Res, _$_VoyageModel>
    implements _$$_VoyageModelCopyWith<$Res> {
  __$$_VoyageModelCopyWithImpl(
      _$_VoyageModel _value, $Res Function(_$_VoyageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? description = null,
    Object? budget = null,
  }) {
    return _then(_$_VoyageModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_VoyageModel extends _VoyageModel {
  const _$_VoyageModel(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.description,
      required this.budget})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String location;
  @override
  final String description;
  @override
  final double budget;

  @override
  String toString() {
    return 'VoyageModel(id: $id, title: $title, startDate: $startDate, endDate: $endDate, location: $location, description: $description, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoyageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, startDate, endDate,
      location, description, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoyageModelCopyWith<_$_VoyageModel> get copyWith =>
      __$$_VoyageModelCopyWithImpl<_$_VoyageModel>(this, _$identity);
}

abstract class _VoyageModel extends VoyageModel {
  const factory _VoyageModel(
      {required final String id,
      required final String title,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String location,
      required final String description,
      required final double budget}) = _$_VoyageModel;
  const _VoyageModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get location;
  @override
  String get description;
  @override
  double get budget;
  @override
  @JsonKey(ignore: true)
  _$$_VoyageModelCopyWith<_$_VoyageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
