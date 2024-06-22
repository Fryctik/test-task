import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/config/contstants/app_text_styles.dart';

import '../../../../../config/contstants/app_colors.dart';

class InputBirthdayWidget extends StatefulWidget {
  const InputBirthdayWidget({
    super.key,
    required this.isValidBirthday,
    required this.birthdayController,
    required this.isValidBirthdayText,
    // required this.focusNode,
  });
  // final FocusNode focusNode;
  final TextEditingController birthdayController;
  final bool isValidBirthday;
  final String isValidBirthdayText;

  @override
  State<InputBirthdayWidget> createState() => _InputBirthdayWidgetState();
}

class _InputBirthdayWidgetState extends State<InputBirthdayWidget> {
  final maskFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  String _validateDate(String value) {
    List<String> parts = value.split('.');
    int day = int.tryParse(parts[0])!;
    int month = int.tryParse(parts[1])!;
    int year = int.tryParse(parts[2])!;

    if (day == null ||
        day < 1 ||
        day > 31 ||
        month == null ||
        month < 1 ||
        month > 12 ||
        year == null ||
        year <= 1900 ||
        year <= 2024) {
      return 'Invalid date';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            'ДАТА РОЖДЕНИЯ',
            style: AppTextStyles.body16UnboundedMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        TextFormField(
          //            focusNode: widget.focusNode,
          textInputAction: TextInputAction.next,
          controller: widget.birthdayController,
          keyboardType: TextInputType.datetime,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: AppColors.main,
          style: AppTextStyles.body16GeologicaLight
              .copyWith(color: AppColors.black),
          inputFormatters: [
            maskFormatter,
          ],
          decoration: InputDecoration(
            hintText: "20.04.2004",
            hintStyle: AppTextStyles.body16GeologicaLight
                .copyWith(color: AppColors.shade3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: !widget.isValidBirthday
                  ? BorderSide(
                      color: AppColors.main,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            fillColor:
                widget.isValidBirthday ? AppColors.softRed : AppColors.shade1,
            filled: true,
          ),
        ),
        widget.isValidBirthday
            ? Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  widget.isValidBirthdayText,
                  style: AppTextStyles.body14GeologicaLight.copyWith(
                    color: AppColors.red,
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
