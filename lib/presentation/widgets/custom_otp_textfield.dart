import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CustomOtpTextField extends StatefulWidget {
  final int numberOfFields;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onSubmit;
  final FocusNode focusNode;

  const CustomOtpTextField({
    Key? key,
    required this.numberOfFields,
    required this.onCodeChanged,
    required this.onSubmit,
    required this.focusNode,
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
        color: AppColors.shade1,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.shade1,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.shade1,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.main,
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
        onCompleted: widget.onSubmit,
        onSubmitted: (value) {
        },
        keyboardType: TextInputType.number,
        onTapOutside: (point) {
        },
      ),
    );
  }
}
