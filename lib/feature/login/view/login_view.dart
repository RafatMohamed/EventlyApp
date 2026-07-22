import 'package:evently_app/core/utilities/app_text_styles.dart';
import 'package:evently_app/core/widgets/app_bar_logo.dart';
import 'package:evently_app/core/widgets/custom_button_app.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/feature/login/view/widgets/custom_form_build_login.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../core/utilities/app_padding.dart';
import '../../../core/utilities/app_text.dart';
import '../../../core/widgets/custom_button_google.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "/${AppText.routeLoginViewApp}";
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color themeColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.p16),
            child: Column(
              children: [
                Align(alignment: .center, child: AppBarLogo()),
                SizedBox(height: 48),
                Align(
                  alignment: .centerStart,
                  child: Text(
                    AppText.titleLoginAcc,
                    style: textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 24),
                CustomFormBuildLogin(textTheme: textTheme),
                SizedBox(height: 48),
                Text.rich(
                  textAlign: .center,
                  style: textTheme.titleSmall,
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: AppText.dontHaveAcc),
                      TextSpan(text: " ? "),
                      TextSpan(
                        text: AppText.signUp,
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: AppPadding.p32,
                  ),
                  child: Text(
                    AppText.or,
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: .w500,
                      color: themeColor,
                    ),
                  ),
                ),
                CustomButtonGoogle(onTap: () {}, text: AppText.login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

