import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/utils/appRouter.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/splashCubit.dart';


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
      duration: const Duration(seconds: 200),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 1000).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

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
