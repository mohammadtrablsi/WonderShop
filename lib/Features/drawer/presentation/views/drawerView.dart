import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/drawer/presentation/views/widgets/buttonInDrawer.dart';
import 'package:wonder_shop/Features/drawer/presentation/views/widgets/rowInDrawer.dart';
import 'package:wonder_shop/core/utils/appRouter.dart';
import 'package:wonder_shop/core/utils/functions/appAlert.dart';
import 'package:wonder_shop/core/utils/styles.dart';

import '../../../../core/utils/assets.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  int currentIndex=100;
  List<Map> taps = [
    {
      'text': "Contact Us",
      'icon': Icons.phone,
      'color': Colors.white,
      'route': null
    },
    {
      'text': "Privacy Policy",
      'icon': Icons.privacy_tip,
      'color': Colors.white,
      'route': null
    },
    {
      'text': "Terms Of Service",
      'icon': Icons.description,
      'color': Colors.white,
      'route': null
    },
    {
      'text': "Languages",
      'icon': Icons.translate,
      'color': Colors.white,
      'route': null
    },
    {
      'text': "Invite Friends",
      'icon': Icons.group_add,
      'color': Colors.white,
      'route': null
    },
    {
      'text': "Logout",
      'icon': Icons.logout,
      'color': Colors.white,
      'route': null
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 100.w,
          height: double.infinity,
          color: Styles.mainColor,
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: 11.h),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 2.5.w),
                child: GestureDetector(
                  onTap: () {
                  },
                  child: RowInDrawer(
                    name:'Mohammad Trablsi',
                    image: AssetsData.personImage,
                  ),
                ),
              ),
              SizedBox(
                height: 4.5.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: Text(
                  "",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp * 0.9),
                ),
              ),
              SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: taps.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ButtonInDrawer(
                    index: index,
                    currentIndex: currentIndex,
                    taps: taps,
                    onTap: () {
                      setState(() {
                        currentIndex=index;
                      });
                      if(index==5){
                        appAlert(context, 'Are you sure you want to logout?', (){
                          context.go(AppRouter.kOnBoardingView, extra: true);
                        });
                      }
                    },
                  );
                },
              ),
            ),
            ]),
          ),
        ),
      ),
    );
  }
}
