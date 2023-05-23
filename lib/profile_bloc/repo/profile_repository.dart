// profile_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finals/profile_bloc/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;
  String _email = FirebaseAuth.instance.currentUser!.email.toString();

  ProfileRepository({required this.firebaseFirestore});

  // Fetch the user profile from Firestore

  // Update the user profile in Firestore
  Future<void> updateUser(UserModel user) async {
    print(user.toJson());
    print(user.id);
    try {
      await firebaseFirestore.collection('profile_form').doc(user.id).update(
            user.toJson(),
          );
    } on FirebaseException catch (e) {
      print("Failed with error ${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      await firebaseFirestore.collection('profile_form').add(user.toJson());
    } on FirebaseException catch (e) {
      print("Failed with error ${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> fetchUser() async {
    UserModel userList = UserModel(
      name: "",
      bio: "",
      email: "",
    );
    try {
      final user = await FirebaseFirestore.instance
          .collection("profile_form")
          .where("email", isEqualTo: _email)
          .get();
      userList = UserModel.fromJson(user.docs[0].data(), user.docs[0].id);
      print(userList.id);
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
