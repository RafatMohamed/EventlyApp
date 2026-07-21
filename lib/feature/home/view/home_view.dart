import 'package:flutter/material.dart';

import '../../../core/utilities/app_text.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "/${AppText.routeHomeViewApp}";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Home",style: Theme.of(context).textTheme.titleMedium,));
  }
}
