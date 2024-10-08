import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
    );
    notifyListeners();
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
    );
    notifyListeners();
  }

  void skipToEnd() {
    pageController.animateToPage(
      3,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCirc,
    );
    notifyListeners();
  }

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => screen),
    );
    notifyListeners();
  }
}
