import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CodeTextField extends StatefulWidget {
  const CodeTextField(
      {super.key,
      required this.codeController,
      this.onSubmitted,
      required this.isValidateCode,
      required this.focusNode});

  final TextEditingController codeController;
  final Function(String)? onSubmitted;
  final bool isValidateCode;
  final FocusNode focusNode;
  @override
  State<CodeTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autocorrect: false,
          enableSuggestions: false,
          textInputAction: TextInputAction.done,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.name,
          controller: widget.codeController,
          contextMenuBuilder: (context, state) {
            return SizedBox();
          },
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]')),
          // ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(
              color:
                  widget.isValidateCode ? AppColors.black : AppColors.red),

          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidateCode
                  ? BorderSide(
                      color: AppColors.main,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            fillColor:
                widget.isValidateCode ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidateCode
            ? SizedBox(height: 25,)
            : Container(
          height: 17,
                margin: EdgeInsets.only(
                  top: 8,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Введите код',
                    style: AppTextStyles.body14GeologicaLight.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
