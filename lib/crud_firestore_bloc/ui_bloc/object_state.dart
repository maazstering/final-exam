part of 'object_bloc.dart';

abstract class ObjectState extends Equatable {
  const ObjectState();

  @override
  List<Object> get props => [];
}

class ObjectLoadingState extends ObjectState {}

class ObjectLoadedState extends ObjectState {
  final List<ObjectModel> obj;

  ObjectLoadedState({required this.obj});
  @override
  List<Object> get props => [ObjectModel];
}

class ObjectErrorState extends ObjectState {}
