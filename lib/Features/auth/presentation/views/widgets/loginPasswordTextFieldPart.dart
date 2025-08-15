import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/validatore.dart';
import 'loginTextField.dart';

class LoginPasswordTextFieldPart extends StatelessWidget {
  const LoginPasswordTextFieldPart({super.key, this.revPassword, required this.isPassword, required this.controller});
  final void Function()? revPassword;
  final bool isPassword;
  final TextEditingController controller;
  

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      controller: controller,
      vaildator: (val) {
        return vaildator(val!, 0, 100, "password");
      },
      haveSuffixIcon: true,
      keyboardType: TextInputType.text,
      obscureText: isPassword,
      suffixIcon:
      isPassword ? Icons.visibility : Icons.visibility_off,
      suffixIconOnPressed:revPassword,
      outerText: "password",
    );
  }
}