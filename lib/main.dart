import 'package:flutter/material.dart';

import 'core/utilities/app_them.dart';

void main() {
  runApp(const TestRun());
}

class TestRun extends StatelessWidget {
  const TestRun({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: .light,
      darkTheme: AppThem.darkThem,
      theme: AppThem.lightThem,
      home: const Placeholder(),
    );
  }
}

