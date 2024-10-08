import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Signup with Google",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(width: 12),
        Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png",
          height: 30,
          color: kPrimaryColor,
        ),
      ],
    );
  }
}
