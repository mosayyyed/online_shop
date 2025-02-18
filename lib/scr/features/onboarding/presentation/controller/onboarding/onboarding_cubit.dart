import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  OnboardingCubit() : super(OnboardingInitial());

  int get currentPage => _currentPage;

  void setCurrentPage(int index) {
    emit(OnboardingLoading());
    _currentPage = index;
    emit(OnboardingSuccess());
  }

  void nextPage() {
    emit(OnboardingLoading());
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
    );
    emit(OnboardingSuccess());
  }

  void previousPage() {
    emit(OnboardingLoading());

    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
    );
    emit(OnboardingSuccess());
  }

  void skipToEnd() {
    emit(OnboardingLoading());

    pageController.animateToPage(
      3,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCirc,
    );
    emit(OnboardingSuccess());
    ();
  }

  void navigateTo(BuildContext context, String screen) {
    emit(OnboardingLoading());

    GoRouter.of(context).push(screen);
    emit(OnboardingSuccess());
    ();
  }
}
