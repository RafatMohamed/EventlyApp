import 'package:evently_app/core/service/Provider/get_event_services.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    tabController = TabController(length: CategoriesModel.getListCategories().length +1 , vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var eventProvider= Provider.of<GetEventServicesProvider>(context,listen: false);
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
        if(currentIndex==0){
          eventProvider.getAllEvent();
        }else{
          eventProvider.getFilteredEvent(CategoriesModel.getListCategories()[currentIndex-1].id);
        }
        setState(() {});
      },
      tabs:[
        TabBarCategoriesItem(isSelected: currentIndex==0,categories: CategoriesModel(id:"all", label: AppText.all, iconPath: Assets.icons.iconCategoriesAll.path),),
        ...List.generate(CategoriesModel.getListCategories().length, (index) {
          final isSelected = currentIndex == index+1;
          final CategoriesModel categorie =CategoriesModel.getListCategories()[index];
          return TabBarCategoriesItem(isSelected: isSelected,categories: categorie,);
        })
      ],
    );
  }
}

