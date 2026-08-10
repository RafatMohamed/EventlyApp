import 'package:flutter/material.dart';

class CurrentIndexCategoriesProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changCurrentIndex(int index) async {
    if (currentIndex == index) return;
    currentIndex = index;
    notifyListeners();
  }
}