import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../core/models/tab_bar_categories_model.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../home/view/widgets/custom_tab_bar_categories_item.dart';

class CustomTabBarAddEditeEvent extends StatefulWidget {
  CustomTabBarAddEditeEvent({super.key, required this.selectedCategory, required this.onCategorySelected, required this.currentIndex});
  final CategoriesModel selectedCategory;
  final ValueChanged<CategoriesModel> onCategorySelected;
  int currentIndex;
  @override
  State<CustomTabBarAddEditeEvent> createState() =>
      _CustomTabBarAddEditeEventState();
}

class _CustomTabBarAddEditeEventState extends State<CustomTabBarAddEditeEvent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    log(widget.currentIndex.toString());
    tabController = TabController(
      length: CategoriesModel.getListCategories().length,
      vsync: this,
      initialIndex: widget.currentIndex,
    );
    log(widget.currentIndex.toString());
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
        widget.currentIndex=value;
        widget.onCategorySelected(CategoriesModel.getListCategories()[widget.currentIndex]);
        setState((){});
      },
      tabs: List.generate(CategoriesModel.getListCategories().length, (index) {
        final isSelected = widget.currentIndex == index;
        final CategoriesModel categoriesModel = CategoriesModel.getListCategories()[index];
        return TabBarCategoriesItem(
          isSelected: isSelected,
          categories: categoriesModel,
        );
      }),
    );
  }
}

