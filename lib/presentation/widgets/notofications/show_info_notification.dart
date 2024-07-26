import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/top_snackbar/custom_snack_bar.dart';
import 'package:test/presentation/widgets/top_snackbar/top_snack_bar.dart';

void showInfoNotification(BuildContext context, String notificationText, double height) {
  return showTopSnackBar(
    Overlay.of(context),
    displayDuration: Duration(milliseconds: 800),
    reverseAnimationDuration: Duration(milliseconds: 600),
    animationDuration: Duration(milliseconds: 600),
    CustomSnackBar.info(
      messagePadding: EdgeInsets.only(left: 50.w, right: 30.w, top: 12, bottom: 12),
      height: height,
      textScaleFactor: 1,
      backgroundColor: AppColors.main,
      maxLines: 5,
      iconPositionLeft: 15,
      iconRotationAngle: 0,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [],
      icon: SvgPicture.asset(
        Assets.iconsMainCaution,
      ),
      textStyle: AppTextStyles.body14GeologicaLight
          .copyWith(color: AppColors.white, height: 18 / 14.sp),
      textAlign: TextAlign.start,
      message: notificationText,
    ),
  );
}