import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../core/app_colors.dart';
import '../core/app_dimens.dart';
import '../core/app_text_styles.dart';
import '../login/bloc/login_bloc.dart';
import '../login/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), _navigateToLogin);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToLogin() async {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
          child: const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -120,
              left: -80,
              child: _buildCircle(260, 0.12),
            ),
            Positioned(
              bottom: -140,
              right: -100,
              child: _buildCircle(320, 0.18),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: AppDimens.splashLogoSize,
                      height: AppDimens.splashLogoSize,
                      decoration: BoxDecoration(
                        color: AppColors.logoBackground,
                        borderRadius: BorderRadius.circular(
                          AppDimens.splashLogoBorderRadius,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'F',
                          style: AppTextStyles.splashTitle.copyWith(
                            color: AppColors.logoText,
                            fontSize: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimens.spacingXL),
                  const Text(
                    'Flutter Assessment',
                    style: AppTextStyles.splashTitle,
                  ),
                  const SizedBox(height: AppDimens.spacingS),
                  const Text(
                    'Your daily companion',
                    style: AppTextStyles.splashSubtitle,
                  ),
                  const SizedBox(height: AppDimens.spacingXL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(isActive: true),
                      const SizedBox(width: AppDimens.spacingS),
                      _buildDot(),
                      const SizedBox(width: AppDimens.spacingS),
                      _buildDot(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cardBackground.withOpacity(opacity),
      ),
    );
  }

  Widget _buildDot({bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: AppDimens.indicatorDotSize,
      height: AppDimens.indicatorDotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? AppColors.textPrimaryOnPrimary
            : AppColors.textPrimaryOnPrimary.withOpacity(0.5),
      ),
    );
  }
}
