import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/view/usluga/manager/sevice_cubit.dart';
import 'package:test/presentation/pages/only_nav_bar/manager/only_nav_bar_cubit.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/widgets/custom_bottom_navigation.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  // final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(index == 0) {
      context.pop();
      context.read<ServiceCubit>().updateIndex(0);
      context.read<OrderCubit>().updateOrder('', '', '', '', '', '');
      context.read<OrderCubit>().updatePackage('', '', '', '', '', DateTime.now());
      context.read<OrderCubit>().commentController.clear();
      Future.delayed(Duration(milliseconds: 300), () {
        widget.statefulNavigationShell.goBranch(
          2,
          initialLocation: true,
        );
      });
    } else if(index == 1) {
      context.pop();
      context.push('/main/market');
    } else {
      context.pop();
      context.pushNamed('profile');
    }
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        key: context.read<OnlyNavBarCubit>().scaffoldGlobalKey,
        backgroundColor: AppColors.white,
        drawer: Drawer(
          backgroundColor: AppColors.white,
          child: Column(
            children: [
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/heart.png',
                      width: 39,
                      height: 32,
                      color: AppColors.main,
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text(
                          'RE',
                          style: AppTextStyles.body16UnboundedSemiBold
                              .copyWith(color: AppColors.accent),
                        ),
                        Text(
                          'ЛАВ',
                          style: AppTextStyles.body16UnboundedSemiBold
                              .copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 1,
                width: 310,
                decoration: BoxDecoration(color: AppColors.shade1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 24),
                child: Column(
                  children: [
                    _buildDrawerItem(
                      context,
                      asset: Assets.iconsActiveTruck,
                      text: 'Услуги',
                      onTap: () => _onItemTapped(0),
                    ),
                    const SizedBox(height: 24),
                    _buildDrawerItem(
                      context,
                      asset: Assets.iconsActiveMarket,
                      text: 'Маркет',
                      onTap: () => _onItemTapped(1),
                    ),
                    const SizedBox(height: 24),
                    _buildDrawerItem(
                      context,
                      asset: Assets.iconsActiveProfile,
                      text: 'Профиль',
                      onTap: () => _onItemTapped(2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: widget.statefulNavigationShell,
          bottomNavigationBar: CustomNavigationBar(
            statefulNavigationShell: widget.statefulNavigationShell,
          ),
      ),
    );
  }
  
  Widget _buildDrawerItem(BuildContext context, {required String asset, required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
