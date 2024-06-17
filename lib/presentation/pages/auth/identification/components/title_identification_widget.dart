import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_text_styles.dart';

import '../../../../../config/contstants/app_colors.dart';


class TitleIdentificationWidget extends StatelessWidget {
  const TitleIdentificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Text(
            'Вход\n и регистрация',
            textAlign: TextAlign.center,
            style: AppTextStyles.body32UnboundedSemiBold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Text(
            'Для получения кода введите \n свой номер телефона',
            textAlign: TextAlign.center,
            style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
          ),
        )
      ],
    );
  }
}
