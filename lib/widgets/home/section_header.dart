import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  final String seeMore;

  const SectionHeader({
    super.key,
    required this.title,
    required this.seeMore,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              seeMore,
              style: const TextStyle(
                fontSize: 14,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
