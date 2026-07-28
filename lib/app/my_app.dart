import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/feature/main_app_view/view/main_app_view.dart';
import 'package:evently_app/feature/on_boarding/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../core/utilities/app_them.dart';
import '../feature/add_event/view/add_event_view.dart';
import '../feature/favorite/view/favorite_view.dart';
import '../feature/home/view/home_view.dart';
import '../feature/login/view/login_view.dart';
import '../feature/profile/view/profile_view.dart';
import '../feature/register/view/sign_up_view.dart';
import '../feature/reset_pass/view/reset_pass_view.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routesApp = <String, WidgetBuilder>{
      OnBoardingView.routeName: (context) => const OnBoardingView(),
      MainAppView.routeName: (context) => const MainAppView(),
      LoginView.routeName: (context) => const LoginView(),
      SignUpView.routeName: (context) => const SignUpView(),
      ResetPasswordView.routeName: (context) => const ResetPasswordView(),
      HomeView.routeName: (context) => const HomeView(),
      FavoriteView.routeName: (context) => const FavoriteView(),
      ProfileView.routeName: (context) => const ProfileView(),
      AddEventView.routeName:(context) => const AddEventView(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppText.appName,
      themeMode: .light,
      darkTheme: AppThem.darkThem,
      theme: AppThem.lightThem,
      routes: routesApp,
      initialRoute: MainAppView.routeName,
    );
  }
}
