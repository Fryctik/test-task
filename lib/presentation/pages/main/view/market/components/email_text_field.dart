import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key, required this.focusNode, required this.isEmailValid, required this.emailController, this.onSubmitted});
  final FocusNode focusNode;
  final bool isEmailValid;
  final TextEditingController emailController;
  final Function(String)? onSubmitted;


  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          autocorrect: false,
          enableSuggestions: false,
          contextMenuBuilder: (context, state) {
            return SizedBox();
          },
          focusNode: widget.focusNode,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.name,
          controller: widget.emailController,
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(color: widget.isEmailValid? AppColors.black : AppColors.red ),
          decoration:  InputDecoration(
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
