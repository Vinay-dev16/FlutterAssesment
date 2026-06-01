import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_dimens.dart';
import '../../core/app_strings.dart';
import '../../login/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: AppStrings.email,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.pleaseEnterEmail;
                  }
                  if (!value.contains('@')) {
                    return AppStrings.pleaseEnterValidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppDimens.spacingM),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: AppStrings.password,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.pleaseEnterPassword;
                  }
                  if (value.length < 6) {
                    return AppStrings.passwordMinLength;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppDimens.spacingL),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(AppStrings.login),
              ),
            ],
          ),
        );
      },
    );
  }
}
