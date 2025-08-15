import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splashState.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> startSplash() async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashAnimating());
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashNavigate());
  }
}
