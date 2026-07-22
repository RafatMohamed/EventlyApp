import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.visibility,
    this.onChanged,
    this.isSecureValue = false,
    this.onTapShowPassword,
    this.withValidator = false,
    this.isEmail = false,
    this.isName = false,
    this.suffixIconPath,
    this.prefixIconPath
  });
  final bool? isEmail, isName,isPassword;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function()? visibility;
  final Function(dynamic value)? onChanged;
  final bool? isSecureValue;
  final Function()? onTapShowPassword;
  final bool? withValidator;
  final String? suffixIconPath;
  final String? prefixIconPath;

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Theme.of(context).primaryColor;
    return TextFormField(
      obscureText:isSecureValue!,
      controller: controller,
      cursorColor: themeColor,
      cursorHeight: 25,
      validator: (value) {
        if (withValidator!) {
          if (value == null || value.isEmpty) {
            return "$hintText is Required";
          }
          else if (isPassword == true) {
            if (value.length < 8) {
              return "Password must be at least 8 characters";
            }
          }
          else if (isEmail == true) {
            if (!value.contains("@")||!value.contains(".")||!(RegExp(r'[a-zA-Z0-9@._-]')).hasMatch(value)) {
              return "Email is not valid";
            }
          }
        }
        return null;
      },
      onSaved: (newValue) {
        controller?.text = newValue!;
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon:  isPassword == true
            ? GestureDetector(
          onTap: onTapShowPassword,
          child: isSecureValue!
              ? const Icon(CupertinoIcons.eye)
              : const Icon(CupertinoIcons.eye_slash),
        )
            : suffixIconPath !=null ? SvgPicture.asset(suffixIconPath!,height: 24,width: 24,fit: .scaleDown,):null,
        prefixIcon: prefixIconPath !=null ? SvgPicture.asset(prefixIconPath!,height: 24,width: 24,fit: .scaleDown,):null,
      ),
    );
  }
}
