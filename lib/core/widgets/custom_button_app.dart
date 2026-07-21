import 'package:flutter/material.dart';
import '../utilities/app_border_radius.dart';
import '../utilities/app_padding.dart';

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    final ThemeData them = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: .center,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(AppPadding.p16),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
          color: them.primaryColor,
          border: Border.all(color: them.unselectedWidgetColor),
        ),
        child: Text(text, style: them.textTheme.titleLarge),
      ),
    );
  }
}
