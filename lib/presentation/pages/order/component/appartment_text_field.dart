import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class AppartmentTextField extends StatefulWidget {
  const AppartmentTextField(
      {super.key,
      required this.appartmentController,
      this.onSubmitted,
      required this.isValidateAppartment,
      required this.focusNode});

  final TextEditingController appartmentController;
  final Function(String)? onSubmitted;
  final bool isValidateAppartment;
  final FocusNode focusNode;
  @override
  State<AppartmentTextField> createState() => _AppartmentTextFieldState();
}

class _AppartmentTextFieldState extends State<AppartmentTextField> {
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
          controller: widget.appartmentController,
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
                  widget.isValidateAppartment ? AppColors.black : AppColors.red),

          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidateAppartment
                  ? BorderSide(
                      color: AppColors.main,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            fillColor:
                widget.isValidateAppartment ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidateAppartment
            ? SizedBox(height: 25,)
            : Container(
          height: 17,
                margin: EdgeInsets.only(
                  top: 8,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Введите квартиру',
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
