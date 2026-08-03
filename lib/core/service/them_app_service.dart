import 'package:flutter/material.dart';

class ThemAppService {
  static ThemeMode currentThem = ThemeMode.light;
  static Future<void> changThem(ThemeMode newThem,Function() onChange) async {
    if (newThem == currentThem) return;
    currentThem = newThem;
    onChange();
  }
}
