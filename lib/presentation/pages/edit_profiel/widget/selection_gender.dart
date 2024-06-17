import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/presentation/widgets/custom_check.dart';

import '../../../../../config/contstants/app_colors.dart';



class SelectionGenderWidget extends StatefulWidget {
  const SelectionGenderWidget({
    super.key,
    required this.selectedItem, required this.onTap, required this.isError,
  });
  final String selectedItem;
  final void Function(String item) onTap;
  final bool isError;

  @override
  State<SelectionGenderWidget> createState() => _SelectionGenderWidgetState();
}

class _SelectionGenderWidgetState extends State<SelectionGenderWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            'ПОЛ',
            style: AppTextStyles.body16UnboundedMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),

        CustomDropdown(isError: widget.isError, selectedItem: widget.selectedItem, onTap: widget.onTap, customList: gendersList,),

      ],
    );
  }
}