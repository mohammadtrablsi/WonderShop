import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/categories/presention/views/categoriesView.dart';

import 'drawerView.dart';

class DrawerStackView extends StatefulWidget {
  @override
  _DrawerStackState createState() => _DrawerStackState();
}
class _DrawerStackState extends State<DrawerStackView> with SingleTickerProviderStateMixin {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Smooth duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    setState(() {
      if (isDrawerOpen) {
        _controller.reverse(); // Reverse animation
        isDrawerOpen = false;
      } else {
        _controller.forward(); // Forward animation
        isDrawerOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerView(),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double translationX = lerpDouble(0, ( -42.w ), _animation.value)!;
            double translationY = lerpDouble(0, ( 16.w ), _animation.value)!;
            double scale = lerpDouble(1.0, 0.85, _animation.value)!;

            // Rotation degree value (smooth rotation from 0 to desired angle)
            double rotationDeg = lerpDouble(0, ( -15 ), _animation.value)!;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..translate(translationX, translationY)
                ..scale(scale)
                ..rotateZ(rotationDeg * pi / 180), // Apply the rotation in radians
              child: ClipRRect(
                borderRadius: _animation.value == 0
                    ? BorderRadius.zero
                    : BorderRadius.circular(40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: _animation.value == 0
                        ? BorderRadius.zero
                        : BorderRadius.circular(40),
                  ),
                  child: CategoriesView(isDrawerOpen:isDrawerOpen ,onPressed: ()=>toggleDrawer(),),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
