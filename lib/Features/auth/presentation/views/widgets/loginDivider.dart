import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "or",
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.w500,
              fontSize: 17.sp,
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}