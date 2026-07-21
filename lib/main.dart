import 'package:flutter/material.dart';

void main() {
  runApp(const TestRun());
}

class TestRun extends StatelessWidget {
  const TestRun({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      themeMode: .light,
      home: Placeholder(),
    );
  }
}

