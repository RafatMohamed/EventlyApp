import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/widgets/default_app_bar_app.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:evently_app/feature/home/view/widgets/custom_tab_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/service/Provider/auth_services.dart';
import '../../../../core/service/Provider/get_event_services.dart';
import '../../../../core/utilities/app_text.dart';

class MyEventView extends StatelessWidget {
  static const String routeName = "/${AppText.routeMyEventViewApp}";
  const MyEventView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthServicesProvider>(context);
    bool isLight = ThemeMode.light.isLight;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: defaultAppBarApp(
        context,
        themeColor: colorThem,
        title: "My EVent",
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p8,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: FutureBuilder(
                future: Provider.of<GetEventServicesProvider>(
                  context,
                ).getMyEvent(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return CustomWidgetLoadingData.circleProgrees(colorThem);
                  // }
                  if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorThem.primaryColorLight,
                      ),
                    );
                  }
                  if (snapshot.toString().isEmpty) {
                    return Text(
                      "No Data Yet",
                      style: textTheme.bodySmall?.copyWith(
                        color: colorThem.primaryColorLight,
                      ),
                    );
                  }
                  return CustomCardCategoriesItem(
                    events: Provider.of<GetEventServicesProvider>(
                      context,
                    ).myEvent,
                    size: size,
                    colorThem: colorThem,
                    textTheme: textTheme,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
