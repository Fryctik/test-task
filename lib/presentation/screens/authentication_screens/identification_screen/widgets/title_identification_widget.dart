import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class TitleIdentificationWidget extends StatelessWidget {
  const TitleIdentificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Text(
            'Вход\n и регистрация',
            textAlign: TextAlign.center,
            style:
                theme.textTheme.headlineLarge?.copyWith(color: AppColors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Для получения кода введите \n свой номер телефона',
            textAlign: TextAlign.center,
            style:
                theme.textTheme.bodyMedium?.copyWith(color: AppColors.shade3),
          ),
        )
      ],
    );
  }
}
