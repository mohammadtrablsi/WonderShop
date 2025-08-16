import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RowInDrawer extends StatelessWidget {
  const RowInDrawer(
      {super.key,
        required this.name,
        required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6.w,
          backgroundImage:AssetImage(image),
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 40.w),
            child: Text(
              name??'',
              style: TextStyle(fontSize: 18.sp * 0.9, color: Colors.white),
            )),
        SizedBox(
          width: 1.w,
        ),
        Icon(Icons.edit,color: Colors.white,size: 19.sp,),
        const Spacer(),
      ],
    );
  }
}
