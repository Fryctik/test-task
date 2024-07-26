import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/auth/onboarding/components/text_widget.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

import '../components/logo_widget.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return PopScope(
      canPop: false,

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.main,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const LogoWidget(),
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Image.asset(Assets.imageOnboardImage1, width: 390.w, height: 396.h, fit: BoxFit.fitHeight,),
                    ),
                    const TextWidget(),
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                CommonWidgetButton(
                  text: 'ВОЙТИ',
                  colorButton: AppColors.white,
                  textColor: AppColors.main,
                  openPath: () {
                      context.pushNamed('identification');
                  }
                ),
                SizedBox(
                  height: 35.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



