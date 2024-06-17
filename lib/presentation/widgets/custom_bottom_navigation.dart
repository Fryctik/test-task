import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/themes/themes.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 57,
      color: AppColors.white,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBottomNavItem(0 == selectedIndex ? Assets.tabBarActiveHome: Assets.tabBarDefaultHome, 'Главная', 0,
              selectedIndex, context, () {
                setState(() {
                  selectedIndex = 0;
                });
              }),
          _buildBottomNavItem(1 == selectedIndex? Assets.iconsActiveHistory: Assets.tabBarDefaultHistory, 'История', 1,
              selectedIndex, context, () {
                setState(() {
                  selectedIndex = 1;
                });
              }),
          _buildBottomNavItem(2 == selectedIndex ? Assets.tabBarPlusBottom: Assets.tabBarPlusBottom, 'Заказать', 2,
            selectedIndex, context, () {
                setState(() {
                  selectedIndex = 2;
                });

              }),
          _buildBottomNavItem(3 == selectedIndex ? Assets.tabBarActiveMessages: Assets.tabBarDefaultMessage, 'Чат', 3,
              selectedIndex, context, () {
                setState(() {
                  selectedIndex = 3;
                });
              }, badge: 1),
          _buildBottomNavItem(4 == selectedIndex ? Assets.tabBarActiveRewards: Assets.tabBarDefaultReward, 'Достижения', 4,
              selectedIndex, context, () {
                setState(() {
                  selectedIndex = 4;
                });
              }),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(String icon, String label, int itemIndex,
      int selectedIndex, BuildContext context, Function changeNavigation,
      {int? badge}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          changeNavigation();

        },
        child: Container(
            height: 40,
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
             alignment: Alignment.bottomCenter,
            children: [
              Text(
                label,
                style: AppTextStyles.body11GeologicaRegular.copyWith(
                  color:
                  selectedIndex == itemIndex ? AppColors.main : AppColors.shade3,
                ),
              ),
              Positioned(
                 bottom: itemIndex==2?23 : 18,
                child: Container(
                  margin:
                  badge != null ? const EdgeInsets.only(left: 10, right: 10) : null,
                  decoration: itemIndex == 2? BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent
                  ): null,
                  clipBehavior: Clip.none,
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          icon,
                          height: itemIndex == 2? 40: 24,
                          width: itemIndex == 2? 40: 24,
                          fit: BoxFit.scaleDown,
                        ),
                        if (badge != null && badge != 0)
                          Positioned(
                            top: -10,
                            right: -10,
                            child: Container(
                              alignment: Alignment.center,
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: AppColors.red, shape: BoxShape.circle),
                              child: Text(
                                '$badge',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Colors.white,
                                    height: 0),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}



