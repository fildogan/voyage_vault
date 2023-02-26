// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_page_content_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPageContentState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<QuoteModel> get quotes => throw _privateConstructorUsedError;
  QuoteModel? get chosenQuote => throw _privateConstructorUsedError;
  bool get closed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPageContentStateCopyWith<AddPageContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPageContentStateCopyWith<$Res> {
  factory $AddPageContentStateCopyWith(
          AddPageContentState value, $Res Function(AddPageContentState) then) =
      _$AddPageContentStateCopyWithImpl<$Res, AddPageContentState>;
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      List<QuoteModel> quotes,
      QuoteModel? chosenQuote,
      bool closed});

  $QuoteModelCopyWith<$Res>? get chosenQuote;
}

/// @nodoc
class _$AddPageContentStateCopyWithImpl<$Res, $Val extends AddPageContentState>
    implements $AddPageContentStateCopyWith<$Res> {
  _$AddPageContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? quotes = null,
    Object? chosenQuote = freezed,
    Object? closed = null,
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
      quotes: null == quotes
          ? _value.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<QuoteModel>,
      chosenQuote: freezed == chosenQuote
          ? _value.chosenQuote
          : chosenQuote // ignore: cast_nullable_to_non_nullable
              as QuoteModel?,
      closed: null == closed
          ? _value.closed
          : closed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteModelCopyWith<$Res>? get chosenQuote {
    if (_value.chosenQuote == null) {
      return null;
    }

    return $QuoteModelCopyWith<$Res>(_value.chosenQuote!, (value) {
      return _then(_value.copyWith(chosenQuote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddPageContentStateCopyWith<$Res>
    implements $AddPageContentStateCopyWith<$Res> {
  factory _$$_AddPageContentStateCopyWith(_$_AddPageContentState value,
          $Res Function(_$_AddPageContentState) then) =
      __$$_AddPageContentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String? errorMessage,
      List<QuoteModel> quotes,
      QuoteModel? chosenQuote,
      bool closed});

  @override
  $QuoteModelCopyWith<$Res>? get chosenQuote;
}

/// @nodoc
class __$$_AddPageContentStateCopyWithImpl<$Res>
    extends _$AddPageContentStateCopyWithImpl<$Res, _$_AddPageContentState>
    implements _$$_AddPageContentStateCopyWith<$Res> {
  __$$_AddPageContentStateCopyWithImpl(_$_AddPageContentState _value,
      $Res Function(_$_AddPageContentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? quotes = null,
    Object? chosenQuote = freezed,
    Object? closed = null,
  }) {
    return _then(_$_AddPageContentState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      quotes: null == quotes
          ? _value._quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<QuoteModel>,
      chosenQuote: freezed == chosenQuote
          ? _value.chosenQuote
          : chosenQuote // ignore: cast_nullable_to_non_nullable
              as QuoteModel?,
      closed: null == closed
          ? _value.closed
          : closed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddPageContentState implements _AddPageContentState {
  _$_AddPageContentState(
      {this.status = Status.initial,
      this.errorMessage,
      final List<QuoteModel> quotes = const [],
      this.chosenQuote,
      this.closed = false})
      : _quotes = quotes;

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;
  final List<QuoteModel> _quotes;
  @override
  @JsonKey()
  List<QuoteModel> get quotes {
    if (_quotes is EqualUnmodifiableListView) return _quotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quotes);
  }

  @override
  final QuoteModel? chosenQuote;
  @override
  @JsonKey()
  final bool closed;

  @override
  String toString() {
    return 'AddPageContentState(status: $status, errorMessage: $errorMessage, quotes: $quotes, chosenQuote: $chosenQuote, closed: $closed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPageContentState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._quotes, _quotes) &&
            (identical(other.chosenQuote, chosenQuote) ||
                other.chosenQuote == chosenQuote) &&
            (identical(other.closed, closed) || other.closed == closed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_quotes), chosenQuote, closed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPageContentStateCopyWith<_$_AddPageContentState> get copyWith =>
      __$$_AddPageContentStateCopyWithImpl<_$_AddPageContentState>(
          this, _$identity);
}

abstract class _AddPageContentState implements AddPageContentState {
  factory _AddPageContentState(
      {final Status status,
      final String? errorMessage,
      final List<QuoteModel> quotes,
      final QuoteModel? chosenQuote,
      final bool closed}) = _$_AddPageContentState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  List<QuoteModel> get quotes;
  @override
  QuoteModel? get chosenQuote;
  @override
  bool get closed;
  @override
  @JsonKey(ignore: true)
  _$$_AddPageContentStateCopyWith<_$_AddPageContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
