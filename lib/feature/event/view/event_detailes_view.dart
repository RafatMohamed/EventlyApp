import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/models/tab_bar_categories_model.dart';
import 'package:evently_app/core/service/EventServiceFirebase/event_services.dart';
import 'package:evently_app/core/service/Provider/get_event_services.dart';
import 'package:evently_app/core/service/getPathImageService/get_path_img_services.dart';
import 'package:evently_app/core/utilities/app_colors.dart';
import 'package:evently_app/core/utilities/helper/custom_widget_loading_data.dart';
import 'package:evently_app/core/widgets/default_app_bar_app.dart';
import 'package:evently_app/feature/event/model/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/service/Provider/them_app_service.dart';
import '../../../core/utilities/app_border_radius.dart';
import '../../../core/utilities/app_padding.dart';
import '../../../core/utilities/app_text.dart';
import '../../../core/utilities/helper/custom_snack_bar_app.dart';
import 'add_event_view.dart';

class EventDetailsView extends StatefulWidget {
  static const String routeName = "/${AppText.routeEventDetailsViewApp}";
  const EventDetailsView({super.key, required this.event});
  final EventModel event;

  @override
  State<EventDetailsView> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetailsView> {
  bool isLoadingUpdate = false;
  bool isLoadingDelete = false;
  late CategoriesModel categories = widget.event.categories;
  @override
  Widget build(BuildContext context) {
    bool isDark() {
      if (Provider.of<ThemAppService>(context).currentThem == ThemeMode.dark) {
        return true;
      }
      return false;
    }

    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: defaultAppBarApp(
        context,
        themeColor: colorThem,
        title: AppText.eventDetails,
        actions:
            widget.event.eventOwner == FirebaseAuth.instance.currentUser?.uid
            ? [
                IgnorePointer(
                  ignoring: isLoadingUpdate,
                  child: GestureDetector(
                    onTap: () async {
                      var eventModelBack = await Navigator.pushNamed(
                        context,
                        AddEventView.routeName,
                        arguments: (isUpdate: true, event: widget.event),
                      );
                      if (eventModelBack is EventModel && eventModelBack.pathImage.isNotEmpty) {
                        widget.event.title = eventModelBack.title;
                        widget.event.desc = eventModelBack.desc;
                        widget.event.dateTime = eventModelBack.dateTime;
                        widget.event.pathImage = eventModelBack.pathImage;
                        widget.event.categories=eventModelBack.categories;
                        categories = widget.event.categories;
                      }
                    },
                    child: Container(
                            alignment: .center,
                            padding: const EdgeInsetsDirectional.all(AppPadding.p4),
                            margin: const EdgeInsetsDirectional.only(
                              start: AppPadding.p16,
                              bottom: AppPadding.p10,
                              top: AppPadding.p10,
                            ),
                            decoration: BoxDecoration(
                              color: colorThem.disabledColor,
                              borderRadius: BorderRadius.circular(
                                AppBorderRadius.r8,
                              ),
                              border: Border.all(
                                color: colorThem.unselectedWidgetColor,
                                style: .solid,
                              ),
                            ),
                            child:isLoadingUpdate
                                ? CustomWidgetLoadingData.circleProgrees(colorThem)
                                : Icon(
                              Icons.edit_rounded,
                              size: 24,
                              color: colorThem.primaryColor,
                              fill: .minPositive,
                            ),
                          ),
                  ),
                ),
                IgnorePointer(
                  ignoring: isLoadingDelete,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoadingDelete = true;
                      });
                      EventServicesFirebase.deleteEventFirebase(
                            widget.event.eventID,
                          )
                          .then((_) {
                            if (!context.mounted) return;
                            ShowMess.successMess(
                              context: context,
                              mess: "Delete Event Success",
                            );
                            Navigator.of(context).pop();
                            Provider.of<GetEventServicesProvider>(
                              context,
                              listen: false,
                            ).getAllEvent();
                          })
                          .catchError((error) {
                            setState(() {
                              isLoadingDelete = false;
                            });
                            if (!context.mounted) return;
                            ShowMess.successMess(
                              context: context,
                              mess: "Failed Delete Event $error",
                            );
                          });
                    },
                    child:  Container(
                            alignment: .center,
                            padding: const EdgeInsetsDirectional.all(AppPadding.p4),
                            margin: const EdgeInsetsDirectional.only(
                              start: AppPadding.p16,
                              bottom: AppPadding.p10,
                              top: AppPadding.p10,
                              end: AppPadding.p16,
                            ),
                            decoration: BoxDecoration(
                              color: colorThem.disabledColor,
                              borderRadius: BorderRadius.circular(
                                AppBorderRadius.r8,
                              ),
                              border: Border.all(
                                color: colorThem.unselectedWidgetColor,
                                style: .solid,
                              ),
                            ),
                            child:isLoadingDelete
                                ? CustomWidgetLoadingData.circleProgrees(colorThem)
                                : const Icon(
                              Icons.delete_outlined,
                              size: 24,
                              color: AppColors.redColor,
                              fill: .minPositive,
                            ),
                          ),
                  ),
                ),
              ]
            : [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          child: Column(
            spacing: AppPadding.p16,
            crossAxisAlignment: .start,
            children: [
              Container(
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
                      "assets/images/png/${GetPathImgServices.getPathImage(selectCategories: categories)}${isDark() ? "_dark" : "_light"}.png",
                    ),
                    fit: .fill,
                  ),
                ),
              ),
              Text(
                widget.event.title,
                style: colorThem.textTheme.bodySmall?.copyWith(
                  color: colorThem.primaryColorLight,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.all(AppPadding.p16),
                decoration: BoxDecoration(
                  color: colorThem.disabledColor,
                  borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                  border: Border.all(
                    color: colorThem.unselectedWidgetColor,
                    style: .solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colorThem.scaffoldBackgroundColor,
                        borderRadius: BorderRadiusDirectional.circular(
                          AppBorderRadius.r8,
                        ),
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: colorThem.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          DateFormat("dd MMMM").format(widget.event.dateTime),
                          style: colorThem.textTheme.bodySmall?.copyWith(
                            color: colorThem.primaryColorLight,
                          ),
                        ),
                        Text(
                          DateFormat("hh:mm a").format(widget.event.dateTime),
                          style: colorThem.textTheme.bodySmall?.copyWith(
                            color: colorThem.secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    AppText.desc,
                    style: colorThem.textTheme.bodySmall?.copyWith(
                      color: colorThem.primaryColorLight,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsetsDirectional.all(AppPadding.p20),
                    decoration: BoxDecoration(
                      color: colorThem.disabledColor,
                      borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                      border: Border.all(
                        color: colorThem.unselectedWidgetColor,
                        style: .solid,
                      ),
                    ),
                    child: Text(
                      widget.event.desc,
                      style: colorThem.textTheme.bodySmall?.copyWith(
                        color: colorThem.primaryColorLight,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
