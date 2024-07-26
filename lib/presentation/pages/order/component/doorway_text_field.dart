import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class DoorWayTextField extends StatefulWidget {
  const DoorWayTextField(
      {super.key,
      required this.doorWayController,
      this.onSubmitted,
      required this.isValidatedoorWay,
      required this.focusNode});

  final TextEditingController doorWayController;
  final Function(String)? onSubmitted;
  final bool isValidatedoorWay;
  final FocusNode focusNode;
  @override
  State<DoorWayTextField> createState() => _DoorWayTextFieldState();
}

class _DoorWayTextFieldState extends State<DoorWayTextField> {
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
          controller: widget.doorWayController,
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
                  widget.isValidatedoorWay ? AppColors.black : AppColors.red),

          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidatedoorWay
                  ? BorderSide(
                      color: AppColors.main,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            fillColor:
                widget.isValidatedoorWay ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidatedoorWay
            ? SizedBox(
                height: 25,
              )
            : Container(
                height: 17,
                margin: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Введите подъезд',
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
