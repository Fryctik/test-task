import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget({
    super.key,
    required this.theme,
    required this.formKey,
  });

  final ThemeData theme;
  final GlobalKey<FormState> formKey;
  @override
  State<InputEmailWidget> createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    setState(() {
      _isValid = pattern.hasMatch(_emailController.text);
    });
  }

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
                  'E-MAIL',
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
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                setState(() {
                  _isValid = false;
                });
              }
              return null;
            },
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppColors.main,
            style: widget.theme.textTheme.bodyMedium
                ?.copyWith(color: AppColors.black),
            onChanged: (value) {
              setState(() {
                _isValid = true;
              });
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: _isValid
                    ? const BorderSide(
                        color: AppColors.main,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
              fillColor: _isValid ? AppColors.shade1 : AppColors.softRed,
              contentPadding: const EdgeInsetsDirectional.all(16),
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
