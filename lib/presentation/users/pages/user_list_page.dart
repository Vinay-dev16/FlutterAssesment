import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import '../../core/app_colors.dart';
import '../../core/app_dimens.dart';
import '../../core/app_strings.dart';
import '../../core/app_top_bar.dart';
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
      backgroundColor: AppColors.primaryDark,
      appBar: const AppTopBar(title: AppStrings.home),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.listHorizontalPadding,
            vertical: AppDimens.listVerticalPadding,
          ),
          child: UserListView(),
        ),
      ),
    );
  }
}
