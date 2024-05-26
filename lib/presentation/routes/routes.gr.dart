// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AchievementsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AchievementsScreen(),
      );
    },
    ChatUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatUserScreen(),
      );
    },
    EditingProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditingProfileScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    IdentificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IdentificationScreen(),
      );
    },
    InputAddressOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InputAddressOrderScreen(),
      );
    },
    MainLogicRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainLogicScreen(),
      );
    },
    OnboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardScreen(),
      );
    },
    OrderLogicRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderLogicScreen(),
      );
    },
    OtpVereficationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVereficationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpVereficationScreen(
          key: args.key,
          number: args.number,
        ),
      );
    },
    SelectedCityOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectedCityOrderScreen(),
      );
    },
  };
}

/// generated route for
/// [AchievementsScreen]
class AchievementsRoute extends PageRouteInfo<void> {
  const AchievementsRoute({List<PageRouteInfo>? children})
      : super(
          AchievementsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AchievementsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatUserScreen]
class ChatUserRoute extends PageRouteInfo<void> {
  const ChatUserRoute({List<PageRouteInfo>? children})
      : super(
          ChatUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditingProfileScreen]
class EditingProfileRoute extends PageRouteInfo<void> {
  const EditingProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditingProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditingProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IdentificationScreen]
class IdentificationRoute extends PageRouteInfo<void> {
  const IdentificationRoute({List<PageRouteInfo>? children})
      : super(
          IdentificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'IdentificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InputAddressOrderScreen]
class InputAddressOrderRoute extends PageRouteInfo<void> {
  const InputAddressOrderRoute({List<PageRouteInfo>? children})
      : super(
          InputAddressOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputAddressOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainLogicScreen]
class MainLogicRoute extends PageRouteInfo<void> {
  const MainLogicRoute({List<PageRouteInfo>? children})
      : super(
          MainLogicRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainLogicRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardScreen]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute({List<PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderLogicScreen]
class OrderLogicRoute extends PageRouteInfo<void> {
  const OrderLogicRoute({List<PageRouteInfo>? children})
      : super(
          OrderLogicRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderLogicRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpVereficationScreen]
class OtpVereficationRoute extends PageRouteInfo<OtpVereficationRouteArgs> {
  OtpVereficationRoute({
    Key? key,
    required String number,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVereficationRoute.name,
          args: OtpVereficationRouteArgs(
            key: key,
            number: number,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVereficationRoute';

  static const PageInfo<OtpVereficationRouteArgs> page =
      PageInfo<OtpVereficationRouteArgs>(name);
}

class OtpVereficationRouteArgs {
  const OtpVereficationRouteArgs({
    this.key,
    required this.number,
  });

  final Key? key;

  final String number;

  @override
  String toString() {
    return 'OtpVereficationRouteArgs{key: $key, number: $number}';
  }
}

/// generated route for
/// [SelectedCityOrderScreen]
class SelectedCityOrderRoute extends PageRouteInfo<void> {
  const SelectedCityOrderRoute({List<PageRouteInfo>? children})
      : super(
          SelectedCityOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectedCityOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
