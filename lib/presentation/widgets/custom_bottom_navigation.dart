import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:test/presentation/pages/achievements/manager/achievements_cubit.dart';
import 'package:test/presentation/pages/main/view/usluga/manager/sevice_cubit.dart';
import 'package:test/presentation/pages/only_nav_bar/manager/only_nav_bar_cubit.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';

ScrollController levelScrollController = ScrollController();


class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> with SingleTickerProviderStateMixin{

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  void navigateToOrderPage(BuildContext context) {
    // context.goNamed('/main');
      context.pushNamed('uslugi');
  }


  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewPadding.bottom);
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom > 30 ? 20.h : 10,right: 10),
      height: 57,
      color: AppColors.white,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<OnlyNavBarCubit, OnlyNavBarState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBottomNavItem(0 == state.selectedIndex ? Assets.tabBarActiveHome: Assets.tabBarDefaultHome, 'Главная', 0,
                  state.selectedIndex, context, () {
                    setState(() {
                      if(widget.statefulNavigationShell.currentIndex == 4) {
                        levelScrollController.jumpTo(levelScrollController.position.minScrollExtent);
                      }
                      context.read<OnlyNavBarCubit>().updateIndex(0);
                      animationController.reset();
                      widget.statefulNavigationShell.goBranch(
                        0,
                        initialLocation: 0 == widget.statefulNavigationShell.currentIndex
                      );
                    });
                  }),
              _buildBottomNavItem(1 == state.selectedIndex? Assets.iconsActiveHistory: Assets.tabBarDefaultHistory, 'История', 1,
                  state.selectedIndex, context, () {
                    setState(() {
                      if(widget.statefulNavigationShell.currentIndex == 4) {
                        levelScrollController.jumpTo(levelScrollController.position.minScrollExtent);
                      }
                      context.read<OnlyNavBarCubit>().updateIndex(1);
                      animationController.reset();
                      widget.statefulNavigationShell.goBranch(
                          1,
                          initialLocation: 1 == widget.statefulNavigationShell.currentIndex
                      );
                    });
                  }),
              _buildBottomNavItem(2 == state.selectedIndex ? Assets.tabBarPlusBottom: Assets.tabBarPlusBottom, 'Заказать', 2,
                  state.selectedIndex, context, () {
                    setState(() {
                      if(widget.statefulNavigationShell.currentIndex == 4) {
                        levelScrollController.jumpTo(levelScrollController.position.minScrollExtent);
                      }
                      context.read<OnlyNavBarCubit>().updateIndex(2);
                      animationController.forward().whenComplete(() {
                        animationController.reset();
                        // context.pushNamed('/uslugi');
                        if(context.read<ServiceCubit>().state.selectedIndex == 0) {
                          widget.statefulNavigationShell.goBranch(
                              2,
                              initialLocation: false
                          );
                          context.read<OnlyNavBarCubit>().updateIndex(2);
                          context.read<ServiceCubit>().updateIndex(1);
                          context.pushNamed('more_detail_courier');
                        } else {
                          widget.statefulNavigationShell.goBranch(
                              2,
                              initialLocation: false
                          );
                        }
                        // widget.statefulNavigationShell.goBranch(
                        //     0,
                        //     initialLocation: 0 == widget.statefulNavigationShell.currentIndex
                        // );
                        // navigateToOrderPage(context);
                      });
                    });
                  }),
              _buildBottomNavItem(3 == state.selectedIndex ? Assets.tabBarActiveMessages: Assets.tabBarDefaultMessage, 'Чат', 3,
                  state.selectedIndex, context, () {
                    setState(() {
                      if(widget.statefulNavigationShell.currentIndex == 4) {
                        levelScrollController.jumpTo(levelScrollController.position.minScrollExtent);
                      }
                      context.read<OnlyNavBarCubit>().updateIndex(3);
                      animationController.reset();
                      widget.statefulNavigationShell.goBranch(
                          3,
                          initialLocation: 3 == widget.statefulNavigationShell.currentIndex
                      );
                    });
                  }, badge: 1),
              _buildBottomNavItem(4 == state.selectedIndex ? Assets.tabBarActiveRewards: Assets.tabBarDefaultReward, 'Достижения', 4,
                  state.selectedIndex, context, () {
                    setState(() {
                      context.read<AchievementsCubit>().updateAchievementIndex(2);
                      Future.delayed(Duration(milliseconds: 200), () {
                        context.read<OnlyNavBarCubit>().updateIndex(4);
                        animationController.reset();
                        widget.statefulNavigationShell.goBranch(
                            4,
                            initialLocation: true
                          // initialLocation: 4 == widget.statefulNavigationShell.currentIndex
                        );
                      });
                    });
                  }),
            ],
          );
        }
      ),
    );
  }

  Widget _buildBottomNavItem(String icon, String label, int itemIndex,
      int selectedIndex, BuildContext context, Function changeNavigation,
      {int? badge}) {
    if(itemIndex == 2) {
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
                    selectedIndex == itemIndex ? AppColors.main : AppColors.shade2,
                  ),
                ),
                Positioned(
                  bottom: itemIndex==2?23 : 18,
                  child:  Container(
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
                ).animate(
                  controller: animationController,
                  autoPlay: false
                ).scale(
                  begin: Offset(1, 1),
                  end: Offset(1.2, 1.2),
                ),


              ],
            ),
          ),
        ),
      );
    }
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
                  selectedIndex == itemIndex ? AppColors.main : AppColors.shade2,
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



