import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsetsDirectional.all(AppPadding.p10),
            height: size.height*0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
                color:colorThem.primaryColor,
                border: Border.all(
                    color: colorThem.unselectedWidgetColor
                ),
                image: DecorationImage(image: AssetImage(Assets.images.png.birthdayLight.path),fit: .fill)
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
                          color: colorThem.unselectedWidgetColor
                      )
                  ),
                  child: Text("21 Jan",style: textTheme.bodySmall?.copyWith(
                      color: colorThem.primaryColor
                  ),),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(AppPadding.p10),
                  decoration: BoxDecoration(
                      color: colorThem.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(AppBorderRadius.r8),
                      border: Border.all(
                          color: colorThem.unselectedWidgetColor
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("This is a Birthday Party ",style: textTheme.bodySmall?.copyWith(
                          color: colorThem.primaryColorLight
                      ),),
                      SvgPicture.asset(Assets.icons.favorite.path,fit: .scaleDown,)
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
