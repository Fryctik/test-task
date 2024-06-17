import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';
import 'package:test/themes/themes.dart';

enum ServiceStatus{
  active,
  inactive,
  disabled,
}

class CustomMenuButton extends StatefulWidget {
  CustomMenuButton({super.key, required this.serviceStatus});

  final ServiceStatus serviceStatus;
  @override
  State<CustomMenuButton> createState() => _CustomMenuButtonState();
}

class _CustomMenuButtonState extends State<CustomMenuButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child:SizedBox(
        height: 24.h,
        width: 92.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(widget.serviceStatus == ServiceStatus.active? Assets.iconsActiveTruck : Assets.iconsDisabledTruck, height: 24.h,width: 24.w,),
            Text(AppStrings.uslugi,style: AppTextStyles.body16GeologicaLight.copyWith(color: widget.serviceStatus == ServiceStatus.active ? AppColors.black : AppColors.shade3),)
          ],
        ),
      ),
    );
  }
}
