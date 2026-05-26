import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/users/entities/user_list_item.dart';
import '../../../domain/users/usecases/get_users_use_case.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUsersUseCase getUsersUseCase;

  UserListBloc(this.getUsersUseCase) : super(UserListInitial()) {
    on<UserListFetched>(_onUserListFetched);
    on<UserListUserDeleted>(_onUserDeleted);
  }

  int _currentPage = 1;
  bool _isLastPage = false;
  bool _isLoading = false;
  final List<UserListItem> _users = [];

  Future<void> _onUserListFetched(
      UserListFetched event, Emitter<UserListState> emit) async {
    if (_isLoading || _isLastPage) return;

    _isLoading = true;

    if (_users.isEmpty) {
      emit(UserListLoading());
    } else {
      emit(UserListPaginationLoading(users: List.of(_users)));
    }

    try {
      final newUsers = await getUsersUseCase(_currentPage);

      if (newUsers.isEmpty) {
        _isLastPage = true;
      } else {
        _currentPage++;
        _users.addAll(newUsers);
      }

      emit(UserListLoaded(users: List.of(_users), isLastPage: _isLastPage));
    } catch (e) {
      emit(UserListFailure(message: e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  void _onUserDeleted(
    UserListUserDeleted event,
    Emitter<UserListState> emit,
  ) {
    final currentState = state;

    if (currentState is UserListLoaded ||
        currentState is UserListPaginationLoading) {
      final currentUsers = currentState is UserListLoaded
          ? currentState.users
          : (currentState as UserListPaginationLoading).users;

      final updatedUsers = currentUsers
          .where((user) => user.id != event.userId)
          .toList();

      emit(UserListLoaded(
        users: updatedUsers,
        isLastPage: _isLastPage,
      ));
    }
  }
}
