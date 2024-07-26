import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CustomOtpTextField extends StatefulWidget {
  final String otpNumber;
  final int numberOfFields;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onSubmit;
  final FocusNode focusNode;
  final bool isValid;

  const CustomOtpTextField({
    Key? key,
    required this.otpNumber,
    required this.numberOfFields,
    required this.onCodeChanged,
    required this.onSubmit,
    required this.focusNode, required this.isValid,
  }) : super(key: key);

  @override
  State<CustomOtpTextField> createState() => _CustomOtpTextFieldState();
}

class _CustomOtpTextFieldState extends State<CustomOtpTextField> {



  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 54,
      height: 58,
      textStyle: AppTextStyles.body16UnboundedSemiBold,
      decoration: BoxDecoration(
        color:  widget.isValid? AppColors.shade1 : AppColors.softRed ,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: widget.isValid? AppColors.shade1 : AppColors.softRed,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: widget.isValid? AppColors.shade1 : AppColors.softRed,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color:  widget.isValid? AppColors.main  : AppColors.red,
        ),
      ),
    );

    return Center(
      child: Pinput(
        closeKeyboardWhenCompleted: false,
        autofocus: false,
        focusNode: widget.focusNode,
        length: widget.numberOfFields,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        showCursor: false,
        onChanged: widget.onCodeChanged,
        onCompleted: (value) {widget.onSubmit;},
        onSubmitted: widget.onSubmit,
        keyboardType: TextInputType.number,
        onTapOutside: (point) {
        },
      ),
    );
  }
}
