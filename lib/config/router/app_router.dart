import 'package:go_router/go_router.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/features/presentation/views/onboarding.dart/onboarding.dart';
import 'package:streamaster/features/presentation/views/onboarding.dart/splashScreen.dart';


final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: AppRoutes.splashscreen,
          name: AppRoutes.splashscreen,
          builder: (_, state) => const SplashScreen()),
      GoRoute(
          path: AppRoutes.onboarding,
          name: AppRoutes.onboarding,
          builder: (_, state) =>  OnboardingScreen()),
    ]);
  