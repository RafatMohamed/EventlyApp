import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/service/getPathImageService/get_path_img_services.dart';
import 'package:evently_app/core/utilities/helper/custom_widget_loading_data.dart';
import 'package:evently_app/feature/add_event/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/service/Provider/get_event_services.dart';
import '../../../../core/service/Provider/them_app_service.dart';
import '../../../../core/utilities/app_border_radius.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../generated/assets.dart';

class CustomCardCategoriesItem extends StatelessWidget {
  const CustomCardCategoriesItem({
    super.key,
    required this.size,
    required this.colorThem,
    required this.textTheme,
  });

  final Size size;
  final ThemeData colorThem;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    List<EventModel> events = Provider.of<GetEventServicesProvider>(
      context,
    ).filteredEvent;
    bool isDark() {
      if (Provider.of<ThemAppService>(context).currentThem == ThemeMode.dark) {
        return true;
      }
      return false;
    }

    return FutureBuilder(
      future: Provider.of<GetEventServicesProvider>(context).getAllEvent(),
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return CustomWidgetLoadingData.circleProgrees(colorThem);
        // }
        if(snapshot.hasError){
          return  Text(
            snapshot.error.toString(),
            style: textTheme.bodySmall?.copyWith(
              color: colorThem.primaryColorLight,
            ),
          );
        }

        if(snapshot.toString().isEmpty){
          return  Text(
            "No Data Yet",
            style: textTheme.bodySmall?.copyWith(
              color: colorThem.primaryColorLight,
            ),
          );
        }

        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            EventModel event = events[index];
            return Container(
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
                      border: Border.all(
                        color: colorThem.unselectedWidgetColor,
                      ),
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
                      border: Border.all(
                        color: colorThem.unselectedWidgetColor,
                      ),
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
            );
          },
        );
      },
    );
  }
}
