import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/presentation/pages/auth/identification/view/identification.dart';
import 'package:test/presentation/pages/auth/onboarding/view/onboard.dart';
import 'package:test/presentation/pages/auth/otp/view/otp_veregication.dart';
import 'package:test/presentation/pages/edit_profiel/editing_profile.dart';
import 'package:test/presentation/pages/main/view/market/cart_view.dart';
import 'package:test/presentation/pages/main/view/market/check_delivery.dart';
import 'package:test/presentation/pages/main/view/market/custom_market_view.dart';
import 'package:test/presentation/pages/main/view/profile/profile_edit_page.dart';
import 'package:test/presentation/pages/main/view/usluga/custom_service_view.dart';
import 'package:test/presentation/pages/main/view/usluga/instruction_page.dart';
import 'package:test/presentation/pages/main/view/main_page.dart';
import 'package:test/presentation/pages/main/view/market/process_delivery_view.dart';
import 'package:test/presentation/pages/main/view/market/process_delivery_view1.dart';
import 'package:test/presentation/pages/main/view/market/successful_order.dart';
import 'package:test/presentation/pages/main/view/profile/new_edit_profile.dart';
import 'package:test/presentation/pages/main/view/usluga/more_details_view.dart';
import 'package:test/presentation/pages/main/view/profile/privacy_policy.dart';
import 'package:test/presentation/pages/main/view/usluga/order_registered.dart';
import 'package:test/presentation/pages/only_nav_bar/view/scaffold_with_navbar.dart';
import 'package:test/presentation/pages/splash/view/splash_page.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const SplashPage(),
      routes: [
        GoRoute(
          name: 'onboarding',
          path: 'onboarding',
          builder: (context, state) => const OnboardScreen(),
          routes: [
            GoRoute(
              name: 'identification',
              path: 'identification',
              builder: (context, state) => const IdentificationScreen(),
              routes: [
                GoRoute(
                  name: 'otp_verefication',
                  path: 'otp_verefication',
                  builder: (context, state) =>  OtpVerificationScreen(),
                  routes: [
                    GoRoute(
                      name: 'editing_profile',
                      path: 'editing_profile',
                      builder: (context, state) => const EditingProfileScreen(),
                      routes: [
                        GoRoute(
                          name: 'successful_order',
                          path: 'successful_order',
                          builder: (context, state) => const  SuccessfulOrder(),
                          routes: [
                            GoRoute(
                              name: 'order_registered',
                              path: 'order_registered',
                              builder: (context, state) => OrderRegistered(),
                            ),
                          ]
                        ),
                      ]
                    ),
                  ]
                ),
              ]
            ),
          ]
        ),
      ]
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(
          child: child,
        );
      },
      routes: [
        GoRoute(
            name: '/main',
            path: '/main',
            builder: (context, state) => const MainPage(),
            routes: [
              GoRoute(
                  name: 'uslugi',
                  path: 'uslugi',
                  builder: (context, state) => const CustomServiceView(),
                  routes: [
                    GoRoute(
                      name: 'instruction_page',
                      path: 'instruction_page',
                      builder: (context, state) => const InstructionPage(),
                    ),
                    GoRoute(
                        name: 'more_detail_courier',
                        path: 'more_detail_courier',
                        builder: (context, state) => const MoreDetailsView(typeTariff: TypeTariff.courierExport,),
                        routes: [

                        ]
                    ),
                    GoRoute(
                      name: 'more_detail_truck',
                      path: 'more_detail_truck',
                      builder: (context, state) => const MoreDetailsView(typeTariff: TypeTariff.truckExport),
                    ),
                    GoRoute(
                      name: 'more_detail_warehouse',
                      path: 'more_detail_warehouse',
                      builder: (context, state) => const MoreDetailsView(typeTariff: TypeTariff.warehouseExport),
                    ),
                  ]
              ),
              GoRoute(
                  name: 'market',
                  path: 'market',
                  builder: (context, state) => const CustomMarketView(),
                  routes: [
                    GoRoute(
                      name: 'cart_view',
                      path: 'cart_view',
                      builder: (context, state) => const CartView(),
                    ),
                    GoRoute(
                      name: 'process_delivery',
                      path: 'process_delivery',
                      builder: (context, state) => ProcessDeliveryView(),
                    ),
                    GoRoute(
                      name: 'process_delivery1',
                      path: 'process_delivery1',
                      builder: (context, state) => ProcessDeliveryView1(),
                    ),
                    GoRoute(
                      name: 'check_delivery',
                      path: 'check_delivery',
                      builder: (context, state) => const  CheckDelivery(),
                    ),

                  ]
              ),
              GoRoute(
                  name: 'profile',
                  path: 'profile',
                  builder: (context, state) => const ProfileEditPageView(),
                  routes: [
                    GoRoute(
                      name: 'privacy_policy',
                      path: 'privacy_policy',
                      builder: (context, state) => const PrivacyPolicyPage(),
                    ),
                    GoRoute(
                      name: 'new_edit_profile',
                      path: 'new_edit_profile',
                      builder: (context, state) => const NewEditProfile(),
                    ),
                  ]
              ),


            ]
        ),



      ],
    ),

  ],
);

// final router = GoRouter(
//   routes: [
//   GoRoute(
//     name: '/',
//     path: '/',
//     builder: (context, state) => const SplashPage(),
//   ),
//   GoRoute(
//       name: '/onboarding',
//       path: '/onboarding',
//       builder: (context, state) => const OnboardScreen(),
//   ),
//   GoRoute(
//     name: '/identification',
//     path: '/identification',
//     builder: (context, state) => const IdentificationScreen(),
//   ),
//   GoRoute(
//     name: '/otp_verefication',
//     path: '/otp_verefication',
//     builder: (context, state) =>  OtpVerificationScreen(),
//   ),
//   GoRoute(
//     name: '/editing_profile',
//     path: '/editing_profile',
//     builder: (context, state) => const EditingProfileScreen(),
//   ),
//     GoRoute(
//     name: '/privacy_policy',
//     path: '/privacy_policy',
//     builder: (context, state) => const PrivacyPolicyPage(),
//   ),
//
//   GoRoute(
//     name: '/main',
//     path: '/main',
//     builder: (context, state) => const MainPage(),
//   ),
//     GoRoute(
//       name: '/instruction_page',
//       path: '/instruction_page',
//       builder: (context, state) => const InstructionPage(),
//     ),
//     GoRoute(
//       name: '/new_edit_profile',
//       path: '/new_edit_profile',
//       builder: (context, state) =>  NewEditProfile(),
//     ),
//
//
// ],
// );