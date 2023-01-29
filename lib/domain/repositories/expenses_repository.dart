import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/domain/models/expense_model.dart';

@injectable
class ExpensesRepository {
  Stream<List<ExpenseModel>> getExpensesStreamByVoyageId(String voyageId) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .where('voyageid', isEqualTo: voyageId)
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ExpenseModel(
            id: doc.id,
            name: doc['name'].toString(),
            voyageId: doc['voyageid'].toString(),
            category: doc['category'].toString(),
            price: double.parse(doc['price'].toString()),
            dateAdded: (doc['dateadded'] as Timestamp).toDate(),
          );
        }).toList();
      },
    );
  }

  Future<void> add(
    String name,
    String voyageId,
    double price,
    String category,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .add({
      'name': name,
      'voyageid': voyageId,
      'price': price,
      'category': category,
      'dateadded': DateTime.now(),
    });
  }

  Future<void> remove({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .doc(id)
        .delete();
  }

  Future<void> removeExpensesByVoyageId({required String voyageId}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }

    final expenses = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .where('voyageid', isEqualTo: voyageId)
        .get();

    for (final expense in expenses.docs) {
      await expense.reference.delete();
    }
  }

  Future<void> update({
    required String id,
    required String name,
    required double price,
    required DateTime dateAdded,
    required String category,
    required String voyageId,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .doc(id)
        .update({
      'name': name,
      'price': price,
      'dateadded': dateAdded,
      'category': category,
      'voyageid': voyageId,
    });
  }

  // Stream<double> getTotalPriceByVoyageId(String voyageId) {
  //   return getExpensesStreamByVoyageId(voyageId).map(
  //     (expenses) => expenses
  //         .map((expense) => expense.price)
  //         .reduce((value, element) => value + element),
  //   );
  // }

  // Stream<List<ExpenseModel>> getExpensesStream() {
  //   final userID = FirebaseAuth.instance.currentUser?.uid;
  //   if (userID == null) {
  //     throw Exception('User is not logged in');
  //   }
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userID)
  //       .collection('expenses')
  //       .orderBy('name')
  //       .snapshots()
  //       .map(
  //     (querySnapshot) {
  //       return querySnapshot.docs.map(
  //         (doc) {
  //           return ExpenseModel(
  //             id: doc.id,
  //             name: doc['name'].toString(),
  //             voyageId: doc['voyageid'].toString(),
  //             category: doc['category'].toString(),
  //             price: double.parse(doc['price'].toString()),
  //           );
  //         },
  //       ).toList();
  //     },
  //   );
  // }
}
