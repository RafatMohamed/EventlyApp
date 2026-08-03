import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationAppService extends ChangeNotifier {

  Locale currentLocale = const Locale("en");

  Future<void> changLocal(Locale newLocal, BuildContext context) async {
    if (newLocal == currentLocale) return;
    currentLocale = newLocal;
    context.setLocale(currentLocale);
    notifyListeners();
  }
}
