import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'onBoardingImage.dart';
import 'onBoardingText.dart';

class PageInOnBoarding extends StatelessWidget {
  const PageInOnBoarding({
    super.key,
    required this.image,
    required this.text,
    required this.heightOfImage,
  });

  final String image;
  final String text;
  final num heightOfImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),
          OnBoardingImage(image: image, height: heightOfImage),
          SizedBox(height: 10.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 3.w),
            child: OnBoardingText(text: text),
          ),
        ],
      ),
    );
  }
}
