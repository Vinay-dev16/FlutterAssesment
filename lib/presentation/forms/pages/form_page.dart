import 'package:flutter/material.dart';

import '../../core/app_strings.dart';
import '../../core/app_top_bar.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppTopBar(title: AppStrings.formPageTitle),
      body: Center(child: Text(AppStrings.formPageContent, style: TextStyle(fontSize: 18))),
    );
  }
}
