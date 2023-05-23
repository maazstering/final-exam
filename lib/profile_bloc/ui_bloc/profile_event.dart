part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class LoadUserProfileEvent extends ProfileEvent {}

class UpdateUserProfileEvent extends ProfileEvent {
  final UserModel userModel;

  UpdateUserProfileEvent({required this.userModel});
}
