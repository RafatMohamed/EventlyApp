import 'package:evently_app/core/utilities/app_text.dart';
import 'package:flutter/material.dart';

class CategoriesModel {
  String id;
  String label;
  IconData iconData;
  CategoriesModel({required this.id,required this.label,required this.iconData});

  static List<CategoriesModel> listTabBarCategories=[
    CategoriesModel(id: AppText.sports, label: AppText.sports, iconData: Icons.sports_esports_outlined),
    CategoriesModel(id: AppText.birthday, label: AppText.birthday, iconData: Icons.cake_outlined),
  ];
}
