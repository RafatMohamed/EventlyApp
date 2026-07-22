import 'package:flutter/material.dart';

import '../../../../core/utilities/app_text.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';

class CustomFormBuildSignUp extends StatelessWidget {
  const CustomFormBuildSignUp({
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
            hintText: AppText.enterYournName,
            isName: true,
            prefixIconPath: Assets.icons.user.path,
            keyboardType: .name,
            textInputAction: .next,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.enterYourEmail,
            isEmail: true,
            prefixIconPath: Assets.icons.sms.path,
            keyboardType: .emailAddress,
            textInputAction: .next,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.enterYourPass,
            isPassword: true,
            prefixIconPath: Assets.icons.lock.path,
            keyboardType: .visiblePassword,
            textInputAction: .next,
            isSecureValue: true,
          ), SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.confirmYourPass,
            isPassword: true,
            isSecureValue: true,
            prefixIconPath: Assets.icons.lock.path,
            keyboardType: .visiblePassword,
            textInputAction: .done,
          ),
          SizedBox(height: 48),
          CustomButtonApp(onTap: () {}, text: AppText.signUp),
        ],
      ),
    );
  }
}
