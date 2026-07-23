import 'package:flutter/material.dart';

import '../utilities/app_border_radius.dart';
import '../utilities/app_padding.dart';

AppBar defaultAppBarApp (BuildContext context,{required ThemeData themeColor,required final String title,}){
  return AppBar(
    title: Text(title),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: .center,
        margin: const EdgeInsetsDirectional.only(start: AppPadding.p16,bottom:AppPadding.p10,top: AppPadding.p10 ),
        decoration: BoxDecoration(
            color:themeColor.disabledColor,
            borderRadius: BorderRadius.circular(AppBorderRadius.r8),
            border: Border.all(
                color: themeColor.unselectedWidgetColor,
                style: .solid
            )
        ),
        child: Icon(Icons.arrow_back_ios_new_outlined,size: 24,color: themeColor.primaryColor,fill: .minPositive,),
      ),
    ),
  );
}
