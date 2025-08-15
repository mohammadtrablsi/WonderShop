import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/auth/presentation/views/widgets/authprompt.dart';
class LoginGoToRegisterButtonPart extends StatelessWidget {
  const LoginGoToRegisterButtonPart({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 3.w),
        Authprompt(
          textForTextButton: 'sign up',
          text: "don't have an account?",
          onTap: () async {
          },
        ),
      ],
    );
  }
}
