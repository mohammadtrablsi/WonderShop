import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/auth/presentation/views/loginView.dart';
import 'package:wonder_shop/Features/onBoarding/presention/views/widgets/pageInOnBoarding.dart';

import '../../../../auth/presentation/views/widgets/loginDialog.dart';
import '../../../data/onBoardingData.dart';
import '../../manger/onBoardingCubit.dart';
import '../../manger/onBoardingState.dart';
import 'animatedPoints.dart';
import 'onBoardingButtonPart.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key,this.isNavigateHereAfterLogout=false});
  final bool isNavigateHereAfterLogout;
  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.isNavigateHereAfterLogout) {
      final cubit = context.read<OnBoardingCubit>();
      navigateToLogin(context);
      cubit.changePage(2);
    }
  }


  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = context.read<OnBoardingCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          _pageController.animateToPage(
            state.index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    context.read<OnBoardingCubit>().changePage(value);
                  },
                  itemCount: onBoardingPages.length,
                  itemBuilder: (context, index) {
                    final page = onBoardingPages[index];
                    return PageInOnBoarding(
                      image: page['image'],
                      text: page['text'],
                      heightOfImage: page['heightOfImage'],
                    );
                  },
                ),
              ),
              SizedBox(height: 2.h),
              AnimatedPoints(indexPage: state.index),
              SizedBox(height: 7.h),
              OnBoardingButtonsPart(
                text: 'استمر',
                transport: () async {
                  if (state.index == 2) {
                    navigateToLogin(context);
                  } else {
                    context.read<OnBoardingCubit>().nextPage();
                  }
                },
                index: state.index,
                goToRegister: () {
                  navigateToLogin(context);
                },
                skip: () {
                  navigateToLogin(context);
                },
              ),
              SizedBox(height: 5.h),
            ],
          );
        },
      ),
    );
  }
  navigateToLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () {
        AuthDialog(
          context,
          LoginView(
          ),
          onValue: (_) {},
        );
      },
    );
  }
}
