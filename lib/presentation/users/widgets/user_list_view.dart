import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_list_bloc.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;

    if (position.pixels >= position.maxScrollExtent &&
        !position.outOfRange) {
      context.read<UserListBloc>().add(UserListFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        if (state is UserListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UserListFailure) {
          return Center(child: Text(state.message));
        }

        if (state is UserListLoaded || state is UserListPaginationLoading) {
          final users = state is UserListLoaded
              ? state.users
              : (state as UserListPaginationLoading).users;

          final isLoadingMore = state is UserListPaginationLoading;

          return ListView.builder(
            controller: _scrollController,
            itemCount: users.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= users.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator(color: Colors.white,)),
                );
              }

              final user = users[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}',style: TextStyle(color: Colors.white),),
                subtitle: Text(user.email,style: TextStyle(color: Colors.white),),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    context.read<UserListBloc>().add(
                          UserListUserDeleted(user.id),
                        );
                  },
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
