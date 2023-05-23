part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final UserModel userModel;

  ProfileLoadedState({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class ProfileErrorState extends ProfileState {}
