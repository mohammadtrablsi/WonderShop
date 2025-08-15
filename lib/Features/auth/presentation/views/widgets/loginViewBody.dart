import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/Features/auth/presentation/views/widgets/loginNumberTextFieldPart.dart';
import 'package:wonder_shop/core/utils/functions/appToast.dart';

import '../../../../../core/utils/assets.dart';
import '../../manger/login_cubit/PasswordVisibilityCubit.dart';
import '../../manger/login_cubit/loginCubit.dart';
import '../../manger/login_cubit/loginState.dart';
import 'LoginButton.dart';
import 'loginDivider.dart';
import 'loginSubTitle.dart';
import 'loginTitle.dart';
import 'loginWithOthersOptionPart.dart';
import 'loginForgetPasswordButtonPart.dart';
import 'loginGoToRegisterButtonPart.dart';
import 'loginPasswordTextFieldPart.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginTitle(text: "Sign In"),
          SizedBox(height: 1.h),
          LoginSubTitle(
              text:
                  "Sign in to enjoy exclusive offers, special deals, and rewards."),
          SizedBox(height: 2.h),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginNumberTextFieldPart(controller: phoneController),
                SizedBox(height: 3.h),
                BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, isPassword) {
                    return LoginPasswordTextFieldPart(
                      controller: passwordController,
                      isPassword: isPassword,
                      revPassword: () =>
                          context.read<PasswordVisibilityCubit>().toggle(),
                    );
                  },
                ),
                SizedBox(height: 1.h),
                LoginForgetPasswordButtonPart(),
                SizedBox(height: 5.h),
                BlocConsumer<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return LoginButton(
                      text: "sign in",
                      isLoading: state is LoginLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginCubit.login(
                              phoneController.text, passwordController.text);
                        }
                      },
                    );
                  },
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      appToast(context, 'login successful');
                    } else if (state is LoginFailure) {
                      appToast(context, state.message);
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                LoginGoToRegisterButtonPart(),
                SizedBox(height: 3.h),
                LoginDivider(),
                SizedBox(height: 1.h),
                LoginWithOthersOptionPart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
