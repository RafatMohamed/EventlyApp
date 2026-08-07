import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/widgets/default_app_bar_app.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/service/Provider/get_event_services.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../core/utilities/helper/custom_widget_loading_data.dart';
import '../../../event/view/add_event_view.dart';

class MyEventView extends StatelessWidget {
  static const String routeName = "/${AppText.routeMyEventViewApp}";
  const MyEventView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomWidgetLoadingData.circleProgrees(colorThem);
                  }
                  if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorThem.primaryColorLight,
                      ),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return Column(
                      mainAxisAlignment: .center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: AppPadding.p16,
                              vertical: AppPadding.p10,
                            ),
                            backgroundColor: colorThem.primaryColor,
                          ),
                          onPressed: () async {
                            await Navigator.pushNamed(
                              context,
                              AddEventView.routeName,
                              arguments: (isUpdate: false, event: null),
                            );
                          },
                          child: Text(
                            "You Dont have Own Events Please Click to add Event",
                            textAlign: .center,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorThem.scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasData) {
                    return CustomCardCategoriesItem(
                      events: Provider.of<GetEventServicesProvider>(
                        context,
                      ).myEvent,
                      size: size,
                      colorThem: colorThem,
                      textTheme: textTheme,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
