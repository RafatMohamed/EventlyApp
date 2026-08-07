import 'package:evently_app/feature/login/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/service/AuthServicesFirebase/auth_services_firebase.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../core/utilities/helper/custom_snack_bar_app.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';

class CustomFormBuildResetPass extends StatefulWidget {
  const CustomFormBuildResetPass({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  State<CustomFormBuildResetPass> createState() =>
      _CustomFormBuildResetPassState();
}

class _CustomFormBuildResetPassState extends State<CustomFormBuildResetPass> {
  final TextEditingController email = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .end,
        children: [
          CustomTextFormField(
            hintText:
                "${AppText.enterYourEmail} ${AppText.to} ${AppText.resetPass}",
            isEmail: true,
            prefixIconPath: Assets.icons.sms.path,
            keyboardType: .emailAddress,
            textInputAction: .done,
            withValidator: true,
            controller: email,
          ),
          const SizedBox(height: 32),
          IgnorePointer(
            ignoring: isLoading,
            child: CustomButtonApp(
              onTap: resetPassword,
              text: AppText.resetPass,
            ),
          ),
        ],
      ),
    );
  }

  void resetPassword() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      await AuthServicesFirebase.resetPassword(email: email.text).then((value) {
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          ShowMess.successMess(
            context: context,
            mess: "Check your Email to Reset password",
            secDuration: 2,
          );
        })
        .catchError((error) {
          setState(() {
            isLoading = false;
          });

          if (!mounted) return;

          if (error is FirebaseAuthException) {
            ShowMess.errorMess(
              context: context,
              mess: error.message.toString(),
            );
          } else {
            ShowMess.errorMess(context: context, mess: error.toString(), secDuration: 3,);
          }
        });
    }
  }
}
