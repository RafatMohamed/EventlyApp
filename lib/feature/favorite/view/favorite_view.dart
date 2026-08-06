import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/feature/home/view/widgets/custom_card_categories_item.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/service/Provider/get_event_services.dart';
import '../../../core/utilities/app_text.dart';

class FavoriteView extends StatelessWidget {
  static const String routeName = "/${AppText.routeFavoriteViewApp}";
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    final Size size =MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p16,vertical:AppPadding.p8),
      child: Column(
        spacing: 16,
        crossAxisAlignment: .start,
        children: [
          CustomTextFormField(hintText: AppText.searchEvent,suffixIconPath: Assets.icons.search.path,),
          Expanded(child: CustomCardCategoriesItem(events: Provider.of<GetEventServicesProvider>(
            context,
          ).filteredEvent,size: size, colorThem: colorThem, textTheme: textTheme))
        ],
      ),
    );
  }
}






