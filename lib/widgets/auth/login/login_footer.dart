import 'package:flutter/material.dart';
import 'package:untitled1/widgets/auth/social_button.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20.0),
        SocialButtons(),
        SizedBox(height: 20.0),
      ],
    );
  }
}
