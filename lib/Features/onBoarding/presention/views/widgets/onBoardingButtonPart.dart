import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'buttonInOnBoarding.dart';

class OnBoardingButtonsPart extends StatelessWidget {
  const OnBoardingButtonsPart({
    super.key,
    required this.text,
    this.transport,
    this.goToRegister,
    this.skip,
    required this.index,
  });

  final String text;
  final VoidCallback? transport;
  final VoidCallback? goToRegister;
  final VoidCallback? skip;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: index == 2 ? _buildStartButton() : _buildNextSkipButtons(),
    );
  }

  Widget _buildStartButton() {
    return ButtonInOnBoarding(
      text: "ابدأ الان",
      onPressed: goToRegister,
      isChildText: true,
      paddingVertical: 4.w,
      paddingHorizontal: 0.w,
      widthOfButton: double.infinity,
      isButtonBig: true,
    );
  }

  Widget _buildNextSkipButtons() {
    return Row(
      children: [
        ButtonInOnBoarding(
          text: "تخطي",
          onPressed: skip,
          isChildText: true,
          paddingVertical: 4.w,
          paddingHorizontal: 11.w,
          isButtonBig: false,
        ),
        const Spacer(),
        ButtonInOnBoarding(
          text: "التالي",
          onPressed: transport,
          isChildText: false,
          paddingVertical: 3.3.w,
          paddingHorizontal: 9.w,
          icon: Icons.arrow_forward,
          isButtonBig: false,
        ),
      ],
    );
  }
}
