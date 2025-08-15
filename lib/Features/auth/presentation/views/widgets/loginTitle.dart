import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25.sp,
        // fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
