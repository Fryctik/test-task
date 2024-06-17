import 'package:flutter/material.dart';

import '../../../config/contstants/app_colors.dart';

//TODO
class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

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
    return Column(
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
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.main,
          style: widget.theme.textTheme.bodyMedium
              ?.copyWith(color: AppColors.black),
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