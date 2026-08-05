import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_padding.dart';
import '../app_text_styles.dart';

class ShowMess{
  static void successMess({required BuildContext context,required String mess}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mess,style: AppTextStyles.textS18MStyle.copyWith(
          color: Theme.of(context).primaryColor
        ),),
        elevation: 0,
        duration: Duration(milliseconds: 500),
        margin: EdgeInsetsDirectional.all(AppPadding.p16),
        showCloseIcon: true,
        backgroundColor: Colors.green,
        closeIconColor: Theme.of(context).disabledColor,
        behavior: .floating,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Theme.of(context).unselectedWidgetColor
          ),
        ),
        hitTestBehavior: .deferToChild,
      ),
    );
  }
  static void errorMess({required BuildContext context,String mess="Somthing Wrong"}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mess,style: AppTextStyles.textS18MStyle.copyWith(
          color: Theme.of(context).primaryColor
        ),),
        elevation: 0,
        duration: Duration(milliseconds: 500),
        margin: EdgeInsetsDirectional.all(AppPadding.p16),
        showCloseIcon: true,
        backgroundColor: Colors.red,
        closeIconColor: Theme.of(context).disabledColor,
        behavior: .floating,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Theme.of(context).unselectedWidgetColor
          ),
        ),
        hitTestBehavior: .deferToChild,
      ),
    );
  }
}