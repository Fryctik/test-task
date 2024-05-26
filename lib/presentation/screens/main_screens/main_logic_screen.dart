import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';
import 'package:test/presentation/screens/main_screens/bottom_navigation_bar_widget.dart';

@RoutePage()
class MainLogicScreen extends StatefulWidget {
  const MainLogicScreen({super.key});

  @override
  State<MainLogicScreen> createState() => _MainLogicScreenState();
}

class _MainLogicScreenState extends State<MainLogicScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        HistoryRoute(),
        OrderLogicRoute(),
        ChatUserRoute(),
        AchievementsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return SafeArea(
          child: Scaffold(
            body: child,
            bottomNavigationBar: CustomNavigationBar(
              tabsIndex: tabsRouter,
            ),
          ),
        );
      },
    );
  }
}
