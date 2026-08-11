import 'package:flutter/material.dart';

class CustomWidgetLoadingData {
  static Widget circleProgress(ThemeData colorThem,){
    return  Center(
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          backgroundColor: colorThem.scaffoldBackgroundColor,
          color: colorThem.primaryColor,
        ),
      ),
    );
  }
}