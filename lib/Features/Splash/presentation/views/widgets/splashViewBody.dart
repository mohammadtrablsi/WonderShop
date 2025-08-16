// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import '../../../../../core/utils/app_router.dart';
// import '../../../../../core/utils/assets.dart';
// import '../../../../../core/utils/styles.dart';
//
//
// class SplashViewbody extends StatefulWidget {
//   const SplashViewbody({super.key});
//
//   @override
//   State<SplashViewbody> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashViewbody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animcontroller;
//   late Animation<double> animation;
//
//   @override
//   void initState() {
//     super.initState();
//     animcontroller = AnimationController(
//         duration: const Duration(seconds: 200), vsync: this);
//     animation = Tween<double>(begin: 1, end: 1000).animate(animcontroller)
//       ..addListener(() {
//         setState(() {});
//       });
//     wait();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: Stack(
//         children: [
//           SpinKitRing(
//             color: Styles.mainColor,
//             size: 108.0,
//             lineWidth: 4,
//           ),
//           Transform.scale(
//             scale: animation.value,
//             child: Center(
//               child: Container(
//                 width: 90,
//                 height: 90,
//                 decoration: BoxDecoration(
//                   color: Styles.mainColor,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//             ),
//           ),
//           Hero(
//             tag: "logo",
//             child: Center(
//               child: Image.asset(
//                 AssetsData.logo,
//                 height: 75,
//                 width: 75,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     animcontroller.dispose();
//     super.dispose();
//   }
//
//   void wait() async {
//     await Future.delayed(const Duration(seconds: 3));
//     animcontroller.forward();
//     await Future.delayed(const Duration(seconds: 2)).then((_) async {
//         AppRouter.router.go(AppRouter.kBookDetailsView);
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/splashCubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 200), // slow & smooth
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 1000).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Start splash logic
    context.read<SplashCubit>().startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashAnimating) {
          _controller.forward();
        } else if (state is SplashNavigate) {
          AppRouter.router.go(AppRouter.kOnBoardingView);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SpinKitRing(
              color: Styles.mainColor,
              size: 120.0,
              lineWidth: 4,
            ),
            Transform.scale(
              scale: _animation.value,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Styles.mainColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Hero(
              tag: "logo",
              child: Image.asset(
                AssetsData.logo,
                height: 145,
                width: 145,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
