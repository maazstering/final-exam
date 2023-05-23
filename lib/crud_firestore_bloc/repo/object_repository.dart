// profile_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finals/crud_firestore_bloc/model/object_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ObjectRepository {
  final FirebaseFirestore firebaseFirestore;
  String _email = FirebaseAuth.instance.currentUser!.email.toString();

  ObjectRepository({required this.firebaseFirestore});

  // Update the user profile in Firestore
  Future<void> updateObject(ObjectModel obj) async {
    try {
      await firebaseFirestore.collection('object').doc(obj.id).update(
            obj.toJson(),
          );
    } on FirebaseException catch (e) {
      print("Failed with error ${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteObject(ObjectModel obj) async {
    try {
      await firebaseFirestore.collection('object').doc(obj.id).delete();
    } on FirebaseException catch (e) {
      print("Failed with error ${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createObject(ObjectModel obj) async {
    try {
      await firebaseFirestore.collection('object').add(obj.toJson());
    } on FirebaseException catch (e) {
      print("Failed with error ${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ObjectModel>> fetchObject() async {
    List<ObjectModel> userList = [];
    try {
      final user = await FirebaseFirestore.instance.collection("object").get();
      userList =
          user.docs.map((e) => ObjectModel.fromJson(e.data(), e.id)).toList();
      return userList;
    } on FirebaseException catch (e) {
      if (kDebugMode) print("Failed with error ${e.code}: ${e.message}");
      return userList;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
