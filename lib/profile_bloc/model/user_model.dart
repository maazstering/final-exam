// user_model.dart
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String bio;
  final String email;
  final String? id;

  UserModel(
      {required this.name,
      required this.bio,
      required this.email,
      String? this.id});

  // Convert a UserModel into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bio': bio,
      'email': email,
    };
  }

  toString() => 'UserModel {name: $name, bio: $bio, email: $email}';
  // Create a UserModel from a JSON object
  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      name: json['name'] as String,
      bio: json['bio'] as String,
      email: json['email'] as String,
    );
  }
}
