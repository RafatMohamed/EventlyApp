import 'package:flutter/material.dart';
import '../../../../core/models/tab_bar_categories_model.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import 'custom_tab_bar_categories_item.dart';

class CustomTabBarHome extends StatefulWidget {
  const CustomTabBarHome({super.key});
  @override
  State<CustomTabBarHome> createState() => _CustomTabBarHomeState();
}

class _CustomTabBarHomeState extends State<CustomTabBarHome> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: CategoriesModel.listTabBarCategories.length +1 , vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
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
      onTap: (value) {
        currentIndex = value;
        setState(() {});
      },
      tabs:[
        TabBarCategoriesItem(isSelected: currentIndex==0,categories: CategoriesModel(id:AppText.all, label: AppText.all, iconData: Icons.category_outlined),),
        ...List.generate(CategoriesModel.listTabBarCategories.length, (index) {
          final isSelected = currentIndex-1 == index;
          final CategoriesModel categorie =CategoriesModel.listTabBarCategories[index];
          return TabBarCategoriesItem(isSelected: isSelected,categories: categorie,);
        })
      ],
    );
  }
}

