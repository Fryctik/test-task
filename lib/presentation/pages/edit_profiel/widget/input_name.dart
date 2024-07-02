import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/config/contstants/app_text_styles.dart';

import '../../../../../config/contstants/app_colors.dart';


class InputNameWidget extends StatelessWidget {
  const InputNameWidget({
    super.key,
  });



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
                style: AppTextStyles.body16UnboundedMedium.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '*',
                style: AppTextStyles.body16UnboundedMedium.copyWith(
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
          style: AppTextStyles.body16GeologicaLight,
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