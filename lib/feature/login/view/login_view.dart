import 'package:evently_app/core/widgets/app_bar_logo.dart';
import 'package:evently_app/feature/login/view/widgets/custom_form_build_login.dart';
import 'package:evently_app/feature/register/view/sign_up_view.dart';
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
                const Align(alignment: .center, child: AppBarLogo()),
                const SizedBox(height: 48),
                Align(
                  alignment: .centerStart,
                  child: Text(
                    AppText.titleLoginAcc,
                    style: textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 24),
                CustomFormBuildLogin(textTheme: textTheme),
                const SizedBox(height: 48),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, SignUpView.routeName);
                  },
                  child: Text.rich(
                    textAlign: .center,
                    style: textTheme.titleSmall,
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: AppText.dontHaveAcc),
                        const TextSpan(text: " ? "),
                        TextSpan(
                          text: AppText.signUp,
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
                CustomButtonGoogle(onTap: () {}, text: AppText.login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

