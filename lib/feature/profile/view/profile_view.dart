import 'package:flutter/material.dart';

import '../../../core/utilities/app_text.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = "/${AppText.routeProfileViewApp}";
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Profile",style: Theme.of(context).textTheme.titleMedium,));
  }
}
