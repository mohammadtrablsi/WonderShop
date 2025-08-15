import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginWithOthersOptionImage extends StatelessWidget {
  const LoginWithOthersOptionImage({super.key, required this.width, required this.height, required this.image});
  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.sp),
          image: DecorationImage(
            image: AssetImage(image),
          )),
    );
  }
}
