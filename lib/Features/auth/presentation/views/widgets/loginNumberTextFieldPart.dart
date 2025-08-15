import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/validatore.dart';
import 'loginTextField.dart';

class LoginNumberTextFieldPart extends StatelessWidget {
  const LoginNumberTextFieldPart({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      keyboardType: TextInputType.number,
      outerText: "phone",
      controller: controller,
      obscureText: false,
      vaildator: (val) {
       return vaildator(val!, 10, 10, "phone");
      },
    );
  }
}
