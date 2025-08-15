import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_shop/Features/auth/data/repos/loginRepoImpl.dart';
import 'package:wonder_shop/Features/auth/presentation/views/widgets/loginViewBody.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../manger/login_cubit/PasswordVisibilityCubit.dart';
import '../manger/login_cubit/loginCubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(
        create: (BuildContext context) {
      return LoginCubit(
        getIt.get<LoginRepositoryImpl>(),
      );
    },
    ),BlocProvider(
      create: (BuildContext context) {
        return PasswordVisibilityCubit(
        );
      },
    ),], child: const LoginViewBody(),);
  }
}
