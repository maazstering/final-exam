import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finals/crud_firestore_bloc/repo/object_repository.dart';
import 'package:finals/crud_firestore_bloc/model/object_model.dart';
import 'package:equatable/equatable.dart';

part 'object_event.dart';
part 'object_state.dart';

class ObjectBloc extends Bloc<ObjectEvent, ObjectState> {
  final ObjectRepository obj;

  ObjectBloc({required this.obj}) : super(ObjectLoadingState()) {
    emit(ObjectLoadingState());

    on<LoadUserObjectEvent>((event, emit) async {
      try {
        List<ObjectModel> Obj = await obj.fetchObject();
        print(Obj.toString());
        emit(ObjectLoadedState(obj: Obj));
      } catch (_) {
        emit(ObjectErrorState());
      }
    });

    on<UpdateUserObjectEvent>((event, emit) async {
      try {
        await obj.updateObject(event.obj);
        emit(ObjectLoadingState());
        List<ObjectModel> Obj = await obj.fetchObject();
        emit(ObjectLoadedState(obj: Obj));
      } catch (_) {
        emit(ObjectErrorState());
      }
    });

    on<DeleteUserObjectEvent>((event, emit) async {
      try {
        await obj.deleteObject(event.obj);
        emit(ObjectLoadingState());
        List<ObjectModel> Obj = await obj.fetchObject();
        emit(ObjectLoadedState(obj: Obj));
      } catch (_) {
        emit(ObjectErrorState());
      }
    });

    on<CreateUserObjectEvent>((event, emit) async {
      try {
        await obj.createObject(event.obj);
        emit(ObjectLoadingState());
        List<ObjectModel> Obj = await obj.fetchObject();
        emit(ObjectLoadedState(obj: Obj));
      } catch (_) {
        emit(ObjectErrorState());
      }
    });
  }
}
