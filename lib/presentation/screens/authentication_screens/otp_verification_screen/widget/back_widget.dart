import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const Icon(
          Icons.arrow_back,
          size: 24,
          color: AppColors.accent,
          weight: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Назад',
            style: theme.textTheme.displayMedium?.copyWith(
              color: const Color.fromARGB(255, 22, 21, 23),
            ),
          ),
        )
      ],
    );
  }
}