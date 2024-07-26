import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/config/contstants/app_text_styles.dart';

import '../../config/contstants/app_colors.dart';
import '../../themes/themes.dart';

class CustomNumTextfield extends StatefulWidget {
  CustomNumTextfield({super.key, required this.focusNode, required this.phoneNumberController, required this.isValidPhoneNumber, required this.isNumberValidInputed, required this.onChange, required this.onSubmitted});

  final FocusNode focusNode;
  final TextEditingController phoneNumberController;
  bool isValidPhoneNumber;
  bool isNumberValidInputed;
  Function(String)? onChange;
  Function(String)? onSubmitted;

  @override
  State<CustomNumTextfield> createState() => _CustomNumTextfieldState();
}

class _CustomNumTextfieldState extends State<CustomNumTextfield> {

  final maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              contextMenuBuilder: (context, state) {
                return SizedBox();
              },
              controller: widget.phoneNumberController,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              inputFormatters: [maskFormatter],
              cursorColor: AppColors.main,
              style: AppTextStyles.body16GeologicaLight.copyWith(
                color: widget.isValidPhoneNumber
                    ? AppColors.black
                    : AppColors.red,
              ),
              onChanged: widget.onChange,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
              prefixText: "+7 ",
                prefixStyle: AppTextStyles.body16GeologicaLight.copyWith(color: widget.isValidPhoneNumber ? AppColors.shade1: AppColors.softRed,),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  borderSide:  widget.isNumberValidInputed ? BorderSide.none:BorderSide(width: 1,color: AppColors.main),
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
                fillColor: widget.isValidPhoneNumber
                    ? AppColors.shade1
                    : AppColors.softRed,
                filled: true,
                suffixIcon: widget.isNumberValidInputed
                    ? const Icon(
                  Icons.check,
                  size: 24,
                  color: AppColors.accent,
                  weight: 3,
                )
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 12 ),
              child: Text("+7",style: AppTextStyles.body16GeologicaLight.copyWith(
                color:  widget.isValidPhoneNumber? widget.phoneNumberController.text.isEmpty? AppColors.shade3: AppColors.black: AppColors.red,
              ),
              ),
            )
          ],
        ),

        widget.isValidPhoneNumber ? SizedBox.shrink(): Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Text('Неправильный номер', style: AppTextStyles.body14GeologicaLight.copyWith(
            color: AppColors.red,
          ),
          ),
        ),
      ],
    );
  }
}
