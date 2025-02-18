import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_mvvm/scr/core/utils/service_locator.dart';
import 'package:online_shop_mvvm/scr/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:online_shop_mvvm/scr/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:online_shop_mvvm/scr/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:online_shop_mvvm/scr/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/presentation/views/screens/login_screen.dart';
import '../../features/auth/presentation/views/screens/sign_up_screen.dart';
import '../../features/onboarding/presentation/controller/onboarding/onboarding_cubit.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: OnboardingScreen.routeName,
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            ),
          ],
          child: const SignUpScreen(),
        ),
      ),
    ],
  );
}
