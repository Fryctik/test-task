import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:test/data/local/di/navigator_observer.dart';
import 'package:test/presentation/manager/navigation/navigation_cubit.dart';
import 'package:test/presentation/pages/achievements/view/achievements_page.dart';
import 'package:test/presentation/pages/auth/identification/view/identification.dart';
import 'package:test/presentation/pages/auth/onboarding/view/onboard.dart';
import 'package:test/presentation/pages/auth/otp/view/otp_veregication.dart';
import 'package:test/presentation/pages/chat/view/chat.dart';
import 'package:test/presentation/pages/edit_profiel/editing_profile.dart';
import 'package:test/presentation/pages/history/view/empty_history_view.dart';
import 'package:test/presentation/pages/history/view/history_page.dart';
import 'package:test/presentation/pages/main/view/home_page.dart';
import 'package:test/presentation/pages/main/view/market/view/cart_view.dart';
import 'package:test/presentation/pages/main/view/market/view/check_delivery.dart';
import 'package:test/presentation/pages/main/view/market/view/custom_market_view.dart';
import 'package:test/presentation/pages/main/view/market/view/more_market_detail_view.dart';
import 'package:test/presentation/pages/main/view/market/view/process_delivery_view.dart';
import 'package:test/presentation/pages/main/view/market/view/process_delivery_view1.dart';
import 'package:test/presentation/pages/main/view/profile/view/profile_edit_page.dart';
import 'package:test/presentation/pages/main/view/usluga/view/custom_service_view.dart';
import 'package:test/presentation/pages/main/view/market/view/successful_order.dart';
import 'package:test/presentation/pages/main/view/profile/view/new_edit_profile.dart';
import 'package:test/presentation/pages/main/view/profile/components/privacy_policy.dart';
import 'package:test/presentation/pages/main/view/usluga/view/instruction_page.dart';
import 'package:test/presentation/pages/main/view/usluga/view/more_details_view.dart';
import 'package:test/presentation/pages/only_nav_bar/view/scaffold_with_navbar.dart';
import 'package:test/presentation/pages/order/view/amount_of_package.dart';
import 'package:test/presentation/pages/order/view/check_info.dart';
import 'package:test/presentation/pages/order/view/choose_time.dart';
import 'package:test/presentation/pages/order/view/confirm_address.dart';
import 'package:test/presentation/pages/order/view/enter_order_address.dart';
import 'package:test/presentation/pages/order/view/file_list.dart';
import 'package:test/presentation/pages/order/view/order_page.dart';
import 'package:test/presentation/pages/order/view/order_registered.dart';
import 'package:test/presentation/pages/order/view/time_is_up.dart';
import 'package:test/presentation/pages/splash/view/splash_page.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _rootNavigatorKeyHome =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> _rootNavigatorKeyHistory =
    GlobalKey<NavigatorState>(debugLabel: 'shellHistory');
final GlobalKey<NavigatorState> _rootNavigatorKeyOrder =
    GlobalKey<NavigatorState>(debugLabel: 'shellOrder');
final GlobalKey<NavigatorState> _rootNavigatorKeyChat =
    GlobalKey<NavigatorState>(debugLabel: 'shellChat');
