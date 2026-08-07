import 'package:evently_app/core/models/tab_bar_categories_model.dart';
import 'package:evently_app/core/service/getPathImageService/get_path_img_services.dart';
import 'package:evently_app/core/widgets/default_app_bar_app.dart';
import 'package:evently_app/feature/event/model/event_model.dart';
import 'package:evently_app/feature/event/view/widgets/custom_add_event_body.dart';
import 'package:evently_app/feature/event/view/widgets/custom_tab_bar_add_edite_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/service/Provider/them_app_service.dart';
import '../../../core/utilities/app_border_radius.dart';
import '../../../core/utilities/app_padding.dart';
import '../../../core/utilities/app_text.dart';

class AddEventView extends StatefulWidget {
  static const String routeName = "/${AppText.routeAddEventViewApp}";
  const AddEventView({super.key, required this.isEdite, this.event});
  final bool isEdite;
  final EventModel? event;
  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  late CategoriesModel selectCategories;

  @override
  void initState() {
    super.initState();

    selectCategories = widget.isEdite
        ? widget.event!.categories
        : CategoriesModel.getListCategories().first;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark() {
      return context.watch<ThemAppService>().currentThem == ThemeMode.dark;
    }

    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: defaultAppBarApp(
        context,
        themeColor: colorThem,
        title: widget.isEdite
            ? AppText.updateEvent
            : AppText.addEvent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          child: Column(
            spacing: AppPadding.p16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p10),
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppBorderRadius.r16),
                  border: Border.all(
                    color: colorThem.unselectedWidgetColor,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/png/${GetPathImgServices.getPathImage(selectCategories: selectCategories)}${isDark() ? "_dark" : "_light"}.png",
                    ),
                  ),
                ),
              ),

              CustomTabBarAddEditeEvent(
                currentIndex: CategoriesModel.getListCategories()
                    .indexWhere((e) => e.id == selectCategories.id),

                selectedCategory: selectCategories,

                onCategorySelected: (value) {
                  setState(() {
                    selectCategories = value;
                  });
                },
              ),

              DefaultAddEvent(
                event: widget.event,
                pathImage: GetPathImgServices.getPathImage(
                  selectCategories: selectCategories,
                ),
                categorie: selectCategories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}