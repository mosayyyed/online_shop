import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_mvvm/scr/core/themes/app_colors.dart';
import 'package:online_shop_mvvm/scr/features/auth/data/models/login_request_model.dart';

import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_textField.dart';
import '../../../controller/auth/auth_cubit.dart';
import '../../../controller/login/login_cubit.dart';
import '../forget_password_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final authCubit = context.watch<AuthCubit>();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          AlertInfo.show(
            context: context,
            text: state.message,
            duration: 3,
            icon: Icons.error,
            typeInfo: TypeInfo.error,
          );
        } else if (state is LoginSuccess) {
          GoRouter.of(context).go('/home');
        }
      },
      child: Form(
        key: loginCubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Username',
              keyboardType: TextInputType.emailAddress,
              controller: loginCubit.emailController,
              validator: authCubit.validateEmail,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: !authCubit.isPasswordVisible,
              icon: IconButton(
                icon: Icon(
                  authCubit.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: const Color(0xff717171),
                ),
                onPressed: authCubit.togglePasswordVisibility,
              ),
              controller: loginCubit.passwordController,
              validator: authCubit.validatePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ForgetPasswordScreen();
                    }));
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.kPrimaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              onTap: () {
                if (loginCubit.formKey.currentState!.validate()) {
                  loginCubit.login(
                    loginRequestModel: LoginRequestModel(
                        email: loginCubit.emailController.text,
                        password: loginCubit.passwordController.text),
                  );
                }
              },
              label: loginCubit.isLoading ? 'Logging in...' : 'Login',
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onTap: () {},
              label: 'Sign in with Apple',
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.apple,
                color: Colors.black,
                size: 30,
              ),
              textColor: Colors.black,
            ),
            const SizedBox(height: 5.0),
            CustomButton(
              onTap: () {},
              label: 'Sign in with Facebook',
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.facebook,
                color: Colors.black,
                size: 30,
              ),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
