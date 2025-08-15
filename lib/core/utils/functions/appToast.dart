import 'package:flutter/material.dart';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/core/utils/styles.dart';

ToastFuture appToast(BuildContext context, String text) {
  return showToast(text,
      textStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
      context: context,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 2),
      duration: const Duration(seconds: 5), //4
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: Styles.mainColor,
      borderRadius: BorderRadius.circular(15.sp));
}
