import 'dart:math';

import 'package:evently_app/core/service/AuthServicesFirebase/auth_services_firebase.dart';
import 'package:evently_app/core/service/Provider/auth_services.dart';
import 'package:evently_app/core/utilities/helper/custom_snack_bar_app.dart';
import 'package:evently_app/feature/main_app_view/view/main_app_view.dart';
import 'package:evently_app/feature/reset_pass/view/reset_pass_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilities/app_text.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';

class CustomFormBuildLogin extends StatefulWidget {
  const CustomFormBuildLogin({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  State<CustomFormBuildLogin> createState() => _CustomFormBuildLoginState();
}

class _CustomFormBuildLoginState extends State<CustomFormBuildLogin> {
  final TextEditingController email = TextEditingController();

  final TextEditingController pass = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .end,
        children: [
          CustomTextFormField(
            hintText: AppText.enterYourEmail,
            isEmail: true,
            prefixIconPath: Assets.icons.sms.path,
            keyboardType: .emailAddress,
            textInputAction: .next,
            controller: email,
            withValidator: true,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.enterYourPass,
            isPassword: true,
            isSecureValue: true,
            prefixIconPath: Assets.icons.lock.path,
            keyboardType: .visiblePassword,
            textInputAction: .done,
            withValidator: true,
            controller: pass,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ResetPasswordView.routeName);
            },
            child: Text.rich(
              textAlign: .end,
              style: widget.textTheme.labelSmall,
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: AppText.forgetPass),
                  const TextSpan(text: "?"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 48),
          CustomButtonApp(onTap: login, text: AppText.login),
        ],
      ),
    );
  }

  void login() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      AuthServicesFirebase.LoginUser(email: email.text, pass: pass.text)
          .then((value) {
        Provider.of<AuthServicesProvider>(context,listen: false).streamUser(value);
        Navigator.pushReplacementNamed(context, MainAppView.routeName);
        ShowMess.successMess(context: context, mess: "Login Success");
      })
          .catchError((error) {
        if (error is FirebaseAuthException) {
          ShowMess.errorMess(context: context, mess: error.toString());
        }
        ShowMess.errorMess(context: context, mess: "Failed Login");
        ShowMess.errorMess(context: context, mess: "Failed Login");
      });
    }
  }
}
