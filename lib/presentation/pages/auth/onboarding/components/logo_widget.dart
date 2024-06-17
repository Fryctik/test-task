import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/heart.png', width: 40.w, height: 33.33.h,),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              children: [
                Text(
                  'RE',
                  style: AppTextStyles.body22UnboundedBlack.copyWith(
                    color: AppColors.accent
                  ),
                ),
                Text(
                  'ЛАВ',
                  style: AppTextStyles.body22UnboundedBlack.copyWith(color: AppColors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
