import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finals/profile_bloc/repo/profile_repository.dart';
import 'package:finals/profile_bloc/model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(ProfileLoadingState()) {
    emit(ProfileLoadingState());

    on<LoadUserProfileEvent>((event, emit) async {
      try {
        UserModel user = await profileRepository.fetchUser();
        print(user.toString());
        emit(ProfileLoadedState(userModel: user));
      } catch (_) {
        emit(ProfileErrorState());
      }
    });

    on<UpdateUserProfileEvent>((event, emit) async {
      try {
        await profileRepository.updateUser(event.userModel);
        UserModel user = await profileRepository.fetchUser();
        emit(ProfileLoadedState(userModel: user));
      } catch (_) {
        emit(ProfileErrorState());
      }
    });
  }
}
