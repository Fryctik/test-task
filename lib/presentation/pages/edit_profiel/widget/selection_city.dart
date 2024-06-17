import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/presentation/widgets/custom_check.dart';

import '../../../../../config/contstants/app_colors.dart';

class SelectionCityWidget extends StatefulWidget {
  const SelectionCityWidget({
    super.key, required this.selectedItem, required this.onTap, required this.isError,
  });
  final String selectedItem;
  final void Function(String item) onTap;
  final bool isError;


  @override
  State<SelectionCityWidget> createState() => _SelectionCityWidgetState();
}

class _SelectionCityWidgetState extends State<SelectionCityWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Row(
            children: [
              Text(
                'ГОРОД ',
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
        CustomDropdown(isError: widget.isError, selectedItem: widget.selectedItem, customList: citiesList, onTap: widget.onTap,)
      ],
    );
  }
}