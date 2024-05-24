import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/presentation/theme/theme.dart';
import 'package:test/presentation/screens/authentication_screens/common_widgets/custom_text_field.dart';

class InputNameWidget extends StatefulWidget {
  const InputNameWidget({
    super.key,
    required this.theme,
    required this.formKey,
  });

  final ThemeData theme;
  final GlobalKey<FormState> formKey;

  @override
  State<InputNameWidget> createState() => _InputNameWidgetState();
}

class _InputNameWidgetState extends State<InputNameWidget> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Row(
              children: [
                Text(
                  'ВАШЕ ИМЯ ',
                  style: widget.theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  '*',
                  style: widget.theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.red,
                  ),
                )
              ],
            ),
          ),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _isValid = false;
                });
              }
              return null;
            },
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]')),
            ],
            onChanged: (value) {
              setState(() {
                _isValid = true;
              });
            },
            isValid: _isValid,
          ),
          // TextFormField(
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       setState(() {
          //         _isValid = false;
          //       });
          //     }
          //     return null;
          //   },
          //   keyboardType: TextInputType.name,
          //   inputFormatters: [
          //     FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]')),
          //   ],
          //   cursorColor: AppColors.main,
          //   textCapitalization: TextCapitalization.sentences,
          //   style: widget.theme.textTheme.bodyMedium
          //       ?.copyWith(color: AppColors.black),
          //   onChanged: (value) {
          //     setState(() {
          //       _isValid = true;
          //     });
          //   },
          //   decoration: InputDecoration(
          //     enabledBorder: const OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(20)),
          //       borderSide: BorderSide.none,
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: const BorderRadius.all(Radius.circular(20)),
          //       borderSide: _isValid
          //           ? const BorderSide(
          //               color: AppColors.main,
          //               width: 1,
          //             )
          //           : BorderSide.none,
          //     ),
          //     fillColor: _isValid ? AppColors.shade1 : AppColors.softRed,
          //     contentPadding: const EdgeInsetsDirectional.all(16),
          //     filled: true,
          //   ),
          // )
        ],
      ),
    );
  }
}
