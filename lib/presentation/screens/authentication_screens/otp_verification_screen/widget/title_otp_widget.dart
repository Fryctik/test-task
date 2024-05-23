import 'package:flutter/material.dart';
import 'package:test/presentation/screens/authentication_screens/otp_verification_screen/otp_veregication.dart';
import 'package:test/presentation/theme/theme.dart';


class TitleOtpWidget extends StatelessWidget {
  const TitleOtpWidget({
    super.key,
    required this.widget,
  });

  final OtpVereficationScreen widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            'Введите код',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: AppColors.black
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Мы отправили СМС с кодом подтверждения на ваш номер \n ${widget.number}',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.shade3,
            ),
          ),
        ),
      ],
    );
  }
}