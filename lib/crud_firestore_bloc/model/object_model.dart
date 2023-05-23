// user_model.dart
import 'package:firebase_auth/firebase_auth.dart';

class ObjectModel {
  final String name;
  final String bio;
  final String email;
  final String? id;

  // Constructor
  ObjectModel(
      {required this.name,
      required this.bio,
      required this.email,
      String? this.id});

  // Convert a ObjectModel into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bio': bio,
      'email': email,
    };
  }

  //to String Function for Printing the User Model
  toString() => 'ObjectModel {name: $name, bio: $bio, email: $email}';

  // Create a ObjectModel from a JSON object
  factory ObjectModel.fromJson(Map<String, dynamic> json, String id) {
    return ObjectModel(
      id: id,
      name: json['name'] as String,
      bio: json['bio'] as String,
      email: json['email'] as String,
    );
  }
}
