import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'loginTextButton.dart';

class Authprompt extends StatelessWidget {
  const Authprompt(
      {super.key,
      required this.textForTextButton,
      required this.text,
      this.onTap});
  final String textForTextButton;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 15.sp),
        ),
        SizedBox(
          width: 1.w,
        ),
        LoginTextButton(text: textForTextButton, onTap: onTap, fontSize: 14.sp),
      ],
    );
  }
}
