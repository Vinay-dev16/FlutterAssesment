import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import '../bloc/user_list_bloc.dart';
import '../widgets/user_list_view.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserListBloc>(
      create: (_) => getIt<UserListBloc>()..add(UserListFetched()),
      child: const _UserListPageView(),
    );
  }
}

class _UserListPageView extends StatelessWidget {
  const _UserListPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: const UserListView(),
    );
  }
}
