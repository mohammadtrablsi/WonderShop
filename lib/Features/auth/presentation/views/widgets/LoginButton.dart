import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/core/utils/styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, this.onPressed, required this.text, required this.isLoading});
  final void Function()? onPressed;
  final String text;
  final bool isLoading;
  static const borderRadiusOfButton=BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
    bottomLeft: Radius.circular(25),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null: onPressed,
      borderRadius: borderRadiusOfButton,
      child: Material(
        elevation: 1,
        shadowColor: Colors.black.withOpacity(1),
        borderRadius: borderRadiusOfButton,
        color: Colors
            .transparent,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.2.h),
          decoration: BoxDecoration(
            color: Styles.mainColor,
            borderRadius: borderRadiusOfButton
          ),
          child: isLoading
              ? Center(
                  child: SizedBox(
                    height: 2.7.h,
                    width: 2.7.h,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,fontSize:16.5.sp),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
