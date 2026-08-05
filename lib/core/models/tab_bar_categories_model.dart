import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/generated/assets.dart';

class CategoriesModel {
  String id;
  String label;
  String iconPath;
  CategoriesModel({required this.id,required this.label,required this.iconPath});


  static List<CategoriesModel> getListCategories(){
    return [
      CategoriesModel(id: AppText.sports, label: AppText.sports.tr(), iconPath: Assets.icons.sport.path),
      CategoriesModel(id: AppText.birthday, label: AppText.birthday.tr(), iconPath: Assets.icons.birthday.path),
      CategoriesModel(id: AppText.bookClub, label: AppText.bookClub.tr(), iconPath: Assets.icons.book.path),
    ];
  }
}
