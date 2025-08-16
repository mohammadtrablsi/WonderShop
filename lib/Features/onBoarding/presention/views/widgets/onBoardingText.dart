import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textAlign: TextAlign.center,
          textStyle: Styles.textStyle18Grey,
        ),
      ],
    );
  }
}
