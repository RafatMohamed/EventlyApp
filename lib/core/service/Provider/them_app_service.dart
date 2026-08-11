import 'package:evently_app/core/shared/storge_local_hive.dart';
import 'package:flutter/material.dart';

class ThemAppService extends ChangeNotifier {
  ThemeMode currentThem =StorgeLocalHive.instance.getThemLocal()?ThemeMode.dark:ThemeMode.light;

  Future<void> changThem(ThemeMode newThem,BuildContext context) async {
    if (newThem == currentThem) return;
    currentThem = newThem;
    StorgeLocalHive.instance.saveThemLocal(context);
    notifyListeners();
  }
}
