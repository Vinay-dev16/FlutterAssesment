part of 'user_list_bloc.dart';

abstract class UserListEvent {}

class UserListFetched extends UserListEvent {}

class UserListUserDeleted extends UserListEvent {
  final int userId;

  UserListUserDeleted(this.userId);
}
