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
      'category': category
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