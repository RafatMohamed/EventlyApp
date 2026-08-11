import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../const.dart';
import '../service/Provider/them_app_service.dart';

class StorgeLocalHive {
  StorgeLocalHive._internal();
  static final StorgeLocalHive instance = StorgeLocalHive._internal();
  factory StorgeLocalHive() {
    return instance;
  }
  static final Box<bool> boxIsFirstOpenApp = Hive.box<bool>(
    AppConst.isFirstOpenAppName,
  );

  Future<void> initSharedMain() async {
    await Hive.initFlutter();
    await Hive.openBox<bool>(AppConst.isFirstOpenAppName);
    await Hive.openBox<bool>(AppConst.themLocalName);
  }

  Future<void> saveIsFirstOpenApp(bool isOpen) async {
    await boxIsFirstOpenApp.put(AppConst.isFirstOpenAppKey, isOpen);
  }

  bool getIsFirstOpenApp() {
    final result = boxIsFirstOpenApp.get(AppConst.isFirstOpenAppKey);
    return result ?? true;
  }

  Future<void> clearIsFirstOpenApp() {
    return boxIsFirstOpenApp.clear();
  }

  static final Box<bool> boxThemMode = Hive.box<bool>(
    AppConst.themLocalName,
  );

  Future<void> saveThemLocal(BuildContext context) async {
    bool isDark() {
      return context.read<ThemAppService>().currentThem == ThemeMode.dark;
    }
    await boxThemMode.put(AppConst.themLocalKey, isDark());
  }

  bool getThemLocal() {
    final result = boxThemMode.get(AppConst.themLocalKey);
    return result ?? false;
  }
}
