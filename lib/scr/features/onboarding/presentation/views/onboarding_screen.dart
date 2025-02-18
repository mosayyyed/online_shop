import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_mvvm/scr/features/auth/presentation/views/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/widgets/custom_button.dart';
import '../controller/onboarding/onboarding_cubit.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = BlocProvider.of<OnboardingCubit>(context);

    final List<Widget> onboardingPages = [
      OnboardingPage(
        image: 'assets/onboarding_images/onboarding1.png',
        title: 'Explore a wide range of products',
        description:
            'Explore a wide range of products at your fingertips. OnlineShop offers an extensive collection to suit your needs.',
      ),
      OnboardingPage(
        image: 'assets/onboarding_images/onboarding2.png',
        title: 'Unlock exclusive offers and discounts',
        description:
            'Get access to limited-time deals and special promotions available only to our valued customers.',
      ),
      OnboardingPage(
        image: 'assets/onboarding_images/onboarding3.png',
        title: 'Safe and secure payments',
        description:
            'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      return PageView(
                        physics: const BouncingScrollPhysics(),
                        controller: onboardingCubit.pageController,
                        onPageChanged: (index) {
                          onboardingCubit.setCurrentPage(index);
                        },
                        children: onboardingPages,
                      );
                    },
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).go(LoginScreen.routeName);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: onboardingCubit.pageController,
              count: onboardingPages.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.black,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 4,
                spacing: 10,
              ),
            ),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (onboardingCubit.currentPage <
                          onboardingPages.length - 1)
                        Expanded(
                          flex: 6,
                          child: CustomButton(
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            label: 'Next',
                            onTap: () {
                              onboardingCubit.nextPage();
                            },
                          ),
                        ),
                      if (onboardingCubit.currentPage ==
                          onboardingPages.length - 1)
                        Expanded(
                          child: CustomButton(
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            label: 'Get Started',
                            onTap: () {
                              GoRouter.of(context).go(LoginScreen.routeName);
                            },
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
