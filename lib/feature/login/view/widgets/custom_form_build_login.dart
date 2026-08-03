import 'package:evently_app/feature/reset_pass/view/reset_pass_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/app_text.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';

class CustomFormBuildLogin extends StatelessWidget {
  const CustomFormBuildLogin({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: .end,
        children: [
          CustomTextFormField(
            hintText: AppText.enterYourEmail,
            isEmail: true,
            prefixIconPath: Assets.icons.sms.path,
            keyboardType: .emailAddress,
            textInputAction: .next,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.enterYourPass,
            isPassword: true,
            isSecureValue: true,
            prefixIconPath: Assets.icons.lock.path,
            keyboardType: .visiblePassword,
            textInputAction: .done,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ResetPasswordView.routeName);
            },
            child: Text.rich(
              textAlign: .end,
              style: textTheme.labelSmall,
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: AppText.forgetPass),
                  const TextSpan(text: "?"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 48),
          CustomButtonApp(onTap: () {}, text: AppText.login),
        ],
      ),
    );
  }
}
