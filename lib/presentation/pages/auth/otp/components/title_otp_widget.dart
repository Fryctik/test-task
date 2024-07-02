import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import '../../../../../config/contstants/app_colors.dart';


class TitleOtpWidget extends StatelessWidget {
  const TitleOtpWidget({
    super.key,
  });


  String formatPhoneNumber(String phoneNumber) {
    // Remove all non-numeric characters except the plus sign
    String cleaned = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    // Define the desired format
    String formatted = cleaned.replaceFirstMapped(
      RegExp(r'(\+7)(\d{3})(\d{3})(\d{2})(\d{2})'),
          (Match match) => '${match[1]} ${match[2]} ${match[3]}-${match[4]}-${match[5]}',
    );

    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:  10.w, right: 10.w, ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              'Введите код',
              textAlign: TextAlign.center,
              style: AppTextStyles.body32UnboundedSemiBold.copyWith(
                color: AppColors.black
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Мы отправили СМС с кодом подтверждения на ваш номер '
                  '${formatPhoneNumber(context.read<ProfileCubit>().state.phoneNumber)}',

              textAlign: TextAlign.center,
              style: AppTextStyles.body16GeologicaLight.copyWith(
                color: AppColors.shade3,
                height: 1.2
              ),
            ),
          ),
        ],
      ),
    );
  }
}