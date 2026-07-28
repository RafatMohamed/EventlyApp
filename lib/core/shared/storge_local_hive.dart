import 'package:hive_flutter/hive_flutter.dart';

import '../const.dart';

class StorgeLocalHive{

 StorgeLocalHive._internal();
  static final StorgeLocalHive instance = StorgeLocalHive._internal();
  factory StorgeLocalHive() {
    return instance;
  }
  static final Box<bool> boxIsFirstOpenApp = Hive.box<bool>(AppConst.isFirstOpenAppName);

  Future<void> initSharedMain() async {
    await Hive.initFlutter();
    await Hive.openBox<bool>(AppConst.isFirstOpenAppName);
  }

  Future<void> saveIsFirstOpenApp(bool isOpen) async {
    await boxIsFirstOpenApp.put(AppConst.isFirstOpenAppKey, isOpen);
  }

  bool getIsFirstOpenApp() {
    final result = boxIsFirstOpenApp.get(AppConst.isFirstOpenAppKey);
    return result ?? true;
  }

  Future<void> clearIsFirstOpenApp(){
   return boxIsFirstOpenApp.clear();
  }
}
