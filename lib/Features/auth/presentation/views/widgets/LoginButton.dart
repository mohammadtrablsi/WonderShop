import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/core/utils/styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, this.onPressed, required this.text, required this.isLoading});
  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : onPressed,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
      child: Material(
        elevation: 1, // Adjust elevation for shadow effect
        shadowColor: Colors.black.withOpacity(1), // Shadow color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        color: Colors
            .transparent, // Keep it transparent so Container color is visible
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.2.h),
          decoration: BoxDecoration(
            color: Styles.mainColor, //const Color(0xFFF77D8E)
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
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

                        // : Text(
                        //     text,
                        //     style: const TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w500),
                        //   ),
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

                        // : Icon(
                        //     Icons.arrow_right,
                        //     color: Colors.white,
                        //     size: 18.sp,
                        //   ),
                  ],
                ),
        ),
      ),
    );
  }
}
