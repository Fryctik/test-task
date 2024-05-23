import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/presentation/theme/theme.dart';
import 'package:test/presentation/widgets/custom_text_field.dart';

class InputBirthdayWidget extends StatefulWidget {
  const InputBirthdayWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<InputBirthdayWidget> createState() => _InputBirthdayWidgetState();
}

class _InputBirthdayWidgetState extends State<InputBirthdayWidget> {
  final TextEditingController _birthdayController = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(
    mask: '##.##.##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            'ДАТА РОЖДЕНИЯ',
            style: widget.theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        CustomTextField(
          controller: _birthdayController,
          keyboardType: TextInputType.number,
          inputFormatters: [DateTextFormatter()],
        ),
        // TextFormField(
        //   controller: _birthdayController,
        //   keyboardType: TextInputType.number,
        //   textCapitalization: TextCapitalization.sentences,
        //   cursorColor: AppColors.main,
        //   style: widget.theme.textTheme.bodyMedium
        //       ?.copyWith(color: AppColors.black),
        //   inputFormatters: [DateTextFormatter()],
        //   decoration: const InputDecoration(
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(20)),
        //       borderSide: BorderSide.none,
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(20)),
        //       borderSide: BorderSide(
        //         color: AppColors.main,
        //         width: 1,
        //       ),
        //     ),
        //     fillColor: AppColors.shade1,
        //     contentPadding: EdgeInsetsDirectional.all(16),
        //     filled: true,
        //   ),
        // )
      ],
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 6;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '.');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

