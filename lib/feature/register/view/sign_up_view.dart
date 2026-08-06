import 'dart:io';

import 'package:evently_app/core/models/auth_model.dart';
import 'package:evently_app/core/service/AuthServicesFirebase/auth_services_firebase.dart';
import 'package:evently_app/core/service/Provider/auth_services.dart';
import 'package:evently_app/core/widgets/app_bar_logo.dart';
import 'package:evently_app/feature/login/view/login_view.dart';
import 'package:evently_app/feature/register/view/widgets/custom_form_build_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utilities/app_padding.dart';
import '../../../core/utilities/app_text.dart';
import '../../../core/widgets/custom_button_google.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = "/${AppText.routeRegisterViewApp}";
  const SignUpView({super.key});

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
                const Align(alignment: .center, child: AppBarLogo()),
                const SizedBox(height: 48),
                Align(
                  alignment: .centerStart,
                  child: Text(
                    AppText.titleRegisterAcc,
                    style: textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 24),
                CustomFormBuildSignUp(textTheme: textTheme),
                const SizedBox(height: 48),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                  child: Text.rich(
                    textAlign: .center,
                    style: textTheme.titleSmall,
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: AppText.haveAcc),
                        const TextSpan(text: " ? "),
                        TextSpan(
                          text: AppText.login,
                          style: textTheme.labelSmall,
                        ),
                      ],
                    ),
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
               const CustomButtonGoogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
