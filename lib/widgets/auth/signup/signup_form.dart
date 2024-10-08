import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/utils/constants.dart';
import 'package:untitled1/widgets/auth/custom_button.dart';
import 'package:untitled1/widgets/auth/custom_textField.dart';

import '../../../providers/auth_provider.dart';
import '../../../screens/auth/confirmed_page.dart';
import '../../../screens/auth/login_screen.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Form(
        key: authProvider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Username',
              keyboardType: TextInputType.name,
              validator: authProvider.validateName,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: authProvider.validateEmail,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Password',
              obscureText: !authProvider.isPasswordVisible,
              icon: IconButton(
                icon: Icon(
                  authProvider.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: const Color(0xff717171),
                ),
                onPressed: authProvider.togglePasswordVisibility,
              ),
              validator: authProvider.validatePassword,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Confirm Password',
              obscureText: !authProvider.isConfirmPasswordVisible,
              icon: IconButton(
                icon: Icon(
                  authProvider.isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: const Color(0xff717171),
                ),
                onPressed: authProvider.toggleConfirmPasswordVisibility,
              ),
              validator: authProvider.validateConfirmPassword,
            ),
            const SizedBox(height: 25.0),
            CustomButton(
              onTap: () {
                if (authProvider.submitForm()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ConfirmedPage(
                        textOne: 'The account has been',
                        textTwo: 'created successfully',
                        textThree: 'Glad to welcome you!',
                        navigateTo: LoginScreen(),
                        buttonText: 'Log in',
                      ),
                    ),
                  );
                }
              },
              label: 'Create Account',
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
