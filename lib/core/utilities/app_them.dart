import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppThem {
  static ThemeData lightThem = ThemeData(
    primaryColor: AppColors.mainColorLight,
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
    ),
  );
  static ThemeData darkThem = ThemeData(
    primaryColor: AppColors.mainColorDark,
    disabledColor: AppColors.inputsLight,
    unselectedWidgetColor: AppColors.strokeDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
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
    ),
  );
}
