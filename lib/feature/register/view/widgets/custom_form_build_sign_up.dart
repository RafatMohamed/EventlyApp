import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/service/AuthServicesFirebase/auth_services_firebase.dart';
import '../../../../core/service/Provider/auth_services.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../core/utilities/helper/custom_snack_bar_app.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/assets.dart';
import '../../../main_app_view/view/main_app_view.dart';

class CustomFormBuildSignUp extends StatefulWidget {
  const CustomFormBuildSignUp({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  State<CustomFormBuildSignUp> createState() => _CustomFormBuildSignUpState();
}

class _CustomFormBuildSignUpState extends State<CustomFormBuildSignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .end,
        children: [
          CustomTextFormField(
            hintText: AppText.enterYournName,
            isName: true,
            prefixIconPath: Assets.icons.user.path,
            keyboardType: .name,
            textInputAction: .next,
            controller: name,
            withValidator: true,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.enterYourEmail,
            isEmail: true,
            prefixIconPath: Assets.icons.sms.path,
            keyboardType: .emailAddress,
            textInputAction: .next,
            withValidator: true,
            controller: email,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.enterYourPass,
            isPassword: true,
            prefixIconPath: Assets.icons.lock.path,
            keyboardType: .visiblePassword,
            textInputAction: .next,
            isSecureValue: true,
            controller: pass,
            withValidator: true,
          ), const SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppText.confirmYourPass,
            isPassword: true,
            isSecureValue: true,
            prefixIconPath: Assets.icons.lock.path,
            keyboardType: .visiblePassword,
            textInputAction: .done,
            controller: confirmPass,
            withValidator: true,
          ),
          const SizedBox(height: 48),
          CustomButtonApp(onTap: register, text: AppText.signUp),
        ],
      ),
    );
  }

  void register() {
    if(formKey.currentState!.validate() && pass.text==confirmPass.text){
      AuthServicesFirebase.registerUser(name: name.text,email: email.text, pass: pass.text)
          .then((value) {
        if (!mounted) return;
        Provider.of<AuthServicesProvider>(context,listen: false).streamUser(value);
        Navigator.pushReplacementNamed(context, MainAppView.routeName);
        ShowMess.successMess(context: context, mess: "Register Success");
      })
          .catchError((error) {
        if (!mounted) return;
        if (error is FirebaseAuthException) {
          ShowMess.errorMess(context: context, mess: error.toString());
        }
        ShowMess.errorMess(context: context, mess: "Failed Register");
      });
    }
  }
}
