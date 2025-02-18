import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
  });
  final String textOne;
  final String textTwo;
  final String textThree;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textOne,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          textTwo,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          textThree,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
