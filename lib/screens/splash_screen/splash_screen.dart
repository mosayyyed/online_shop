import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      });
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/onboarding_images/quickmart.png',
          height: 70,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
