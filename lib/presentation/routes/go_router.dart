import 'package:go_router/go_router.dart';
import 'package:test/presentation/pages/auth/identification/view/identification.dart';
import 'package:test/presentation/pages/auth/onboarding/view/onboard.dart';
import 'package:test/presentation/pages/auth/otp/view/otp_veregication.dart';
import 'package:test/presentation/pages/edit_profiel/editing_profile.dart';
import '../pages/main/view/main_page.dart';
import '../pages/splash/view/splash_page.dart';

final router = GoRouter(
  routes: [
  GoRoute(
    name: '/',
    path: '/',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
      name: '/onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardScreen(),
  ),
  GoRoute(
    name: '/identification',
    path: '/identification',
    builder: (context, state) => const IdentificationScreen(),
  ),
  GoRoute(
    name: '/otp_verefication',
    path: '/otp_verefication',
    builder: (context, state) =>  OtpVerificationScreen(),
  ),
  GoRoute(
    name: '/editing_profile',
    path: '/editing_profile',
    builder: (context, state) => const EditingProfileScreen(),
  ),

  GoRoute(
    name: '/main',
    path: '/main',
    builder: (context, state) => const MainPage(),
  ),


],
);