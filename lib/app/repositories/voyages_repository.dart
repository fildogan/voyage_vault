import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';

class VoyagesRepository {
  Stream<List<VoyageModel>> getVoyagesStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyages')
        .orderBy('title')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return VoyageModel(
              id: doc.id,
              title: doc['title'],
              startDate: (doc['startdate'] as Timestamp).toDate(),
              endDate: (doc['enddate'] as Timestamp).toDate(),
            );
          },
        ).toList();
      },
    );
  }

  Future<void> add(
    String title,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyages')
        .add({
      'title': title,
      'startdate': startDate,
      'enddate': endDate,
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
        .collection('voyages')
        .doc(id)
        .delete();
  }
}
