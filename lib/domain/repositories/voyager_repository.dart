import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:voyage_vault/domain/models/voyager_model.dart';

@injectable
class VoyagersRepository {
  Stream<List<VoyagerModel>> getVoyagersStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyagers')
        .orderBy('name')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return VoyagerModel(
              id: doc.id,
              name: doc['name'].toString(),
              color: Color(doc['color']),
            );
          },
        ).toList();
      },
    );
  }

  // amount: doc.data().toString().contains('amount') ? doc.get('amount') : 0,

  Future<void> add({
    required String name,
    required Color color,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyagers')
        .add({
      'name': name,
      'color': color.value,
    });
  }

  Future<void> update({
    required String id,
    required String name,
    required Color color,
  }) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyagers')
        .doc(id)
        .update({
      'name': name,
      'color': color.value,
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
        .collection('voyagers')
        .doc(id)
        .delete();
  }

  //Returns the id of a voyager by its name
  Future<String> getVoyagerIdByName(String name) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyagers')
        .where('name', isEqualTo: name)
        .get();
    if (querySnapshot.docs.isEmpty) {
      throw Exception('No document with name $name found');
    }
    final doc = querySnapshot.docs.first;
    return doc.id;
  }

  Future<VoyagerModel> getVoyagerById(String id) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyagers')
        .doc(id)
        .get();
    return VoyagerModel(
      id: doc.id,
      name: doc['name'].toString(),
      color: Color(doc['color']),
    );
  }

  //Returns the list of voyager names
  Stream<List<String>> getVoyagerNamesStream() {
    return getVoyagersStream().map((voyagers) {
      return voyagers.map((voyager) => voyager.name).toList();
    });
  }

  Stream<List<VoyagerModel>> getVoyagersStreamById(List<String> voyagerIdList) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('voyagers')
        .orderBy('name')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs
            .where((doc) => voyagerIdList.contains(doc.id))
            .map(
          (doc) {
            return VoyagerModel(
              id: doc.id,
              name: doc['name'].toString(),
              color: Color(doc['color']),
            );
          },
        ).toList();
      },
    );
  }
}
