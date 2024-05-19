import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать в ',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.mainSoft,
              ),
            ),
            Text(
              'Re',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.accent,
              ),
            ),
            Text(
              'Лав',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.mainSoft,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Собирай, Сдавай, Сохраняй',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Unbounded',
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 255, 255, 255),
              height: 33.6 / 28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            'Управляйте вашими отходами: приложение для организации вывоза'
            ' вторсырья, учета и отслеживания вашего эковклада',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.mainSoft,
            ),
          ),
        )
      ],
    );
  }
}