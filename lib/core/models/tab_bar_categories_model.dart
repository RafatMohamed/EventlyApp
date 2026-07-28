import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';

class CategoriesModel {
  String id;
  String label;
  String iconPath;
  CategoriesModel({required this.id,required this.label,required this.iconPath});

  static List<CategoriesModel> listTabBarCategories=[
    CategoriesModel(id: AppText.sports, label: AppText.sports, iconPath: Assets.icons.sport.path),
    CategoriesModel(id: AppText.birthday, label: AppText.birthday, iconPath: Assets.icons.birthday.path),
    CategoriesModel(id: AppText.bookClub, label: AppText.bookClub, iconPath: Assets.icons.book.path),
  ];
}
