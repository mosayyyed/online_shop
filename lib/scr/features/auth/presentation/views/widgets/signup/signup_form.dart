import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_mvvm/scr/core/themes/app_colors.dart';
import 'package:online_shop_mvvm/scr/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_textField.dart';
import '../../../../data/models/signup_request_model.dart';
import '../../../controller/auth/auth_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final authCubit = context.read<AuthCubit>();

    return BlocListener<RegisterCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationError) {
          IconSnackBar.show(
            context,
            maxLines: 3,
            snackBarType: SnackBarType.fail,
            label: state.message,
          );
        } else if (state is RegistrationSuccess) {
          GoRouter.of(context).go('/home');
        }
      },
      child: Form(
        key: registerCubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Name',
              keyboardType: TextInputType.name,
              controller: registerCubit.nameController,
              validator: authCubit.validateName,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: registerCubit.emailController,
              validator: authCubit.validateEmail,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Password',
              obscureText: !context.watch<AuthCubit>().isPasswordVisible,
              icon: IconButton(
                icon: Icon(
                  context.watch<AuthCubit>().isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: const Color(0xff717171),
                ),
                onPressed: authCubit.togglePasswordVisibility,
              ),
              controller: registerCubit.passwordController,
              validator: authCubit.validatePassword,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Confirm Password',
              obscureText: !context.watch<AuthCubit>().isConfirmPasswordVisible,
              icon: IconButton(
                icon: Icon(
                  context.watch<AuthCubit>().isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: const Color(0xff717171),
                ),
                onPressed: authCubit.toggleConfirmPasswordVisibility,
              ),
              controller: registerCubit.confirmPasswordController,
              validator: (value) => authCubit.validateConfirmPassword(
                  value, registerCubit.passwordController.text),
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: AppColors.kPrimaryColor,
              label: 'Phone',
              keyboardType: TextInputType.phone,
              controller: registerCubit.phoneController,
              validator: authCubit.validatePhoneNumber,
            ),
            const SizedBox(height: 25.0),
            CustomButton(
              onTap: () {
                if (registerCubit.formKey.currentState?.validate() ?? false) {
                  registerCubit.register(
                    signupRequestModel: RegisterRequestModel(
                      fullName: registerCubit.nameController.text,
                      email: registerCubit.emailController.text,
                      password: registerCubit.passwordController.text,
                      phone: registerCubit.phoneController.text,
                    ),
                  );
                }
              },
              label: registerCubit.isLoading ? 'Loading...' : 'Create Account',
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
