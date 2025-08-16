import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/loginRepo.dart';
import 'loginState.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepo repository;

  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> login(String phone, String password) async {
    emit(LoginLoading());
    Future.delayed(Duration(seconds: 2)).then((_)async{
      final success = await repository.login(phone, password);
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid credentials"));
      }
    });

  }
  Future<bool> checkIfLoggedIn() async {
    return await repository.isLoggedIn();
  }
}
