import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/styles.dart';

class ButtonInOnBoarding extends StatelessWidget {
  const ButtonInOnBoarding({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isChildText,
    required this.isButtonBig,
    required this.paddingVertical,
    required this.paddingHorizontal,
    this.widthOfButton,
    this.icon,
  });

  final VoidCallback? onPressed;
  final bool isChildText;
  final bool isButtonBig;
  final String text;
  final double paddingVertical;
  final double paddingHorizontal;
  final double? widthOfButton;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Widget childContent;

    if (isChildText) {
      childContent = isButtonBig
          ? SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle16White,
          ),
        ),
      )
          : Text(
        text,
        style: Styles.textStyle16White,
      );
    } else {
      childContent = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Styles.textStyle16White,
          ),
          if (icon != null) ...[
            SizedBox(width: 1.w),
            Icon(icon, color: Styles.customWhite),
          ],
        ],
      );
    }

    return SizedBox(
      width: widthOfButton,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Styles.mainColor,
          padding: EdgeInsets.symmetric(
              vertical: paddingVertical, horizontal: paddingHorizontal),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5.0,
        ),
        child: childContent,
      ),
    );
  }
}
