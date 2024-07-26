import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CityTextField extends StatefulWidget {
  const CityTextField({super.key, required this.cityController, this.onSubmitted, required this.isValidateCity, required this.focusNode});

  final TextEditingController cityController;
  final Function(String)? onSubmitted;
  final bool isValidateCity;
  final FocusNode focusNode;
  @override
  State<CityTextField> createState() => _CityTextFieldState();
}

class _CityTextFieldState extends State<CityTextField> {
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
          controller: widget.cityController,
          contextMenuBuilder: (context, state) {
            return SizedBox();
          },
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]')),
          // ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(color: widget.isValidateCity? AppColors.black : AppColors.red ),

          onChanged: (value) {},
          decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidateCity? BorderSide(
                color: AppColors.main,
                width: 1,
              ): BorderSide.none,
            ),

            fillColor: widget.isValidateCity? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidateCity ? SizedBox.shrink(): Container(
          margin: EdgeInsets.only(top: 8,),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Введите город', style: AppTextStyles.body14GeologicaLight.copyWith(
              color: AppColors.red,
            ),
            ),
          ),
        ),

      ],
    );
  }
}
