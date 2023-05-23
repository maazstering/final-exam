import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finals/profile_bloc/repo/profile_repository.dart';
import 'package:finals/profile_bloc/ui_bloc/profile_bloc.dart';
import 'package:finals/profile_bloc/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("aaa");
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoadedState) {
            _nameController.text = state.userModel.name;
            _bioController.text = state.userModel.bio;
          }
        },
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            print("trying");
            context.read<ProfileBloc>().add(LoadUserProfileEvent());
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileLoadedState) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextField(
                    controller: _bioController,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                            UpdateUserProfileEvent(
                              userModel: UserModel(
                                name: _nameController.text,
                                bio: _bioController.text,
                                email: FirebaseAuth.instance.currentUser!.email
                                    .toString(),
                                id: state.userModel.id,
                              ),
                            ),
                          );
                    },
                    child: const Text('Update Profile'),
                  ),
                ],
              ),
            );
          }

          if (state is ProfileErrorState) {
            return const Center(
                child: Text('Error in loading/updating profile'));
          }

          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
