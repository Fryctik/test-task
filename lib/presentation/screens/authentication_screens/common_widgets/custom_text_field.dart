import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/presentation/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.isValid = true,
    super.key,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: AppColors.main,
      textCapitalization: TextCapitalization.sentences,
      style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: isValid
              ? const BorderSide(
                  color: AppColors.main,
                  width: 1,
                )
              : BorderSide.none,
        ),
        fillColor: isValid ? AppColors.shade1 : AppColors.softRed,
        contentPadding: const EdgeInsetsDirectional.all(16),
        filled: true,
      ),
    );
  }
}
