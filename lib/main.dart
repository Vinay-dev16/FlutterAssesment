import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'presentation/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Clean Architecture Login',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
