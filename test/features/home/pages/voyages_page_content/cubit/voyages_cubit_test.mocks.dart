// Mocks generated by Mockito 5.3.2 from annotations
// in voyage_vault/test/features/home/pages/voyages_page_content/cubit/voyages_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:voyage_vault/domain/models/expense_model.dart' as _i6;
import 'package:voyage_vault/domain/models/voyage_model.dart' as _i2;
import 'package:voyage_vault/domain/repositories/expenses_repository.dart'
    as _i5;
import 'package:voyage_vault/domain/repositories/voyages_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeVoyageModel_0 extends _i1.SmartFake implements _i2.VoyageModel {
  _FakeVoyageModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [VoyagesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockVoyagesRepository extends _i1.Mock implements _i3.VoyagesRepository {
  @override
  _i4.Stream<List<_i2.VoyageModel>> getVoyagesStream() => (super.noSuchMethod(
        Invocation.method(
          #getVoyagesStream,
          [],
        ),
        returnValue: _i4.Stream<List<_i2.VoyageModel>>.empty(),
        returnValueForMissingStub: _i4.Stream<List<_i2.VoyageModel>>.empty(),
      ) as _i4.Stream<List<_i2.VoyageModel>>);
  @override
  _i4.Future<void> add({
    required String? title,
    required double? budget,
    required DateTime? startDate,
    required DateTime? endDate,
    required String? location,
    required String? description,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [],
          {
            #title: title,
            #budget: budget,
            #startDate: startDate,
            #endDate: endDate,
            #location: location,
            #description: description,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> update({
    required String? id,
    required String? title,
    required double? budget,
    required DateTime? startDate,
    required DateTime? endDate,
    required String? location,
    required String? description,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [],
          {
            #id: id,
            #title: title,
            #budget: budget,
            #startDate: startDate,
            #endDate: endDate,
            #location: location,
            #description: description,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> remove({required String? id}) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String> getVoyageIdByTitle(String? title) => (super.noSuchMethod(
        Invocation.method(
          #getVoyageIdByTitle,
          [title],
        ),
        returnValue: _i4.Future<String>.value(''),
        returnValueForMissingStub: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<_i2.VoyageModel> getVoyageById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getVoyageById,
          [id],
        ),
        returnValue: _i4.Future<_i2.VoyageModel>.value(_FakeVoyageModel_0(
          this,
          Invocation.method(
            #getVoyageById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.VoyageModel>.value(_FakeVoyageModel_0(
          this,
          Invocation.method(
            #getVoyageById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.VoyageModel>);
  @override
  _i4.Stream<List<String>> getVoyageTitlesStream() => (super.noSuchMethod(
        Invocation.method(
          #getVoyageTitlesStream,
          [],
        ),
        returnValue: _i4.Stream<List<String>>.empty(),
        returnValueForMissingStub: _i4.Stream<List<String>>.empty(),
      ) as _i4.Stream<List<String>>);
}

/// A class which mocks [ExpensesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockExpensesRepository extends _i1.Mock
    implements _i5.ExpensesRepository {
  @override
  _i4.Stream<List<_i6.ExpenseModel>> getExpensesStreamByVoyageId(
          String? voyageId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExpensesStreamByVoyageId,
          [voyageId],
        ),
        returnValue: _i4.Stream<List<_i6.ExpenseModel>>.empty(),
        returnValueForMissingStub: _i4.Stream<List<_i6.ExpenseModel>>.empty(),
      ) as _i4.Stream<List<_i6.ExpenseModel>>);
  @override
  _i4.Future<void> add(
    String? name,
    String? voyageId,
    double? price,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [
            name,
            voyageId,
            price,
            category,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> remove({required String? id}) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> removeExpensesByVoyageId({required String? voyageId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeExpensesByVoyageId,
          [],
          {#voyageId: voyageId},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> update({
    required String? id,
    required String? name,
    required double? price,
    required DateTime? dateAdded,
    required String? category,
    required String? voyageId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [],
          {
            #id: id,
            #name: name,
            #price: price,
            #dateAdded: dateAdded,
            #category: category,
            #voyageId: voyageId,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
