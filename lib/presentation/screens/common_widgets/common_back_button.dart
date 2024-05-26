import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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
            style:
                theme.textTheme.displayMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
