import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/widgets/default_app_bar_app.dart';
import 'package:evently_app/feature/event/model/event_model.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/service/Provider/get_event_services.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../core/utilities/helper/custom_widget_loading_data.dart';
import '../../../event/view/add_event_view.dart';

class MyEventView extends StatefulWidget {
  static const String routeName = "/${AppText.routeMyEventViewApp}";
  const MyEventView({super.key});

  @override
  State<MyEventView> createState() => _MyEventViewState();
}

class _MyEventViewState extends State<MyEventView> {
  late Future<List<EventModel>> myEventsFuture;
  @override
  void initState() {
    super.initState();
    myEventsFuture = context.read<GetEventServicesProvider>().getMyEvent();
  }

  Future<void> refreshEvents() async {
    setState((){
      myEventsFuture = context.read<GetEventServicesProvider>().getMyEvent();
    });
  }

  List<EventModel>? listEvents;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: defaultAppBarApp(
        context,
        themeColor: colorThem,
        title: AppText.myEvent,
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
              child: FutureBuilder<List<EventModel>>(
                future: myEventsFuture,
                builder: (context, snapshot) {
                  final events= snapshot.data ??[];
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomWidgetLoadingData.circleProgress(colorThem);
                  }
                  if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorThem.primaryColorLight,
                      ),
                    );
                  }
                  if (events.isEmpty){
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
                            var result = await Navigator.pushNamed(
                              context,
                              AddEventView.routeName,
                              arguments: (isUpdate: false, event: null),
                            );
                            if (result == true) {
                              return refreshEvents();
                            }
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
                  if (events.isNotEmpty) {
                    return CustomCardCategoriesItem(
                      onRefresh:refreshEvents,
                      events:events,
                      size: size,
                      colorThem: colorThem,
                      textTheme: textTheme,
                    );
                  }
                  return const Center(
                    child: Text(
                      "Tarb yeh",
                      style: TextStyle(
                        color: AppColors.backgroundDark,
                        fontSize: 50,
                      ),
                    ),
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
