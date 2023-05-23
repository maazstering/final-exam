import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:finals/data_bloc/model/user_data_model.dart';

//@immutable mean every variable final inside class
//Equatable Simplyfy comparision without using this ==

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<user_data_model> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
