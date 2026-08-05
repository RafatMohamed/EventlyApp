import 'package:evently_app/core/models/tab_bar_categories_model.dart';

import '../../utilities/app_text.dart';

class GetPathImgServices {
 static String getPathImage({required CategoriesModel selectCategories}) {
    if (selectCategories.id == AppText.sports) {
      return "sport";
    }
    if (selectCategories.id == AppText.birthday) {
      return "birthday";
    }
    if (selectCategories.id == AppText.bookClub) {
      return "bookClub";
    }
    if (selectCategories.id == AppText.meeting) {
      return "meeting";
    }
    return "logo";
  }
}