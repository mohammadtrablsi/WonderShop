import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginSubTitle extends StatelessWidget {
  const LoginSubTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
