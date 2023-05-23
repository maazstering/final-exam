import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finals/crud_firestore_bloc/repo/object_repository.dart';
import 'package:finals/crud_firestore_bloc/ui_bloc/object_bloc.dart';
import 'package:finals/crud_firestore_bloc/model/object_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ObjectBlocUI extends StatelessWidget {
  final ObjectRepository objectRepository = ObjectRepository(
    firebaseFirestore: FirebaseFirestore.instance,
  );

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ObjectBloc(obj: objectRepository)
        ..add(LoadUserObjectEvent()), // Event to load all objects
      child: MaterialApp(
        title: 'CRUD Operations',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Object Details'),
          ),
          body: BlocBuilder<ObjectBloc, ObjectState>(
            builder: (context, state) {
              if (state is ObjectLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ObjectLoadedState) {
                return ListView.builder(
                  itemCount: state.obj.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.obj[index].name),
                      subtitle: Text(state.obj[index].bio),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _nameController.text = state.obj[index].name;
                              _bioController.text = state.obj[index].bio;
                              _emailController.text = state.obj[index].email;

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Edit the object'),
                                      content: Column(
                                        children: <Widget>[
                                          TextField(
                                            controller: _nameController,
                                          ),
                                          TextField(
                                            controller: _bioController,
                                          ),
                                          TextField(
                                            controller: _emailController,
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("Update"),
                                          onPressed: () {
                                            if (_nameController
                                                    .text.isNotEmpty &&
                                                _bioController
                                                    .text.isNotEmpty &&
                                                _emailController
                                                    .text.isNotEmpty) {
                                              ObjectModel updatedObj =
                                                  ObjectModel(
                                                name: _nameController.text,
                                                bio: _bioController.text,
                                                email: _emailController.text,
                                                id: state.obj[index].id,
                                              );
                                              BlocProvider.of<ObjectBloc>(
                                                      context)
                                                  .add(
                                                UpdateUserObjectEvent(
                                                    obj: updatedObj),
                                              );
                                              Navigator.of(context).pop();
                                            } else {
                                              print(
                                                  "Please fill all the fields");
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                  useRootNavigator: false);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // functionality to delete object
                              BlocProvider.of<ObjectBloc>(context).add(
                                DeleteUserObjectEvent(obj: state.obj[index]),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('Error loading data!'),
                );
              }
            },
          ),
          floatingActionButton:
              BlocBuilder<ObjectBloc, ObjectState>(builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Create a new object'),
                        content: Column(
                          children: <Widget>[
                            TextField(
                              controller: _nameController,
                              decoration:
                                  InputDecoration(hintText: "Enter Name"),
                            ),
                            TextField(
                              controller: _bioController,
                              decoration:
                                  InputDecoration(hintText: "Enter Bio"),
                            ),
                            TextField(
                              controller: _emailController,
                              decoration:
                                  InputDecoration(hintText: "Enter Email"),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Create"),
                            onPressed: () {
                              if (_nameController.text.isNotEmpty &&
                                  _bioController.text.isNotEmpty &&
                                  _emailController.text.isNotEmpty) {
                                ObjectModel newObj = ObjectModel(
                                  name: _nameController.text,
                                  bio: _bioController.text,
                                  email: _emailController.text,
                                );
                                BlocProvider.of<ObjectBloc>(context).add(
                                  CreateUserObjectEvent(obj: newObj),
                                );
                                Navigator.of(context).pop();
                                _nameController.clear();
                                _bioController.clear();
                                _emailController.clear();
                              } else {
                                print("Please fill all the fields");
                              }
                            },
                          ),
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                    useRootNavigator: false);
              },
              child: Icon(Icons.add),
            );
          }),
        ),
      ),
    );
  }
}
