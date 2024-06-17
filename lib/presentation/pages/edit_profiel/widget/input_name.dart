import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../config/contstants/app_colors.dart';


class InputNameWidget extends StatelessWidget {
  const InputNameWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Row(
            children: [
              Text(
                'ВАШЕ ИМЯ ',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '*',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.red,
                ),
              )
            ],
          ),
        ),
        TextField(
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]')),

          ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.black),
          onChanged: (value) {},
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            fillColor: AppColors.shade1,
            filled: true,
          ),
        )
      ],
    );
  }
}