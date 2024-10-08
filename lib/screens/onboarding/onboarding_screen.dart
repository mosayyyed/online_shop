import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/auth/login_screen.dart';
import 'package:untitled1/screens/auth/sign_up_screen.dart';

import '../../providers/onboarding_provider.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/onboarding/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Consumer<OnboardingProvider>(
                  builder: (context, provider, child) {
                    return PageView(
                      controller: provider.pageController,
                      onPageChanged: (index) {
                        provider.setCurrentPage(index);
                      },
                      children: const [
                        OnboardingPage(
                          image: 'assets/onboarding_images/onboarding1.png',
                          title: 'Explore a wide range of products',
                          description:
                              'Explore a wide range of products at your fingertips. OnlineShope offers an extensive collection to suit your needs.',
                        ),
                        OnboardingPage(
                          image: 'assets/onboarding_images/onboarding2.png',
                          title: 'Unlock exclusive offers and discounts',
                          description:
                              'Get access to limited-time deals and special promotions available only to our valued customers.',
                        ),
                        OnboardingPage(
                          image: 'assets/onboarding_images/onboarding1.png',
                          title: 'Explore a wide range of products',
                          description:
                              'Explore a wide range of products at your fingertips. OnlineShope offers an extensive collection to suit your needs.',
                        ),
                        OnboardingPage(
                          image: 'assets/onboarding_images/onboarding3.png',
                          title: 'Safe and secure payments',
                          description:
                              'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<OnboardingProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (provider.currentPage > 0 &&
                            provider.currentPage < 3)
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  provider.previousPage();
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                          ),
                        if (provider.currentPage < 3)
                          Expanded(
                            flex: 6,
                            child: CustomButton(
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              label: 'Next',
                              onTap: () {
                                provider.nextPage();
                              },
                            ),
                          ),
                        if (provider.currentPage == 3)
                          Expanded(
                            child: CustomButton(
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              label: 'Login',
                              onTap: () {
                                provider.navigateTo(
                                    context, const LoginScreen());
                              },
                            ),
                          ),
                        if (provider.currentPage == 3)
                          const SizedBox(width: 10),
                        if (provider.currentPage == 3)
                          Expanded(
                            child: CustomButton(
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              label: 'Get Started',
                              onTap: () {
                                provider.navigateTo(
                                    context, const SignUpScreen());
                              },
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
