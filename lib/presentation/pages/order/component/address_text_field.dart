import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class AddressTextField extends StatefulWidget {
  const AddressTextField(
      {super.key,
      required this.addressController,
      this.onSubmitted,
      required this.isValidateAddress,
      required this.focusNode});

  final TextEditingController addressController;
  final Function(String)? onSubmitted;
  final bool isValidateAddress;
  final FocusNode focusNode;
  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
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
          controller: widget.addressController,
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
                  widget.isValidateAddress ? AppColors.black : AppColors.red),

          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: widget.isValidateAddress
                  ? BorderSide(
                      color: AppColors.main,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            fillColor:
                widget.isValidateAddress ? AppColors.shade1 : AppColors.softRed,
            filled: true,
          ),
          onSubmitted: widget.onSubmitted,
        ),
        widget.isValidateAddress
            ? SizedBox.shrink()
            : Container(
                margin: EdgeInsets.only(
                  top: 8,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Введите адрес',
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
