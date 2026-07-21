import 'package:flutter/material.dart';

import '../utilities/app_border_radius.dart';
import '../utilities/app_padding.dart';

class CustomContainerApp extends StatelessWidget {
  const CustomContainerApp({super.key, required this.isSelected, required this.child,});
  final bool isSelected;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final ThemeData them =Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r8),
        color: isSelected
            ? them.primaryColor
            : them.disabledColor,
        border: Border.all(
          color: isSelected
              ? Colors.transparent
              : them.unselectedWidgetColor,
        ),
      ),
      child: child,
    );
  }
}
