import 'package:bloc/bloc.dart';
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
}
