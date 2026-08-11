import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/feature/event/model/event_model.dart';
import 'package:evently_app/feature/favorite/services/favourite_event_.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_text.dart';
import '../../../core/utilities/helper/custom_widget_loading_data.dart';

class FavoriteView extends StatefulWidget {
  static const String routeName = "/${AppText.routeFavoriteViewApp}";
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {

 late Future<List<EventModel>> events;
  @override
  void initState() {
    events = Provider.of<FavouriteEventServicesProvider>(context,listen: false).getFavouriteMyEvent();
    super.initState();
  }

 Future<void> refreshEvents() async {
   setState(() {
     events = context
         .read<FavouriteEventServicesProvider>()
         .getFavouriteMyEvent();
   });
 }


  @override
  Widget build(BuildContext context) {
   var eventsBuild = Provider.of<FavouriteEventServicesProvider>(context).myFavouriteEvent;

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      child: FutureBuilder(
        future: events,
        builder: (context, snapshot) {
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
          if (snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "You Don't have Favourite Event ,please return  to Home",
                  textAlign: .center,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorThem.primaryColor,
                  ),
                ),
              ],
            );
          }
          if (snapshot.data!.isNotEmpty && snapshot.hasData) {
            return Column(
              spacing: 16,
              crossAxisAlignment: .start,
              children: [
                CustomTextFormField(
                  hintText: AppText.searchEvent,
                  suffixIconPath: Assets.icons.search.path,
                ),
                Expanded(
                  child: CustomCardCategoriesItem(
                    onRefresh: () {},
                    events: eventsBuild,
                    size: size,
                    colorThem: colorThem,
                    textTheme: textTheme,
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text(
              "Tarb yeh",
              style: TextStyle(color: AppColors.backgroundDark, fontSize: 50),
            ),
          );
        },
      ),
    );
  }
}
