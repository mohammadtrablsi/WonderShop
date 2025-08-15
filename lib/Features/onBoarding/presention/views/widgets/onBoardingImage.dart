import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    super.key,
    required this.image,
    required this.height,
  });

  final num height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
