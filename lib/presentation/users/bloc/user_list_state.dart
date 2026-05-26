part of 'user_list_bloc.dart';

abstract class UserListState {}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListPaginationLoading extends UserListState {
  final List<UserListItem> users;

  UserListPaginationLoading({required this.users});
}

class UserListLoaded extends UserListState {
  final List<UserListItem> users;
  final bool isLastPage;

  UserListLoaded({required this.users, required this.isLastPage});
}

class UserListFailure extends UserListState {
  final String message;

  UserListFailure({required this.message});
}
