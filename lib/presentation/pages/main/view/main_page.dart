import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/view/home_page.dart';
import '../../../../config/contstants/app_colors.dart';
import '../../../widgets/custom_bottom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: AppColors.white,
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
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
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 1,
                width: 310,
                decoration: BoxDecoration(color: AppColors.shade1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsDisabledTruck),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Услуги',
                          style: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsDefaultMarket),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Маркет',
                          style: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.iconsDefaultProfile),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Профиль',
                          style: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                        ),
                      ],
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
                physics: NeverScrollableScrollPhysics(),
                key: UniqueKey(),
                children: [
                  HomePage(),
                ],
              ),
            ),
            CustomNavigationBar(),
          ],
        ));
  }
}
