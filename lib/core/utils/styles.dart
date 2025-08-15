import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/constants.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {
  static Color mainColor = const Color(0xFFc7164f);
  static Color customWhite =  Colors.white;
  static Color customGrey =  Colors.grey;
  static Color customLightGrey =  const Color(0xFFf4f4f4);


  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle16White = TextStyle(fontSize: 16.sp, color: Colors.white);
  static TextStyle textStyle19Grey =  TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      height: 1.8,
    );

    static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

const TextStyle textStyle = TextStyle();
