import 'package:flutter/material.dart';

import '../../../../core/utilities/app_text.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';

class CustomFormBuildResetPass extends StatelessWidget {
  const CustomFormBuildResetPass({
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
            hintText: "${AppText.enterYourEmail} ${AppText.to} ${AppText.resetPass}",
            isEmail: true,
            prefixIconPath: Assets.icons.sms.path,
            keyboardType: .emailAddress,
            textInputAction: .next,
          ),
          const SizedBox(height: 32),
          CustomButtonApp(onTap: () {
            k
          }, text: AppText.resetPass),
        ],
      ),
    );
  }
}
