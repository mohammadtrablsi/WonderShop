import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets.dart';
import 'loginWithOthersOptionImage.dart';

class LoginWithOthersOptionPart extends StatelessWidget {
  const LoginWithOthersOptionPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            'sign in by Gmail',
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        LoginWithOthersOptionImage(
          width: 8.w,
          height: 2.25.h,
          image: AssetsData.emailImage,
        ),
      ],
    );
  }
}
