import 'package:flutter/material.dart';
import 'package:untitled1/widgets/auth/registration_label.dart';

import '../../../screens/auth/login_screen.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Signup",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        RegistrationLabel(
          prefixText: "Already have an account?",
          linkText: "Login",
          navigateTo: LoginScreen(),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
