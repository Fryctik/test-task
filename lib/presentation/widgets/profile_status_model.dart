import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';



class BadgeItem {
  final String img;
  final String text;
  final Color color;
  final List<Color> gradient;
  BadgeItem(this.gradient, {required this.img, required this.text, required this.color});
}

class BadgeWidget extends StatelessWidget {
  final BadgeItem badge;

  BadgeWidget({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 130.h),
      child: Center(
        child: Container(
          width: 200,
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
            border:GradientBoxBorder(
              gradient: LinearGradient(colors: badge.gradient)
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(badge.img,colorFilter: ColorFilter.mode(badge.color, BlendMode.srcIn),),
              SizedBox(width: 10),
              Text(
                badge.text,
                style: AppTextStyles.body14GeologicaLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}