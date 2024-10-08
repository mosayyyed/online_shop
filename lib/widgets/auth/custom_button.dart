import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String? label;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: onTap,
      child: Text(
        label ?? '',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
