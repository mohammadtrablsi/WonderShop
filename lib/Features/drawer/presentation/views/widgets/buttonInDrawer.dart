import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/core/utils/styles.dart';

class ButtonInDrawer extends StatelessWidget {
  const ButtonInDrawer(
      {super.key,
        required this.index,
        required this.currentIndex,
        required this.onTap,
        required this.taps});
  final int index;
  final int currentIndex;
  final void Function() onTap;
  final List<Map> taps;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 2.w),
          width: currentIndex == index ? 100.w : 0.w,
          height: 8.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.sp)),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white, width: 0.01.h),
                  bottom: BorderSide(color: Colors.white, width: 0.01.h),
                )),
            child: Row(
              children: [
                SizedBox(width: 5.w),
                Icon(
                  taps[index]['icon'],
                  color: currentIndex == index
                      ? Styles.mainColor
                      : taps[index]['color'],
                  size: 20.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  taps[index]['text'],
                  style: TextStyle(
                      fontSize: 16.sp * 0.95,
                      color: currentIndex == index
                          ? Styles.mainColor
                          : taps[index]['color']),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
