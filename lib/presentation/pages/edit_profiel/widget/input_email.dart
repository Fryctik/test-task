import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_text_styles.dart';


import '../../../../../config/contstants/app_colors.dart';


class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget({
    super.key,
    required this.emailController,
    required this.onSubmitted,
    required this.isEmailValid, required this.focusNode,
  });
  final FocusNode focusNode;
  final bool isEmailValid;
  final TextEditingController emailController;
  final Function(String)? onSubmitted;

  @override
  State<InputEmailWidget> createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {

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
                style: AppTextStyles.body16UnboundedMedium.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '*',
                style: AppTextStyles.body16UnboundedMedium.copyWith(
                  color: AppColors.red,
                ),
                ),

            ],
          ),
        ),

        TextField(
          focusNode: widget.focusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          controller: widget.emailController,
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(color: widget.isEmailValid? AppColors.black : AppColors.red ),
          decoration:  InputDecoration(
            hintText: "alina@mail.ru",
            hintStyle: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isEmailValid? BorderSide(
                color: AppColors.main,
                width: 1,
              ): BorderSide.none
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:  BorderSide(
                color: AppColors.main,
                width: 1,),

            ),
            fillColor: widget.isEmailValid ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isEmailValid ? SizedBox.shrink(): Container(
          margin: EdgeInsets.only(top: 8,),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Неправильный Email', style: AppTextStyles.body14GeologicaLight.copyWith(
              color: AppColors.red,
            ),
            ),
          ),
        ),
      ],
    );
  }
}