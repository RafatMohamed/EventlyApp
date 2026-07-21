import 'package:evently_app/core/utilities/app_colors.dart';
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
    textTheme: TextTheme(
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
    textTheme: TextTheme(
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
