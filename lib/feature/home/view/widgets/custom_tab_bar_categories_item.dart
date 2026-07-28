import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/models/tab_bar_categories_model.dart';
import '../../../../core/utilities/app_border_radius.dart';
import '../../../../core/utilities/app_padding.dart';

class TabBarCategoriesItem extends StatelessWidget {
  const TabBarCategoriesItem({
    super.key,
    required this.isSelected,
    required this.categories
  });

  final bool isSelected;
  final CategoriesModel categories;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
          color: isSelected
              ? colorThem.primaryColor
              : colorThem.disabledColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.r16),
          border: Border.all(
              color: colorThem.unselectedWidgetColor
          )
      ),
      child: Row(
        spacing:8,
        mainAxisAlignment: .center,
        children: [
          SvgPicture.asset(categories.iconPath,colorFilter: ColorFilter.mode(isSelected
              ? colorThem.disabledColor
              : colorThem.primaryColor.withValues(alpha: 0.5),BlendMode.srcIn),
          ),
          Text(
            categories.label,
            style: textTheme.bodySmall?.copyWith(
              color: isSelected
                  ? colorThem.disabledColor
                  : colorThem.primaryColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
