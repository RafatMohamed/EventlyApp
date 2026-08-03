import 'package:flutter/material.dart';

class ThemAppService extends ChangeNotifier {
  ThemeMode currentThem = ThemeMode.light;

  Future<void> changThem(ThemeMode newThem) async {
    if (newThem == currentThem) return;
    currentThem = newThem;
    notifyListeners();
  }
}
