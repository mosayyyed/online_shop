import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

import '../../../onboarding/presentation/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          GoRouter.of(context).go(OnboardingScreen.routeName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SvgPicture.asset(
            //   'assets/onboarding_images/quickmart.png',
            //   width: 200,
            //   colorFilter: const ColorFilter.mode(
            //     AppColors.kPrimaryColor,
            //     BlendMode.srcIn,
            //   ),
            // ),
            Image.asset(
              'assets/onboarding_images/quickmart.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
