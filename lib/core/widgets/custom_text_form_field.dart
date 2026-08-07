import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.visibility,
    this.onChanged,
    this.withValidator = false,
    this.isEmail = false,
    this.isName = false,
    this.suffixIconPath,
    this.prefixIconPath,
    this.maxLines = 1,
  });
  final bool isEmail, isName, isPassword;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function()? visibility;
  final Function(dynamic value)? onChanged;
  final bool? withValidator;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final int maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isSecureValue = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeColor = Theme.of(context);
    return TextFormField(
      obscureText: isSecureValue,
      controller: widget.controller,
      cursorColor: themeColor.primaryColor,
      cursorHeight: 25,
      maxLines: widget.maxLines,
      validator: (value) {
        if (widget.withValidator!) {
          if (value == null || value.isEmpty) {
            return "${widget.hintText} is Required";
          } else if (widget.isPassword == true) {
            if (value.length < 8) {
              return "Password must be at least 8 characters";
            }
          } else if (widget.isEmail == true) {
            if (!value.contains("@") ||
                !value.contains(".") ||
                !(RegExp(r'[a-zA-Z0-9@._-]')).hasMatch(value)) {
              return "Email is not valid";
            }
          }
        }
        return null;
      },
      onSaved: (newValue) {
        widget.controller?.text = newValue!;
      },
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: themeColor.primaryColor,
        fontSize: 20,
        fontWeight: .w600,
        fontStyle: .normal,
      ),
      textInputAction: widget.textInputAction,
      canRequestFocus: true,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
      },
      onTapUpOutside: (event) =>        FocusManager.instance.primaryFocus?.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword == true
            ? GestureDetector(
                onTap: (){
                  isSecureValue = !isSecureValue;
                  setState(() {});
                },
                child: isSecureValue
                    ? const Icon(CupertinoIcons.eye)
                    : const Icon(CupertinoIcons.eye_slash),
              )
            : widget.suffixIconPath != null
            ? SvgPicture.asset(
                widget.suffixIconPath!,
                height: 24,
                width: 24,
                fit: .scaleDown,
              )
            : null,
        prefixIcon: widget.prefixIconPath != null
            ? SvgPicture.asset(
                widget.prefixIconPath!,
                height: 24,
                width: 24,
                fit: .scaleDown,
              )
            : null,
      ),
    );
  }
}
