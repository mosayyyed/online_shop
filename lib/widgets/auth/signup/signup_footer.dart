import 'package:flutter/material.dart';
import 'package:untitled1/widgets/auth/social_button.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

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
