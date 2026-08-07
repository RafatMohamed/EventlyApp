import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/service/getPathImageService/get_path_img_services.dart';
import 'package:evently_app/feature/event/view/event_detailes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/service/Provider/them_app_service.dart';
import '../../../../core/utilities/app_border_radius.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../generated/assets.dart';
import '../../../event/model/event_model.dart';

class CustomCardCategoriesItem extends StatelessWidget {
  const CustomCardCategoriesItem({
    super.key,
    required this.size,
    required this.colorThem,
    required this.textTheme,
    required this.events,
    required this.onRefresh,
  });

  final Size size;
  final ThemeData colorThem;
  final TextTheme textTheme;
  final List<EventModel> events;
  final VoidCallback onRefresh;
  @override
  Widget build(BuildContext context) {
    bool isDark() {
      if (Provider.of<ThemAppService>(context).currentThem == ThemeMode.dark) {
        return true;
      }
      return false;
    }

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        EventModel event = events[index];
        return GestureDetector(
          onTap: () async {
            var result = await Navigator.pushNamed(
              context,
              EventDetailsView.routeName,
              arguments: events[index],
            );
            if (result==true) {
              onRefresh();
            }
          },
          child: Container(
            margin: const EdgeInsetsDirectional.only(bottom: AppPadding.p16),
            padding: const EdgeInsetsDirectional.all(AppPadding.p10),
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(
                AppBorderRadius.r16,
              ),
              color: Colors.transparent,
              border: Border.all(color: colorThem.unselectedWidgetColor),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/png/${GetPathImgServices.getPathImage(selectCategories: event.categories)}${isDark() ? "_dark" : "_light"}.png",
                ),
                fit: .fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(AppPadding.p10),
                  decoration: BoxDecoration(
                    color: colorThem.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                    border: Border.all(color: colorThem.unselectedWidgetColor),
                  ),
                  child: Text(
                    DateFormat("dd MMM").format(event.dateTime),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorThem.primaryColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(AppPadding.p10),
                  decoration: BoxDecoration(
                    color: colorThem.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                    border: Border.all(color: colorThem.unselectedWidgetColor),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        event.title,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorThem.primaryColorLight,
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.icons.favorite.path,
                        fit: .scaleDown,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
