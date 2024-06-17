import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_text_styles.dart';

import '../../../../../config/contstants/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Добро пожаловать в ',
                style: AppTextStyles.body16GeologicaSemiBold.copyWith(
                  color: AppColors.mainSoft,
                ),
              ),
              Text(
                'Re',
                style: AppTextStyles.body16GeologicaSemiBold.copyWith(
                  color: AppColors.accent,
                ),
              ),
              Text(
                'Лав',
                style: AppTextStyles.body16GeologicaSemiBold.copyWith(
                  color: AppColors.mainSoft,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              'Собирай, Сдавай, Сохраняй',
              textAlign: TextAlign.center,
              style: AppTextStyles.body28UnboundedBlack.copyWith(
                color: AppColors.white,
                height: 1.2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              'Управляйте вашими отходами: приложение для организации вывоза'
              ' вторсырья, учета и отслеживания вашего эковклада',
              textAlign: TextAlign.center,
              style: AppTextStyles.body16GeologicaLight.copyWith(
                color: AppColors.mainSoft,
              ),
            ),
          )
        ],
      ),
    );
  }
}