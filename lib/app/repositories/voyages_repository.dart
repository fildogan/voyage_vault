import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:travel_cost_log/app/models/voyage_model.dart';

@injectable
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
              title: doc['title'].toString(),
              budget: double.parse(doc['budget'].toString()),
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
    double budget,
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
      'budget': budget,
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

  //Returns the id of a voyage by its title
  Future<String> getVoyageIdByTitle(String title) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyages')
        .where('title', isEqualTo: title)
        .get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception('No document with title $title found');
    }
    final doc = querySnapshot.docs.first;
    return doc.id;
  }

  Future<VoyageModel> getVoyageById(String id) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyages')
        .doc(id)
        .get();
    return VoyageModel(
      id: doc.id,
      title: doc['title'].toString(),
      budget: double.parse(doc['budget'].toString()),
      startDate: (doc['startdate'] as Timestamp).toDate(),
      endDate: (doc['enddate'] as Timestamp).toDate(),
    );
  }

  //Returns the list of voyage titles
  Stream<List<String>> getVoyageTitlesStream() {
    return getVoyagesStream().map((voyages) {
      return voyages.map((voyage) => voyage.title).toList();
    });
  }
}
