import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.tabsIndex});

  final TabsRouter tabsIndex;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      currentIndex: widget.tabsIndex.activeIndex,
      onTap: (index) => _openPage(index, widget.tabsIndex),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: theme.textTheme.displaySmall,
      unselectedLabelStyle: theme.textTheme.displaySmall,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.shade2,
      elevation: 0,
      items:[
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/bottom_appbar_icons/home_disabled.png', height: 24, width: 24,),
          label: 'Главная',
          activeIcon: Image.asset('assets/icons/bottom_appbar_icons/home_enabled.png', height: 24, width: 24,),
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/bottom_appbar_icons/history_disabled.png', height: 24, width: 24,),
          label: 'История',
          activeIcon: Image.asset('assets/icons/bottom_appbar_icons/history_enabled.png', height: 24, width: 24,),
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/bottom_appbar_icons/plus.png', height: 40, width: 40,),
          label: 'Заказать',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/bottom_appbar_icons/chat_disabled.png', height: 24, width: 24,),
          label: 'Чат',
          activeIcon: Image.asset('assets/icons/bottom_appbar_icons/chat_enabled.png', height: 24, width: 24,),
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/bottom_appbar_icons/achievements_disabled.png', height: 24, width: 24,),
          label: 'Достижения',
          activeIcon: Image.asset('assets/icons/bottom_appbar_icons/achievements_enabled.png', height: 24, width: 24,),
        ),
      ]
    );
  }
}