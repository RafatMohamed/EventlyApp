import 'package:evently_app/feature/profile/view/widgets/custom_info_profile.dart';
import 'package:evently_app/feature/profile/view/widgets/custom_them_profile_app.dart';
import 'package:flutter/material.dart';
import '../../../core/utilities/app_text.dart';
import 'package:evently_app/core/utilities/app_padding.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = "/${AppText.routeProfileViewApp}";
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = ThemeMode.light.isLight;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      child: Column(
        children: [
          const SizedBox(height: 36),
          CustomBuildInfoPerson(textTheme: textTheme, isLight: isLight, colorThem: colorThem,),
          const SizedBox(height: 32),
          CustomBuildThemProfileApp(colorThem: colorThem, textTheme: textTheme),
        ],
      ),
    );
  }
}



