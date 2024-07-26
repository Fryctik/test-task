import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/generated/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  late AnimationController animationController;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    animationController = AnimationController(vsync: this);
    Future.delayed(Duration(seconds: 2), () {
      animationController.forward();
    });
    Future.delayed(Duration(seconds: 4), () {
      animationController.dispose();
      context.pushReplacementNamed('onboarding');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Center(
        child: Container(
          margin: Platform.isIOS? null: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.bottom> 30 ? 40.h: 0),
          child: Image.asset(Assets.iconsLogoSmall, width: 110, height: 93, fit: BoxFit.fitHeight,)
              .animate(controller: animationController, autoPlay: false, onComplete: (controller) => controller.reverse(),)
              .scale(duration: Duration(seconds: 1), curve: Curves.linear, begin: const Offset(1.0, 1.0), end: const Offset(1.5, 1.5)),
        ),
      ),
    );
  }
}
