// import 'package:ehsan/Features/grades/domain/entites/categoriesEntity.dart';
// import 'package:ehsan/Features/grades/presention/views/widgets/marksItem.dart';
// import 'package:ehsan/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';
//
// class ShimmerMarksPart extends StatelessWidget {
//   const ShimmerMarksPart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         // height: 41.56.h,
//         child: ListView.builder(
//       padding: EdgeInsetsDirectional.only(bottom: 1.h),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 1.h,
//             ),
//             Shimmer.fromColors(
//                 baseColor: Colors.grey[200]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: Container(
//                   width: double.infinity,
//                   height: 8.h,
//                   color: Colors.grey,
//                 )),
//           ],
//         );
//       },
//     ));
//   }
//
//   Widget _textFormarks(int index) {
//     return Text(
//       index == 0
//           ? "exam"
//           : index == 1
//               ? "oral"
//               : "test",
//       style: TextStyle(
//           fontSize: 10.sp, fontWeight: FontWeight.w600, color: kPrimaryColor),
//     );
//   }
// }
