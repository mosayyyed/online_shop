import 'package:flutter/material.dart';
import 'package:untitled1/widgets/auth/registration_label.dart';

import '../../../screens/auth/sign_up_screen.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Login",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        RegistrationLabel(
          prefixText: "Don't have an account?",
          linkText: "Signup",
          navigateTo: SignUpScreen(),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
