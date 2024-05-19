import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/presentation/theme/theme.dart';

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

  String _validateDate(String value) {
    List<String> parts = value.split('.');
    int day = int.tryParse(parts[0])!;
    int month = int.tryParse(parts[1])!;

    if (day == null ||
        day < 1 ||
        day > 31 ||
        month == null ||
        month < 1 ||
        month > 12) {
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
            style: widget.theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        TextFormField(
          controller: _birthdayController,
          keyboardType: TextInputType.datetime,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: AppColors.main,
          style: widget.theme.textTheme.bodyMedium
              ?.copyWith(color: AppColors.black),
          inputFormatters: [maskFormatter],
          onChanged: (value) {
            _validateDate(value);
          },
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
