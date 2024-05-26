import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/editing_profile.dart';
import 'package:test/presentation/screens/authentication_screens/identification_screen/identification.dart';
import 'package:test/presentation/screens/authentication_screens/onboard_screen/onboard.dart';
import 'package:test/presentation/screens/authentication_screens/otp_verification_screen/otp_veregication.dart';
import 'package:test/presentation/screens/main_screens/achievements_screen/achievements.dart';
import 'package:test/presentation/screens/main_screens/chat_user_screen/chat_user.dart';
import 'package:test/presentation/screens/main_screens/history_screen/history.dart';
import 'package:test/presentation/screens/main_screens/home_screen/home.dart';
import 'package:test/presentation/screens/main_screens/main_logic_screen.dart';
import 'package:test/presentation/screens/main_screens/order_screens/order_logic.dart';
import 'package:test/presentation/screens/main_screens/order_screens/screens/input_address_order.dart';
import 'package:test/presentation/screens/main_screens/order_screens/screens/selected_city_order.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardRoute.page, path: '/ddd'),
        AutoRoute(page: IdentificationRoute.page, path: '/identification'),
        AutoRoute(page: OtpVereficationRoute.page, path: '/otp_verefication'),
        AutoRoute(page: EditingProfileRoute.page, path: '/editing_profile'),
        AutoRoute(
          page: MainLogicRoute.page,
          path: '/',
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ChatUserRoute.page),
            AutoRoute(page: HistoryRoute.page),
            AutoRoute(
              page: OrderLogicRoute.page,
              children: [
                AutoRoute(page: SelectedCityOrderRoute.page),
                AutoRoute(page: InputAddressOrderRoute.page),
              ],
            ),
            AutoRoute(page: AchievementsRoute.page),
          ],
        ),
      ];
}


// final routes = {
//   '/' : (context) => const OnboardScreen(),
//   '/identification' : (context) => const IdentificationScreen(),
//   '/otp_verefication' : (context) => const OtpVereficationScreen(number: '',)
// };