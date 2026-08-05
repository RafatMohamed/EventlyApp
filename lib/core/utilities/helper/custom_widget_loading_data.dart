import 'package:flutter/material.dart';

class CustomWidgetLoadingData {
  static Widget circleProgrees(ThemeData colorThem){
    return  Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          backgroundColor: colorThem.scaffoldBackgroundColor,
          color: colorThem.primaryColor,
        ),
      ),
    );
  }
}