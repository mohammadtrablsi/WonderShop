import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/onBoarding/presention/views/widgets/onBoardingBody.dart';
import 'package:flutter/material.dart';

import '../manger/onBoardingCubit.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key, this.isNavigateHereAfterLogout=false});
  final bool isNavigateHereAfterLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocProvider(
        create: (BuildContext context) {
          return OnBoardingCubit(
          );
        },
        child: OnBoardingBody(isNavigateHereAfterLogout:isNavigateHereAfterLogout),
      ),
    );
}
}