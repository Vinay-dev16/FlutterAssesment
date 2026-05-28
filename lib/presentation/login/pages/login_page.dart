import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_colors.dart';
import '../../core/app_dimens.dart';
import '../../core/app_text_styles.dart';
import '../bloc/login_bloc.dart';
import '../widgets/login_form.dart';
import '../../users/pages/user_list_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const UserListPage(),
                ),
              );
            }
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.screenPaddingH,
                vertical: AppDimens.screenPaddingV,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: AppDimens.spacingL),
                  Container(
                    width: AppDimens.logoSize,
                    height: AppDimens.logoSize,
                    decoration: BoxDecoration(
                      color: AppColors.logoBackground,
                      borderRadius:
                          BorderRadius.circular(AppDimens.logoBorderRadius),
                    ),
                    child: Center(
                      child: Text(
                        'F',
                        style: AppTextStyles.loginTitle.copyWith(
                          color: AppColors.logoText,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacingM),
                  const Text(
                    'Welcome back',
                    style: AppTextStyles.loginTitle,
                  ),
                  const SizedBox(height: AppDimens.spacingXS),
                  const Text(
                    'Sign in to continue',
                    style: AppTextStyles.loginSubtitle,
                  ),
                  const SizedBox(height: AppDimens.spacingXL),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(AppDimens.cardRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.cardPaddingH,
                      vertical: AppDimens.cardPaddingV,
                    ),
                    child: BlocProvider.value(
                      value: context.read<LoginBloc>(),
                      child: const LoginForm(),
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacingL),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
