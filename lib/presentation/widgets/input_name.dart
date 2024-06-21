import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/config/contstants/app_text_styles.dart';

import '../../../config/contstants/app_colors.dart';

//TODO
class InputNameWidget extends StatefulWidget {
  const InputNameWidget({
    super.key,
  required this.nameController, this.onSubmitted, required this.isValidateName, required this.focusNode,
  });
  final TextEditingController nameController;
  final Function(String)? onSubmitted;
  final bool isValidateName;
  final FocusNode focusNode;



  @override
  State<InputNameWidget> createState() => _InputNameWidgetState();
}

class _InputNameWidgetState extends State<InputNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 16),
          child: Row(
            children: [
              Text(
                'ВАШЕ ИМЯ ',
                style: AppTextStyles.body16UnboundedMedium.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '*',
                style: AppTextStyles.body16UnboundedMedium.copyWith(
                  color: AppColors.red,
                ),
              )
            ],
          ),
        ),
        TextField(
          textInputAction: TextInputAction.next,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.name,
          controller: widget.nameController,
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]')),
          // ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight,
          onChanged: (value) {},
          decoration:  InputDecoration(
            hintText: "Введите имя",
            hintStyle: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidateName? BorderSide(
                color: AppColors.main,
                width: 1,
              ): BorderSide.none,
            ),

            fillColor: widget.isValidateName ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidateName ? SizedBox.shrink(): Container(
          margin: EdgeInsets.only(top: 8,),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Введите имя', style: AppTextStyles.body14GeologicaLight.copyWith(
              color: AppColors.red,
            ),
            ),
          ),
        ),
      ],
    );
  }
}