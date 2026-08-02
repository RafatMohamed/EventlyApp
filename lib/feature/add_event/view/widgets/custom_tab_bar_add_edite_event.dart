import 'package:flutter/material.dart';
import '../../../../core/models/tab_bar_categories_model.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../home/view/widgets/custom_tab_bar_categories_item.dart';

class CustomTabBarAddEditeEvent extends StatefulWidget {
  const CustomTabBarAddEditeEvent({super.key, required this.selectedCategory, required this.onCategorySelected});
  final CategoriesModel selectedCategory;
  final ValueChanged<CategoriesModel> onCategorySelected;
  @override
  State<CustomTabBarAddEditeEvent> createState() =>
      _CustomTabBarAddEditeEventState();
}

class _CustomTabBarAddEditeEventState extends State<CustomTabBarAddEditeEvent>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: CategoriesModel.listTabBarCategories.length,
      vsync: this,
    );
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
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      labelPadding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
      onTap: (value) {
        currentIndex = value;
        widget.onCategorySelected(CategoriesModel.listTabBarCategories[currentIndex]);
        setState((){});
      },
      tabs: List.generate(CategoriesModel.listTabBarCategories.length, (index) {
        final isSelected = currentIndex == index;
        final CategoriesModel categoriesModel = CategoriesModel.listTabBarCategories[index];
        return TabBarCategoriesItem(
          isSelected: isSelected,
          categories: categoriesModel,
        );
      }),
    );
  }
}
