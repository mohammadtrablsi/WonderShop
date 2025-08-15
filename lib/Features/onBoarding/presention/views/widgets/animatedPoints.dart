import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'animatedOnePoint.dart';

class AnimatedPoints extends StatelessWidget {
  const AnimatedPoints({
    super.key,
    required this.indexPage,
    this.totalPages = 3,
  });

  final int indexPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: AnimatedOnePoint(
            dotIndex: index, // updated name from previous clean-up
            currentPage: indexPage,
          ),
        );
      }),
    );
  }
}
