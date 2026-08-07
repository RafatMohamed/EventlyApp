import 'package:evently_app/core/shared/storge_local_hive.dart';
import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:evently_app/feature/home/view/widgets/custom_tab_bar_home.dart';
import 'package:evently_app/feature/home/view/widgets/my_event_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/service/Provider/auth_services.dart';
import '../../../core/service/Provider/get_event_services.dart';
import '../../../core/utilities/app_border_radius.dart';
import '../../../core/utilities/app_text.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/${AppText.routeHomeViewApp}";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 4,),
                  Text(user.user!.name, style: textTheme.bodyMedium),
                ],
              ),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppPadding.p8,
                  vertical: AppPadding.p8,
                ),
                decoration: BoxDecoration(
                    color:colorThem.disabledColor,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r16),
                    border: Border.all(
                        color: colorThem.unselectedWidgetColor
                    )
                ),
                child:TextButton(
                  onPressed: () {
                    StorgeLocalHive.instance.clearIsFirstOpenApp();
                    Navigator.pushNamed(context, MyEventView.routeName);
                  },
                  child: Text(AppText.myEvent, style: textTheme.bodyMedium),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: AppPadding.p24),
            child: CustomTabBarHome(),
          ),
          Expanded(
            child: CustomCardCategoriesItem(
              events: Provider.of<GetEventServicesProvider>(
                context,
              ).filteredEvent,
              onRefresh: () {},
              size: size,
              colorThem: colorThem,
              textTheme: textTheme,
            ),
          ),
        ],
      ),
    );
  }
}
