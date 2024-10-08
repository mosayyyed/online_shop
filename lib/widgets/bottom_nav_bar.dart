import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SalomonBottomBar(
          curve: Curves.bounceOut,
          currentIndex: selectedIndex,
          onTap: onTabTapped,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: const Text("Home"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.heart),
              title: const Text("Wishlist"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.doc_plaintext),
              title: const Text("History"),
              selectedColor: kPrimaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.person),
              title: const Text("Profile"),
              selectedColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
