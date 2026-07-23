import 'package:evently_app/feature/reset_pass/view/widgets/custom_form_build_reset_pass.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/app_padding.dart';
import '../../../core/utilities/app_text.dart';
import '../../../core/widgets/default_app_bar_app.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName = "/${AppText.routeForgetPassViewApp}";
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData themeColor = Theme.of(context);
    return Scaffold(
      appBar: defaultAppBarApp(
        context,
        themeColor: themeColor,
        title: AppText.forgetPass,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.p16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                  child: Image.asset(Assets.images.png.changePassImg.path,fit: .fitHeight,),
                ),
                const SizedBox(height: 32),
                CustomFormBuildResetPass(textTheme: textTheme)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