final GlobalKey<NavigatorState> _rootNavigatorKeyAchievements =
    GlobalKey<NavigatorState>(debugLabel: 'shellAchievements');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

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
                          builder: (context, state) => const OtpVerificationScreen(),
                          routes: [
                            GoRoute(
                                name: 'editing_profile',
                                path: 'editing_profile',
                                builder: (context, state) =>
                                    const EditingProfileScreen(),
                            ),
                          ]),
                    ]),
              ]),
        ]),
    StatefulShellRoute.indexedStack(
        branches: <StatefulShellBranch>[
          //Home
          StatefulShellBranch(navigatorKey: _rootNavigatorKeyHome, routes: [
            GoRoute(
                name: '/main',
                path: '/main',
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                      name: 'market',
                      path: 'market',
                      builder: (context, state) => const CustomMarketView(),
                      routes: [
                        GoRoute(
                          name: 'market_details',
                          path: 'market_details',
                          builder: (context, state) => const MoreMarketDetailView(),
                        ),
                        GoRoute(
                          name: 'cart_view',
                          path: 'cart_view',
                          builder: (context, state) => const CartView(),
                        ),
                        GoRoute(
                          name: 'process_delivery',
                          path: 'process_delivery',
                          builder: (context, state) => const ProcessDeliveryView(),
                        ),
                        GoRoute(
                          name: 'process_delivery1',
                          path: 'process_delivery1',
                          builder: (context, state) => const ProcessDeliveryView1(),
                        ),
                        GoRoute(
                          name: 'check_delivery',
                          path: 'check_delivery',
                          builder: (context, state) => const CheckDelivery(),
                        ),
                        GoRoute(
                            name: 'successful_order',
                            path: 'successful_order',
                            builder: (context, state) =>
                            const SuccessfulOrder(),
                        ),
                        GoRoute(
                            name: 'order_registered',
                            path: 'order_registered',
                            builder: (context, state) =>
                            const OrderRegistered(),
                        ),
                        GoRoute(
                          name: 'pdf_preview',
                          path: 'pdf_preview',
                          builder: (context, state) => PdfPreview(),
                        ),
                      ]),
                  GoRoute(
                      name: 'profile',
                      path: 'profile',
                      builder: (context, state) => const ProfileEditPageView(),
                      routes: [
                        GoRoute(
                          name: 'privacy_policy',
                          path: 'privacy_policy',
                          builder: (context, state) =>
                              const PrivacyPolicyPage(),
                        ),
                        GoRoute(
                          name: 'new_edit_profile',
                          path: 'new_edit_profile',
                          builder: (context, state) => const NewEditProfile(),
                        ),
                      ]),
                ]),
          ]),
          //History
          StatefulShellBranch(navigatorKey: _rootNavigatorKeyHistory, routes: [
            GoRoute(
                path: '/empty_history',
                name: '/empty_history',
                builder: (context, state) => const EmptyHistoryView(),
                routes: [
                  GoRoute(
                    path: 'history_page',
                    name: 'history_page',
                    builder: (context, state) => const OrderHistoryPage(),
                  )
                ]),
          ]),
          //Order
          StatefulShellBranch(
              navigatorKey: _rootNavigatorKeyOrder,
              routes: [
                GoRoute(
                    name: '/uslugi',
                    path: '/uslugi',
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
                          builder: (context, state) => const MoreDetailsView(
                            typeTariff: TypeTariff.courierExport,
                          ),
                          routes: [
                            GoRoute(
                                name: 'order_page',
                                path: 'order_page',
                                builder: (context, state) =>
                                const OrderPage(),
                                routes: [
                                  GoRoute(
                                      name: 'enter_order_address',
                                      path: 'enter_order_address',
                                      builder: (context, state) =>
                                      const EnterOrderAddress(),
                                      routes: [
                                        GoRoute(
                                            name: 'confirm_address',
                                            path: 'confirm_address',
                                            builder: (context, state) =>
                                            const ConfirmAddress(),
                                            routes: [
                                              GoRoute(
                                                  name: 'amount_of_package',
                                                  path: 'amount_of_package',
                                                  builder: (context, state) =>
                                                  const AmountOfPackage(),
                                                  routes: [
                                                    GoRoute(
                                                        name: 'choose_time',
                                                        path: 'choose_time',
                                                        builder: (context,
                                                            state) =>
                                                        const ChooseTime(),
                                                        routes: [
                                                          GoRoute(
                                                            name: 'time_up',
                                                            path: 'time_up',
                                                            builder: (context,
                                                                state) =>
                                                            const TimeIsUp(),
                                                          ),
                                                          GoRoute(
                                                            name:
                                                            'check_info',
                                                            path:
                                                            'check_info',
                                                            builder: (context,
                                                                state) =>
                                                            const CheckInfo(),
                                                          ),
                                                        ]),
                                                  ]),
                                            ]),
                                      ]),
                                ]),
                          ]),
                      GoRoute(
                        name: 'more_detail_truck',
                        path: 'more_detail_truck',
                        builder: (context, state) => const MoreDetailsView(
                            typeTariff: TypeTariff.truckExport),
                      ),
                      GoRoute(
                        name: 'more_detail_warehouse',
                        path: 'more_detail_warehouse',
                        builder: (context, state) => const MoreDetailsView(
                            typeTariff: TypeTariff.warehouseExport),
                      ),
                    ]),
              ]
          ),
          //Chat
          StatefulShellBranch(navigatorKey: _rootNavigatorKeyChat, routes: [
            GoRoute(
                path: '/chat',
                name: '/chat',
                builder: (context, state) => const ChatPage()),
          ]),
          //Achievements
          StatefulShellBranch(
              navigatorKey: _rootNavigatorKeyAchievements,
              routes: [
                GoRoute(
                    path: '/achievements',
                    name: '/achievements',
                    builder: (context, state) => const AchievementsPage()),
              ]),
        ],
        builder: (context, state, navigationShell) {
          context.read<NavigationCubit>().setNavigationShell(navigationShell);
          context.read<NavigationCubit>().updateCurrentPageName(state.fullPath?? '');
          return ScaffoldWithNavBar(
            statefulNavigationShell: navigationShell,
          );
        }),
    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   builder: (context, state, child) {
    //     return ScaffoldWithNavBar(
    //       child: child,
    //     );
    //   },
    //   routes: [
    //     GoRoute(
    //         name: '/main',
    //         path: '/main',
    //         builder: (context, state) => const HomePage(),
    //         routes: [
    //           GoRoute(
    //               name: 'uslugi',
    //               path: 'uslugi',
    //               builder: (context, state) => const CustomServiceView(),
    //               routes: [
    //                 GoRoute(
    //                   name: 'instruction_page',
    //                   path: 'instruction_page',
    //                   builder: (context, state) => const InstructionPage(),
    //                 ),
    //                 GoRoute(
    //                     name: 'more_detail_courier',
    //                     path: 'more_detail_courier',
    //                     builder: (context, state) => const MoreDetailsView(typeTariff: TypeTariff.courierExport,),
    //                 ),
    //                 GoRoute(
    //                   name: 'more_detail_truck',
    //                   path: 'more_detail_truck',
    //                   builder: (context, state) => const MoreDetailsView(typeTariff: TypeTariff.truckExport),
    //                 ),
    //                 GoRoute(
    //                   name: 'more_detail_warehouse',
    //                   path: 'more_detail_warehouse',
    //                   builder: (context, state) => const MoreDetailsView(typeTariff: TypeTariff.warehouseExport),
    //                 ),
    //               ]
    //           ),
    //           GoRoute(
    //               name: 'market',
    //               path: 'market',
    //               builder: (context, state) => const CustomMarketView(),
    //               routes: [
    //                 GoRoute(
    //                   name: 'cart_view',
    //                   path: 'cart_view',
    //                   builder: (context, state) => const CartView(),
    //                 ),
    //                 GoRoute(
    //                   name: 'process_delivery',
    //                   path: 'process_delivery',
    //                   builder: (context, state) => ProcessDeliveryView(),
    //                 ),
    //                 GoRoute(
    //                   name: 'process_delivery1',
    //                   path: 'process_delivery1',
    //                   builder: (context, state) => ProcessDeliveryView1(),
    //                 ),
    //                 GoRoute(
    //                   name: 'check_delivery',
    //                   path: 'check_delivery',
    //                   builder: (context, state) => const  CheckDelivery(),
    //                 ),
    //
    //               ]
    //           ),
    //           GoRoute(
    //               name: 'profile',
    //               path: 'profile',
    //               builder: (context, state) => const ProfileEditPageView(),
    //               routes: [
    //                 GoRoute(
    //                   name: 'privacy_policy',
    //                   path: 'privacy_policy',
    //                   builder: (context, state) => const PrivacyPolicyPage(),
    //                 ),
    //                 GoRoute(
    //                   name: 'new_edit_profile',
    //                   path: 'new_edit_profile',
    //                   builder: (context, state) => const NewEditProfile(),
    //                 ),
    //               ]
    //           ),
    //         ]
    //     ),
    //     GoRoute(
    //       path: '/history_page',
    //         name: '/history_page',
    //         builder: (context,state)=> const OrderHistoryPage(),
    //     ),
    //     GoRoute(
    //         name: '/order_page',
    //         path: '/order_page',
    //         builder: (context, state) => const OrderPage(),
    //         routes: [
    //           GoRoute(
    //             name: 'enter_order_address',
    //             path: 'enter_order_address',
    //             builder: (context, state) => const EnterOrderAddress(),
    //           ),
    //           GoRoute(
    //             name: 'confirm_address',
    //             path: 'confirm_address',
    //             builder: (context, state) => const ConfirmAddress(),
    //           ),
    //           GoRoute(
    //             name: 'amount_of_package',
    //             path: 'amount_of_package',
    //             builder: (context, state) => const AmountOfPackage(),
    //           ) ,
    //           GoRoute(
    //             name: 'choose_time',
    //             path: 'choose_time',
    //             builder: (context, state) => const ChooseTime(),
    //           ),
    //           GoRoute(
    //             name: 'check_info',
    //             path: 'check_info',
    //             builder: (context, state) => const CheckInfo(),
    //           )
    //
    //         ]
    //     ),
    //     GoRoute(path: '/chat' ,
    //         name: '/chat',
    //         builder: (context,state)=> ChatPage()
    //     ),
    //     GoRoute(path:'/achievements' ,
    //         name:'/achievements',
    //         builder: (context,state)=> AchievementsPage()
    //     ),
    //   ],
    // ),
  ],
  observers: [CustomNavigatorObserver(Get.find<NavigationCubit>())],
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
