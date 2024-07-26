import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({super.key, required this.commentController, this.onSubmitted, required this.focusNode});
  final TextEditingController commentController;
  final Function(String)? onSubmitted;
  final FocusNode focusNode;

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          textInputAction: TextInputAction.next,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.name,
          controller: widget.commentController,
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я\s]')),
          // ],
          cursorColor: AppColors.main,
          textCapitalization: TextCapitalization.sentences,
          style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.black ),

          onChanged: (value) {},
          decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide:  BorderSide(
                color: AppColors.main,
                width: 1,
              )
            ),

            fillColor: AppColors.shade1,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
      ],
    );
  }
}
