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
    IdentificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IdentificationScreen(),
      );
    },
    OnboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardScreen(),
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
  };
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
