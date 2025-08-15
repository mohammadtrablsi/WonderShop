import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../domain/entities/login_entity.dart';
import '../../manger/login_cubit/login_cubit.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    LoginEntity? loginData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Form(
        key: loginCubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username Field
            TextFormField(
              controller: loginCubit.usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your username' : null,
            ),
            SizedBox(height: 16),

            // Password Field
            TextFormField(
              controller: loginCubit.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your password' : null,
            ),
            SizedBox(height: 24),

            // Submit Button
            BlocConsumer<LoginCubit, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: loginCubit.submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  ),
                  child: (state is LoginSuccess ||
                          state is LoginInitial||
                          state is LoginFailure)
                      ? Text('Login')
                      : const CircularProgressIndicator(),
                );
              },
              listener: (context, state) {
                if (state is LoginSuccess) {
                  loginData = state.data;
                }

                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildErrorWidget(state.errMessage),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
