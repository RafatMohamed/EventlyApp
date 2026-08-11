import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/tab_bar_categories_model.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import 'custom_tab_bar_categories_item.dart';

class CustomTabBarHome extends StatefulWidget {

  final ValueChanged<int> onCategorySelected;
  final int currentIndex;
  const CustomTabBarHome({super.key, required this.onCategorySelected, required this.currentIndex});


  @override
  State<CustomTabBarHome> createState() => _CustomTabBarHomeState();
}

class _CustomTabBarHomeState extends State<CustomTabBarHome> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoriesModel.getListCategories().length +1,
      child: TabBar(
        isScrollable: true,
        tabAlignment: .start,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        overlayColor: const WidgetStatePropertyAll(
            Colors.transparent
        ),
        labelPadding:const EdgeInsetsDirectional.only(
            end: AppPadding.p16
        ),
        onTap: (currentTap) {

          widget.onCategorySelected(currentTap);
        },
        tabs:[
          TabBarCategoriesItem(isSelected: widget.currentIndex==0,categories: CategoriesModel(id:"all", label: AppText.all, iconPath: Assets.icons.iconCategoriesAll.path),),
          ...List.generate(CategoriesModel.getListCategories().length, (index) {
            final isSelected = widget.currentIndex == index+1;
            final CategoriesModel categorie =CategoriesModel.getListCategories()[index];
            return TabBarCategoriesItem(isSelected: isSelected,categories: categorie,);
          })
        ],
      ),
    );
  }
}

