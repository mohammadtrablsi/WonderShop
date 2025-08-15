abstract class OnBoardingState {
  final int index;
  const OnBoardingState(this.index);
}

class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial(int index) : super(index);
}

class OnBoardingPageChanged extends OnBoardingState {
  const OnBoardingPageChanged(int index) : super(index);
}
