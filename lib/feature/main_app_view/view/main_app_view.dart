import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/service/Provider/current_Index_categories_provider.dart';
import 'package:evently_app/feature/favorite/view/favorite_view.dart';
import 'package:evently_app/feature/home/view/home_view.dart';
import 'package:evently_app/feature/profile/view/profile_view.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utilities/app_text.dart';
import '../../event/view/add_event_view.dart';
import '../widgets/custom_build_bottom_nav_bar_item.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});
  static const String routeName = "/${AppText.routeMainApp}";

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabsView = [
      const HomeView(),
      const FavoriteView(),
      const ProfileView(),
    ];
    List<BottomNavigationBarItem> iconBottomNavBar = [
      BottomNavigationBarItem(
        activeIcon: BottomNavBarItemActive(
          pathIcon: Assets.icons.homeSelect.path,
        ),
        icon: BottomNavBarItemNotActive(pathIcon: Assets.icons.home.path),
        label: AppText.home.tr(context: context),
      ),
      BottomNavigationBarItem(
        activeIcon: BottomNavBarItemActive(
          pathIcon: Assets.icons.favouriteSelect.path,
        ),
        icon: BottomNavBarItemNotActive(pathIcon: Assets.icons.favorite.path),
        label: AppText.favorite.tr(context: context),
      ),
      BottomNavigationBarItem(
        activeIcon: BottomNavBarItemActive(
          pathIcon: Assets.icons.userSelect.path,
        ),
        icon: BottomNavBarItemNotActive(pathIcon: Assets.icons.user.path),
        label: AppText.profile.tr(context: context),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: tabsView),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: iconBottomNavBar,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddEventView.routeName,
            arguments: (isUpdate: false, event: null),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
