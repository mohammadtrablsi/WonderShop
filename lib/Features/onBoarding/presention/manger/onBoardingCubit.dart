import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../auth/presentation/views/loginView.dart';
import '../../../auth/presentation/views/widgets/loginDialog.dart';
import 'onBoardingState.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial(0));

  void changePage(int index) {
    emit(OnBoardingPageChanged(index));
  }

  void nextPage() {
    if (state.index < 2) {
      emit(OnBoardingPageChanged(state.index + 1));
    }
  }

  void skipToLastPage() {
    emit(OnBoardingPageChanged(2));
  }
  navigateToLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
          () {
        AuthDialog(
          context,
          LoginView(
          ),
          80.h,
          onValue: (_) {},
        );
      },
    );
  }
}
