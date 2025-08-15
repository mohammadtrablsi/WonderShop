import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/styles.dart';


class LoginTextField extends StatelessWidget {
  LoginTextField({
    super.key,
    required this.controller,
    // required this.label,
    this.vaildator,
    required this.obscureText,
    this.suffixIcon,
    this.suffixIconOnPressed,
    required this.outerText,
    this.haveSuffixIcon = false,
    required this.keyboardType,
  });
  final TextEditingController? controller;
  // final String label;
  final String? Function(String?)? vaildator;
  final bool obscureText;
  final IconData? suffixIcon;
  final void Function()? suffixIconOnPressed;
  final String outerText;
  bool haveSuffixIcon = false;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        text(outerText),
        TextSelectionTheme(
          data: TextSelectionThemeData(
            cursorColor: Styles.mainColor,
            selectionColor: Styles.mainColor.withOpacity(0.3),
            selectionHandleColor: Styles.mainColor,
          ),
          child: TextFormField(

            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText == null ? false : obscureText!,
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              errorMaxLines: 2,
              filled: true,
              fillColor: Styles.customLightGrey,
              // hintText: label,
              hintStyle: TextStyle(
                fontSize: 16.sp * 0.88,
                color: Color(0xFFa5a5a5),
              ),
              errorStyle: TextStyle(
                fontSize: 13.sp,
              ),
              suffixIcon: haveSuffixIcon
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: Styles.mainColor,
                      ),
                      onPressed: suffixIconOnPressed,
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Styles.mainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Styles.customLightGrey),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Styles.mainColor),
              ),
            ),
            validator: vaildator,
            cursorColor: Styles.mainColor,
          ),
        ),
      ],
    );
  }
}

Widget text(String text) {
  return Padding(
    padding: EdgeInsetsDirectional.only(bottom: 0.5.h), //add padding fm
    child: Row(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 2.w),
          child: Text(
            text,

            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
        )
      ],
    ),
  );
}
