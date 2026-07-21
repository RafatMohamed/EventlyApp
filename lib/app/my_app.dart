import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/feature/on_boarding/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../core/utilities/app_them.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, WidgetBuilder> routesApp = <String, WidgetBuilder>{
      OnBoardingView.routeName:(context) => const OnBoardingView(),
    };

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppText.appName,
      themeMode: .light,
      darkTheme: AppThem.darkThem,
      theme: AppThem.lightThem,
      routes: routesApp,
      initialRoute:OnBoardingView.routeName,
    );
  }
}
