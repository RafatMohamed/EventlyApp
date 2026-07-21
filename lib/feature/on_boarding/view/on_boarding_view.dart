import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/feature/on_boarding/view/widgets/on_boarding__view_body.dart';
import 'package:flutter/material.dart';
import '../../../core/utilities/app_padding.dart';
import '../../../core/widgets/app_bar_logo.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = "/${AppText.routeOnBoardingApp}";

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              AppBarLogo(),
              Expanded(child: OnBoardingBody()),
            ],
          ),
        ),
      ),
    );
  }
}
