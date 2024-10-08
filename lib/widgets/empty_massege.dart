import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage(
      {super.key,
      required this.image,
      required this.massege,
      required this.subMassege});

  final String image;
  final String massege;
  final String subMassege;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 200,
          height: 200,
        ),
        Text(
          massege,
          // 'No ongoing order',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            subMassege,
            // "We currently don't have any active orders in progress. Feel free to explore our products and place a new order.",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
