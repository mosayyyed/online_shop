import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/login_screen.dart';
import '../registration_label.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onTap: () =>
              GoRouter.of(context).pushReplacement(LoginScreen.routeName),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
