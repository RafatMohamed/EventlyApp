import 'dart:io';

import 'package:evently_app/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../feature/main_app_view/view/main_app_view.dart';
import '../service/AuthServicesFirebase/auth_services_firebase.dart';
import '../service/Provider/auth_services.dart';
import '../utilities/app_border_radius.dart';
import '../utilities/app_padding.dart';
import '../utilities/app_text.dart';
import '../utilities/helper/custom_snack_bar_app.dart';

class CustomButtonGoogle extends StatelessWidget {
  const CustomButtonGoogle({super.key,});
  @override
  Widget build(BuildContext context) {
    final ThemeData them = Theme.of(context);
    return Visibility(
      visible: Platform.isAndroid,
      child: GestureDetector(
        onTap: () async {
          AuthServicesFirebase.signInWithGoogle()
              .then((value) {
            if (!context.mounted) return;
            Provider.of<AuthServicesProvider>(context,listen: false).streamUser(value);
            Navigator.pushNamed(context, MainAppView.routeName);
            ShowMess.successMess(context: context, mess: "Login Success");
          })
              .catchError((error) {
            if (!context.mounted) return;
            if (error is FirebaseAuthException) {
              ShowMess.errorMess(context: context, mess: error.toString());
            }
            ShowMess.errorMess(context: context, mess: "Failed Login");
            ShowMess.errorMess(context: context, mess: "Failed Login");
          });
        },
        child: Container(
          alignment: .center,
          width: double.infinity,
          padding: const EdgeInsetsDirectional.all(AppPadding.p16),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(AppBorderRadius.r16),
            color: them.disabledColor,
            border: Border.all(color: them.unselectedWidgetColor),
          ),
          child: Row(
            spacing: 16,
            mainAxisAlignment: .center,
            children: [
              Image.asset(Assets.icons.googlePng.path,fit: .scaleDown,height: 24,),
              Text.rich(
                textAlign: .center,
                style: them.textTheme.labelMedium,
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text:  AppText.login),
                    const TextSpan(text: " "),
                    TextSpan(text: AppText.withGoogle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
