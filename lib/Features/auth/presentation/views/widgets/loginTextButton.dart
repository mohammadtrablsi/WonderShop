import 'package:flutter/material.dart';
import 'package:wonder_shop/core/utils/styles.dart';


class LoginTextButton extends StatelessWidget {
  const LoginTextButton({super.key, required this.text, this.onTap, required this.fontSize});
  final String text;
  final void Function()? onTap;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Styles.mainColor,
          decoration: TextDecoration.underline,
          decorationColor: Styles.mainColor,
        ),
      ),
    );
  }
}
