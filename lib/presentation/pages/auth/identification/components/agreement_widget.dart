import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import '../../../../../config/contstants/app_colors.dart';


class AgreementText extends StatelessWidget {
  const AgreementText({
    super.key,
    required TextEditingController phoneNumberController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Продолжая, вы соглашаетесь на ',
                style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3)
              ),
              TextSpan(
                text:
                    'сбор,\n обработку и хранение персональных данных',
                recognizer: TapGestureRecognizer()..onTap = () {
                  //TODO push to agreement screen
                },
                style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accent,)
              )
            ],
          ),
        ),
      ],
    );
  }
}