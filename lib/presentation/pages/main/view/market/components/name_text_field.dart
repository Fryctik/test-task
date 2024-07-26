import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key, required this.nameController, this.onSubmitted, required this.isValidateName, required this.focusNode});
  final TextEditingController nameController;
  final Function(String)? onSubmitted;
  final bool isValidateName;
  final FocusNode focusNode;
  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          autocorrect: false,
          enableSuggestions: false,
          textInputAction: TextInputAction.done,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.name,
          controller: widget.nameController,
          contextMenuBuilder: (context, state) {
            return SizedBox();
          },
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]')),
          // ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(color: widget.isValidateName? AppColors.black : AppColors.red ),

          onChanged: (value) {},
          decoration:  InputDecoration(
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
