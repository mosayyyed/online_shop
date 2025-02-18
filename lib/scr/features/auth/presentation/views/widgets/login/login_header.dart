import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/sign_up_screen.dart';
import '../registration_label.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Login",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        RegistrationLabel(
          prefixText: "Don't have an account?",
          linkText: "Signup",
          onTap: () =>
              GoRouter.of(context).pushReplacement(SignUpScreen.routeName),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
