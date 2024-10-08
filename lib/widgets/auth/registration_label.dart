import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class RegistrationLabel extends StatelessWidget {
  final String prefixText;
  final String linkText;
  final Widget navigateTo;
  final void Function()? onTap;

  const RegistrationLabel({
    super.key,
    required this.prefixText,
    required this.linkText,
    this.onTap,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefixText,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff717171),
        ),
        children: [
          TextSpan(
            text: " $linkText",
            style: const TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => navigateTo,
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
