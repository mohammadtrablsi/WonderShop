import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'loginTextButton.dart';


class LoginForgetPasswordButtonPart extends StatelessWidget {
  const LoginForgetPasswordButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 2.w,
        ),
        LoginTextButton(
            text: "forget your password?",
            onTap: () async {
            },
            fontSize: 14.2.sp),
      ],
    );
  }
}
