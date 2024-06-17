import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/themes/themes.dart';

class CustomButtonUp extends StatelessWidget {
   CustomButtonUp({super.key, this.colorButton,});
   final Color? colorButton;

  @override
  Widget build(BuildContext context) {
    return  Container(

      height: 40.h,
      width: 121.w,
      decoration: BoxDecoration(color: colorButton,borderRadius: BorderRadius.circular(100.r)),
      child: TextButton(onPressed: (){}, child: Row(children: [
            SvgPicture.asset(Assets.iconsArrowUp, height: 24.h, width: 24.w, color: AppColors.white,),
        SizedBox(width: 5.w,),
        Text("Наверх",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.white))
      ],)),
    );
  }
}
