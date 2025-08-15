import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/Splash/presentation/manger/splashCubit.dart';
import 'package:wonder_shop/Features/Splash/presentation/views/widgets/splashViewBody.dart';
import 'package:flutter/material.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return SplashCubit(
          );
        },
        child: SplashViewBody(),
      ),
    );
  }
}
