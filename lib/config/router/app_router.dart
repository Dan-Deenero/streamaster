import 'package:go_router/go_router.dart';
import 'package:streamaster/config/keys/app_routes.dart';
import 'package:streamaster/domain/data/auth_page.dart';
import 'package:streamaster/features/presentation/views/admin_pages/admin.dart';
import 'package:streamaster/features/presentation/views/main_auth/create_account.dart';
import 'package:streamaster/features/presentation/views/main_auth/login.dart';
import 'package:streamaster/features/presentation/views/main_auth/reset_password.dart';
import 'package:streamaster/features/presentation/views/onboarding.dart/onboarding.dart';
import 'package:streamaster/features/presentation/views/onboarding.dart/splashscreen.dart';
import 'package:streamaster/features/presentation/views/profile/profile.dart';
import 'package:streamaster/home/home.dart';


final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: AppRoutes.splashscreen,
          name: AppRoutes.splashscreen,
          builder: (_, state) => const SplashScreen()),
      GoRoute(
          path: AppRoutes.onboarding,
          name: AppRoutes.onboarding,
          builder: (_, state) =>  const OnboardingScreen()),
      GoRoute(
          path: AppRoutes.login,
          name: AppRoutes.login,
          builder: (_, state) => const  Login()),
      GoRoute(
          path: AppRoutes.createAccount,
          name: AppRoutes.createAccount,
          builder: (_, state) => const  Register()),
      GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (_, state) => HomePage()),
      GoRoute(
          path: AppRoutes.resetPassword,
          name: AppRoutes.resetPassword,
          builder: (_, state) =>const ResetPassword()),
      
      GoRoute(
          path: AppRoutes.authpage,
          name: AppRoutes.authpage,
          builder: (_, state) =>const AuthPage()),
      GoRoute(
          path: AppRoutes.admin,
          name: AppRoutes.admin,
          builder: (_, state) =>const AdminPage()),GoRoute(
          path: AppRoutes.profile,
          name: AppRoutes.profile,
          builder: (_, state) => UserProfile())

      
    ]);
  