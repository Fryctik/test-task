import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/editing_profile.dart';
import 'package:test/presentation/screens/authentication_screens/identification_screen/identification.dart';
import 'package:test/presentation/screens/authentication_screens/onboard_screen/onboard.dart';
import 'package:test/presentation/screens/authentication_screens/otp_verification_screen/otp_veregication.dart';


part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardRoute.page, path: '/'),
    AutoRoute(page: IdentificationRoute.page, path: '/identification'),
    AutoRoute(page: OtpVereficationRoute.page, path: '/otp_verefication'),
    AutoRoute(page: EditingProfileRoute.page, path: '/editing_profile'),
  ];
}


// final routes = {
//   '/' : (context) => const OnboardScreen(),
//   '/identification' : (context) => const IdentificationScreen(),
//   '/otp_verefication' : (context) => const OtpVereficationScreen(number: '',)
// };