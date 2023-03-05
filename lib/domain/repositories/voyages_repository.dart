import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/domain/models/voyage_model.dart';

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
              budget: doc.data().toString().contains('budget')
                  ? double.parse(doc['budget'].toString())
                  : 0.00,
              startDate: (doc['startdate'] as Timestamp).toDate(),
              endDate: (doc['enddate'] as Timestamp).toDate(),
              location: doc.data().toString().contains('location')
                  ? doc['location'].toString()
                  : '',
              description: doc.data().toString().contains('description')
                  ? doc['description'].toString()
                  : '',
              voyagers: List.from(doc['voyagers']),
            );
          },
        ).toList();
      },
    );
  }

  // amount: doc.data().toString().contains('amount') ? doc.get('amount') : 0,

  Future<void> add({
    required String title,
    required double budget,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String description,
    required List<String> voyagers,
  }) async {
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
      'location': location,
      'description': description,
      'voyagers': voyagers,
    });
  }

  Future<void> update({
    required String id,
    required String title,
    required double budget,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String description,
    required List<String> voyagers,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyages')
        .doc(id)
        .update({
      'title': title,
      'budget': budget,
      'startdate': startDate,
      'enddate': endDate,
      'location': location,
      'description': description,
      'voyagers': voyagers,
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
      location: doc['location'].toString(),
      description: doc['description'].toString(),
      voyagers: List.from(doc['voyagers']),
    );
  }

  //Returns the list of voyage titles
  Stream<List<String>> getVoyageTitlesStream() {
    return getVoyagesStream().map((voyages) {
      return voyages.map((voyage) => voyage.title).toList();
    });
  }

  Stream<VoyageModel> getVoyageStreamById(String id) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyages')
        .doc(id)
        .snapshots()
        .map(
      (docSnapshot) {
        return VoyageModel(
          id: docSnapshot.id,
          title: docSnapshot['title'].toString(),
          budget: docSnapshot.data().toString().contains('budget')
              ? double.parse(docSnapshot['budget'].toString())
              : 0.00,
          startDate: (docSnapshot['startdate'] as Timestamp).toDate(),
          endDate: (docSnapshot['enddate'] as Timestamp).toDate(),
          location: docSnapshot.data().toString().contains('location')
              ? docSnapshot['location'].toString()
              : '',
          description: docSnapshot.data().toString().contains('description')
              ? docSnapshot['description'].toString()
              : '',
          voyagers: List.from(docSnapshot['voyagers']),
        );
      },
    );
  }
}
