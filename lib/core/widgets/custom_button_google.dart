import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import '../utilities/app_border_radius.dart';
import '../utilities/app_padding.dart';
import '../utilities/app_text.dart';

class CustomButtonGoogle extends StatelessWidget {
  const CustomButtonGoogle({super.key, required this.onTap, required this.text});
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
          color: them.disabledColor,
          border: Border.all(color: them.unselectedWidgetColor),
        ),
        child: Row(
          spacing: 16,
          mainAxisAlignment: .center,
          children: [
            Image.asset(Assets.icons.googlePng.path,fit: .scaleDown,height: 24,),
            Text.rich(
              textAlign: .center,
              style: them.textTheme.labelMedium,
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: text),
                  const TextSpan(text: " "),
                  TextSpan(text: AppText.withGoogle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
