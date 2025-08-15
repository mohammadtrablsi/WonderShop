import 'package:bloc/bloc.dart';
import 'package:wonder_shop/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:wonder_shop/Features/login/domain/use_cases/make_login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/login_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.makeLoginBooksUseCase) : super(LoginInitial());

  final MakeLoginBooksUseCase makeLoginBooksUseCase;

  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  Future<void> makeLogin(Map<String, String> map) async {
    emit(LoginLoading());
    var result = await makeLoginBooksUseCase.call(map);
    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (data) {
      emit(LoginSuccess(data));
    });
  }
  void submit() {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text;
      String password = passwordController.text;

      makeLogin({'username':usernameController.text,'password':password});
    }
  }
}
