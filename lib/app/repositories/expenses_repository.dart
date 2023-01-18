import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_cost_log/app/models/expense_model.dart';

class ExpensesRepository {
  Stream<List<ExpenseModel>> getExpensesStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .orderBy('name')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return ExpenseModel(
              id: doc.id,
              name: doc['name'].toString(),
              voyageID: doc['voyageid'].toString(),
              expenseCategory: doc['category'].toString(),
              price: double.parse(doc['price'].toString()),
            );
          },
        ).toList();
      },
    );
  }

  Future<void> add(
    String name,
    String voyageID,
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
      'voyageid': voyageID,
      'price': price,
      'category': category
    });
  }

  Stream<List<ExpenseModel>> getExpensesStreamByVoyageID(String voyageID) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .where('voyageid', isEqualTo: voyageID)
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ExpenseModel(
            id: doc.id,
            name: doc['name'].toString(),
            voyageID: doc['voyageid'].toString(),
            expenseCategory: doc['category'].toString(),
            price: double.parse(doc['price'].toString()),
          );
        }).toList();
      },
    );
  }
}
