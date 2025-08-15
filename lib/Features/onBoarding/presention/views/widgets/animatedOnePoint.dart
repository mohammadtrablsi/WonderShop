import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/core/utils/styles.dart';

class AnimatedOnePoint extends StatelessWidget {
  const AnimatedOnePoint({
    super.key,
    required this.dotIndex,
    required this.currentPage,
  });

  final int dotIndex;
  final int currentPage;

  static const double _borderRadius = 360;
  static const Duration _animationDuration = Duration(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentPage == dotIndex;

    return AnimatedContainer(
      duration: _animationDuration,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      height: isActive ? 0.5.h : 1.h,
      width: isActive ? 8.w : 2.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: isActive
            ? Styles.mainColor
            : Styles.mainColor.withOpacity(0.5),
      ),
    );
  }
}
