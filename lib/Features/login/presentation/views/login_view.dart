import 'package:wonder_shop/Features/login/presentation/views/widgets/loginBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../data/repos/login_repo_impl.dart';
import '../../domain/use_cases/make_login_use_case.dart';
import '../manger/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) {
            return LoginCubit(
              MakeLoginBooksUseCase(
                getIt.get<LoginRepoImpl>(),
              ),
            );
          },
          child: LoginBody(),
        ),
      ),
    );
  }}