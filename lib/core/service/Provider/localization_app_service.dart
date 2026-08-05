import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationAppService extends ChangeNotifier {

  Future<void> changLocal(Locale newLocal, BuildContext context) async {
    if (context.locale == newLocal) return;
    context.setLocale(newLocal);
    notifyListeners();
  }
}
