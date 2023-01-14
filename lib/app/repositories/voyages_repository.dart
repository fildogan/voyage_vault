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
              // startDate: (doc['release_date'] as Timestamp).toDate(),
              // endDate: (doc['release_date'] as Timestamp).toDate(),
            );
          },
        ).toList();
      },
    );
  }
}
