import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finals/data_bloc/repo/user_repo.dart';
import 'package:finals/data_bloc/ui_bloc/bloc.dart';
import 'package:finals/data_bloc/ui_bloc/state.dart';
import 'package:finals/data_bloc/ui_bloc/event.dart';
import 'package:finals/data_bloc/model/user_data_model.dart';

class data_bloc_ui extends StatelessWidget {
  const data_bloc_ui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          UserBloc(UserRepository())..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('The BloC App'),
            automaticallyImplyLeading: false),
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        // Build the UI based on the current state.
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is UserErrorState) {
          return const Center(child: Text("Error"));
        }

        if (state is UserLoadedState) {
          List<user_data_model> userList = state.users;
          print(state);

          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text(
                      '${userList[index].name}  (${userList[index].localName})',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${userList[index].countryCode}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
