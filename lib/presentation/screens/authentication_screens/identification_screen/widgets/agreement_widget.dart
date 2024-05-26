import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';
import 'package:test/presentation/screens/common_widgets/common_button.dart';
import 'package:test/presentation/theme/theme.dart';

class AgreementWidget extends StatelessWidget {
  const AgreementWidget({
    super.key,
    required TextEditingController phoneNumberController,
  }) : _phoneNumberController = phoneNumberController;

  final TextEditingController _phoneNumberController;



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Продолжая, вы соглашаетесь на ',
                style: theme.textTheme.displayMedium?.copyWith(color: AppColors.shade3, height: 18/14)
              ),
              TextSpan(
                text:
                    'сбор,\n обработку и хранение персональных данных',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: theme.textTheme.displayLarge?.copyWith(color: AppColors.accent, height: 18/14)
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CommonWidgetButton(
            text: 'ПОЛУЧИТЬ КОД',
            colorButton: AppColors.main,
            textColor: AppColors.white,
            onTap: () {
              context.router.push(OtpVereficationRoute(number: _phoneNumberController.text));
            },
          ),
        ),
      ],
    );
  }
}