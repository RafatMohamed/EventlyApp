import 'package:flutter/material.dart';

import '../../../../core/utilities/app_border_radius.dart';
import '../../../../core/utilities/app_colors.dart';
import 'on_boarding_item.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.widget, required this.onTap,
  });

  final OnBoardingItem widget;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: .center,
      children: List.generate(4, (indexIndicator) {
        bool isSelected = widget.currentIndex == indexIndicator;
        return GestureDetector(
          onTap:() => onTap(indexIndicator),
          child: Container(
            height: 10,
            width: isSelected ? 25 : 10,
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : AppColors.disableColor,
              borderRadius: BorderRadiusDirectional.circular(
                AppBorderRadius.r8,
              ),
            ),
          ),
        );
      }),
    );
  }
}
