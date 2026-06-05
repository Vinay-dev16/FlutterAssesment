import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'presentation/core/app_strings.dart';
import 'presentation/splash/splash_page.dart';

enum AppBuildVariant { debug, qa, release }

AppBuildVariant get appBuildVariant {
  const definedVariant = String.fromEnvironment('APP_VARIANT');

  switch (definedVariant.toLowerCase()) {
    case 'qa':
      return AppBuildVariant.qa;
    case 'release':
      return AppBuildVariant.release;
    case 'debug':
      return AppBuildVariant.debug;
  }

  return kReleaseMode ? AppBuildVariant.release : AppBuildVariant.debug;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  debugPrint('App build variant: $appBuildVariant');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
