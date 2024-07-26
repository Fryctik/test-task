import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class FloorTextField extends StatefulWidget {
  const FloorTextField(
      {super.key,
      required this.floorController,
      this.onSubmitted,
      required this.isValidateFloor,
      required this.focusNode});

  final TextEditingController floorController;
  final Function(String)? onSubmitted;
  final bool isValidateFloor;
  final FocusNode focusNode;
  @override
  State<FloorTextField> createState() => _FloorTextFieldState();
}

class _FloorTextFieldState extends State<FloorTextField> {
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
          controller: widget.floorController,
          contextMenuBuilder: (context, state) {
            return SizedBox();
          },
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]')),
          // ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(
              color: widget.isValidateFloor ? AppColors.black : AppColors.red),

          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidateFloor
                  ? BorderSide(
                      color: AppColors.main,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            fillColor:
                widget.isValidateFloor ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidateFloor
            ? SizedBox(height: 25,)
            : Container(
          height: 17,
                margin: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Введите этаж',
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
