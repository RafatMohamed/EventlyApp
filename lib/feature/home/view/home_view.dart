import 'package:evently_app/core/shared/storge_local_hive.dart';
import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/utilities/helper/custom_widget_loading_data.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:evently_app/feature/home/view/widgets/custom_tab_bar_home.dart';
import 'package:evently_app/feature/home/view/widgets/my_event_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/models/tab_bar_categories_model.dart';
import '../../../core/service/Provider/auth_services.dart';
import '../../../core/service/Provider/current_Index_categories_provider.dart';
import '../../../core/service/Provider/get_event_services.dart';
import '../../../core/utilities/app_border_radius.dart';
import '../../../core/utilities/app_text.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/${AppText.routeHomeViewApp}";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late int currentIndexProvider;

 late GetEventServicesProvider eventProvider;

  Future<dynamic> getEvents() async {
    if (currentIndexProvider == 0) {

     return await eventProvider.getAllEvent();
    }
   return await eventProvider.getFilteredEvent(
      CategoriesModel.getListCategories()[currentIndexProvider - 1].id,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getEvents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<GetEventServicesProvider>(context, listen: false);
    currentIndexProvider = Provider.of<CurrentIndexCategoriesProvider>(
      context,
    ).currentIndex;
    final user = Provider.of<AuthServicesProvider>(context);
    bool isLight = ThemeMode.light.isLight;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  Text.rich(
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: .w400,
                      color: isLight
                          ? AppColors.secTextLight
                          : AppColors.secTextDark,
                    ),
                    TextSpan(
                      text: AppText.welcomeBack,
                      children: const [TextSpan(text: "✨")],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(user.user!.name, style: textTheme.bodyMedium),
                ],
              ),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: AppPadding.p8,
                ),
                decoration: BoxDecoration(
                  color: colorThem.disabledColor,
                  borderRadius: BorderRadius.circular(AppBorderRadius.r16),
                  border: Border.all(color: colorThem.unselectedWidgetColor),
                ),
                child: TextButton(
                  onPressed: () {
                    StorgeLocalHive.instance.clearIsFirstOpenApp();
                    Navigator.pushNamed(context, MyEventView.routeName);
                  },
                  child: Text(AppText.myEvent, style: textTheme.bodyMedium),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: AppPadding.p24,
            ),
            child: CustomTabBarHome(
              onCategorySelected: (value) {
                currentIndexProvider = value;
                Provider.of<CurrentIndexCategoriesProvider>(
                  context,
                  listen: false,
                ).changCurrentIndex(value);
                if (currentIndexProvider == 0) {
                  eventProvider.getAllEvent();
                } else {
                 eventProvider.getFilteredEvent(
                    CategoriesModel.getListCategories()[currentIndexProvider - 1].id,
                  );
                }
              },
              currentIndex: currentIndexProvider,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getEvents(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return CustomWidgetLoadingData.circleProgress(colorThem);
                }
                return eventProvider.filteredEvent.isEmpty
                    ? Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .stretch,
                        children: [
                          Text(
                            "You Don't have Event in this Categories \n${CategoriesModel.getListCategories()[currentIndexProvider - 1].id}",
                            textAlign: .center,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorThem.primaryColor,
                            ),
                          ),
                        ],
                      )
                    : CustomCardCategoriesItem(
                        events: Provider.of<GetEventServicesProvider>(
                          context,
                        ).filteredEvent,
                        onRefresh: () {
                          if (currentIndexProvider == 0) {
                            eventProvider.getAllEvent();
                          } else {
                            eventProvider.getFilteredEvent(
                              CategoriesModel.getListCategories()[currentIndexProvider -
                                      1]
                                  .id,
                            );
                          }
                        },
                        size: size,
                        colorThem: colorThem,
                        textTheme: textTheme,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
