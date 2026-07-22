import 'package:evently_app/core/utilities/app_border_radius.dart';
import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppThem {
  static ThemeData lightThem = ThemeData(
    primaryColor: AppColors.mainColorLight,
    secondaryHeaderColor: AppColors.disableColor,
    disabledColor: AppColors.inputsLight,
    unselectedWidgetColor: AppColors.strokeLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputsLight,
      filled: true,
      contentPadding: EdgeInsets.all(AppPadding.p8),
      enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r16),
          gapPadding: 8,
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.strokeLight,
          )
      ),
      hintStyle: TextStyle(
        color: AppColors.secTextLight,
        fontSize: 14,
        fontWeight: .w400,
        fontStyle: .normal,
      ),
      labelStyle:  TextStyle(
        color: AppColors.inputsLight,
        fontSize: 16,
        fontWeight: .bold,
        fontStyle: .normal,
      ),
      prefixIconColor: AppColors.disableColor,
      suffixIconColor:AppColors.disableColor,
      prefixStyle: TextStyle(
        fontSize: 24,
        color: AppColors.disableColor,
      ),
      focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r16),
          gapPadding: 8,
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.strokeLight,
          )
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r16),
        gapPadding: 8,
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: AppColors.strokeLight,
        )
      ),
    ),
    textTheme: TextTheme(
      bodyLarge:AppTextStyles.textS24SBStyle.copyWith(
        color: AppColors.mainColorLight,
      ) ,
      bodyMedium: AppTextStyles.textS20SBStyle.copyWith(
        color: AppColors.mainTextLight,
      ),
      bodySmall: AppTextStyles.textS16RStyle.copyWith(
        color: AppColors.secTextLight,
      ),
      labelMedium: AppTextStyles.textS18MStyle.copyWith(
        color: AppColors.mainColorLight,
      ),
      labelSmall: AppTextStyles.textS14BStyle.copyWith(
        color: AppColors.mainColorLight,
      ),
      titleSmall: AppTextStyles.textS14BStyle.copyWith(
        color: AppColors.secTextLight,
        fontWeight: .w400
      ),
      titleLarge: AppTextStyles.textS20MStyle.copyWith(
        color: AppColors.inputsLight,
      ),
      displaySmall: AppTextStyles.textS12RStyle.copyWith(
        color: AppColors.mainColorLight,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLight,
      elevation: 2,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.disableColor,
      selectedItemColor: AppColors.mainColorLight,
      type: .fixed,
      selectedLabelStyle: AppTextStyles.textS12RStyle.copyWith(
        color: AppColors.mainColorLight,
      ),
      unselectedLabelStyle: AppTextStyles.textS12RStyle.copyWith(
        color: AppColors.disableColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 15,
      backgroundColor: AppColors.mainColorLight,
      shape: CircleBorder(),
      foregroundColor: AppColors.inputsLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.mainColorLight
      ),
      titleTextStyle: AppTextStyles.textS18MStyle.copyWith(
          color: AppColors.mainTextLight
      ),
    )
  );
  static ThemeData darkThem = ThemeData(
    primaryColor: AppColors.mainColorDark,
    disabledColor: AppColors.inputsLight,
    unselectedWidgetColor: AppColors.strokeDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    secondaryHeaderColor: AppColors.disableColor,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputsDark,
      filled: true,
      contentPadding: EdgeInsets.all(AppPadding.p8),
      enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r16),
          gapPadding: 8,
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.strokeDark,
          )
      ),
      hintStyle: TextStyle(
        color: AppColors.secTextDark,
        fontSize: 14,
        fontWeight: .w400,
        fontStyle: .normal,
      ),
      labelStyle:  TextStyle(
        color: AppColors.inputsDark,
        fontSize: 16,
        fontWeight: .bold,
        fontStyle: .normal,
      ),
      prefixIconColor: AppColors.disableColor,
      prefixStyle: TextStyle(
        fontSize: 24,
        color: AppColors.disableColor,
      ),
      suffixIconColor:AppColors.disableColor,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r16),
          gapPadding: 8,
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.strokeDark,
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r16),
          gapPadding: 8,
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.strokeDark,
          )
      ),
    ),

    textTheme: TextTheme(
      bodyLarge:AppTextStyles.textS24SBStyle.copyWith(
        color: AppColors.mainColorDark,
      ) ,
      bodyMedium: AppTextStyles.textS20SBStyle.copyWith(
        color: AppColors.mainTextDark,
      ),
      bodySmall: AppTextStyles.textS16RStyle.copyWith(
        color: AppColors.secTextDark,
      ),
      labelMedium: AppTextStyles.textS18MStyle.copyWith(
        color: AppColors.mainColorDark,
      ),
      labelSmall: AppTextStyles.textS14BStyle.copyWith(
        color: AppColors.inputsLight,
      ),
      titleSmall: AppTextStyles.textS14BStyle.copyWith(
          color: AppColors.secTextDark,
          fontWeight: .w400
      ),
      titleLarge: AppTextStyles.textS20MStyle.copyWith(
        color: AppColors.inputsLight,
      ),
      displaySmall: AppTextStyles.textS12RStyle.copyWith(
        color: AppColors.mainColorDark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundDark,
      elevation: 2,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: .fixed,
      unselectedItemColor: AppColors.disableColor,
      selectedItemColor: AppColors.mainColorDark,
      selectedLabelStyle: AppTextStyles.textS12RStyle.copyWith(
        color: AppColors.mainColorDark,
      ),
      unselectedLabelStyle: AppTextStyles.textS12RStyle.copyWith(
        color: AppColors.disableColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorDark,
      elevation: 15,
      shape: CircleBorder(),
      foregroundColor: AppColors.inputsLight,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      iconTheme: const IconThemeData(
          color: AppColors.mainColorLight
      ),
      centerTitle: true,
      titleTextStyle: AppTextStyles.textS18MStyle.copyWith(
        color: AppColors.mainTextDark
      ),
    ),
  );
}
