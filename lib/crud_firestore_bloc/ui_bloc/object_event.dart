part of 'object_bloc.dart';

abstract class ObjectEvent {}

class LoadUserObjectEvent extends ObjectEvent {}

class UpdateUserObjectEvent extends ObjectEvent {
  final ObjectModel obj;

  UpdateUserObjectEvent({required this.obj});
}

class DeleteUserObjectEvent extends ObjectEvent {
  final ObjectModel obj;

  DeleteUserObjectEvent({required this.obj});
}

class CreateUserObjectEvent extends ObjectEvent {
  final ObjectModel obj;

  CreateUserObjectEvent({required this.obj});
}
