import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/chat/view/chat.dart';
import 'package:test/presentation/pages/main/view/custom_service_view.dart';
import 'package:test/presentation/pages/main/view/home_page.dart';
import 'package:test/presentation/pages/main/view/more_details_view.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';
import '../../../../config/contstants/app_colors.dart';
import '../../../widgets/custom_bottom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    asset: Assets.iconsDisabledTruck,
                    text: 'Услуги',
                    onTap: () => _onDrawerItemTapped(1),
                  ),
                  const SizedBox(height: 24),
                  _buildDrawerItem(
                    context,
                    asset: Assets.iconsDefaultMarket,
                    text: 'Маркет',
                    onTap: () => _onDrawerItemTapped(2),
                  ),
                  const SizedBox(height: 24),
                  _buildDrawerItem(
                    context,
                    asset: Assets.iconsDefaultProfile,
                    text: 'Профиль',
                    onTap: () => _onDrawerItemTapped(3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ChatPage(),

                HomePage(),
                CustomService(
                  pageController: _pageController,
                ),
                MoreDetailsView(
                  typeTariff: TypeTariff.courierExport,
                  pageController: _pageController,
                ),
                // Add more pages here
              ],
            ),
          ),
          const CustomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required String asset,
      required String text,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyles.body16GeologicaLight
                .copyWith(color: AppColors.shade3),
          ),
        ],
      ),
    );
  }
}
