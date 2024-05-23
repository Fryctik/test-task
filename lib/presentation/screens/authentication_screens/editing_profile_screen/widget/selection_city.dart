import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/authentication_screens/common_widgets/common_dropdown.dart';
import 'package:test/presentation/theme/theme.dart';

class SelectionCityWidget extends StatefulWidget {
  const SelectionCityWidget({
    super.key,
    required this.theme, required this.onSelectionChanged,
  });

  final ThemeData theme;
  final Function(bool) onSelectionChanged;
  @override
  State<SelectionCityWidget> createState() => _SelectionCityWidgetState();
}

typedef ChangeThemeCallback = void Function(bool isSelected);

class _SelectionCityWidgetState extends State<SelectionCityWidget> {
  String? _selectedItem;
  bool _isOpen = false;
  bool _isSelected = true;

  void changeSelection(bool isSelected) {
    setState(() {
      _isSelected = isSelected;
      widget.onSelectionChanged(_isSelected);
    });
  }

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
                style: widget.theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                '*',
                style: widget.theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const CommonDropdown(items: ['Мытищи', 'Королев', 'Москва']),
        // DropdownButton2<String>(
        //   // isDense: true,
        //   items: <String>['Мытищи', 'Королев', 'Москва']
        //       .map(
        //         (item) => DropdownMenuItem<String>(
        //           value: item,
        //           child: Text(
        //             item,
        //             style: theme.textTheme.bodyMedium?.copyWith(
        //               color: _selectedItem == item ? AppColors.black : AppColors.shade3,
        //             ),
        //           ),
        //         ),
        //       )
        //       .toList(),
        //   onChanged: (value) {
        //     setState(() {
        //       _selectedItem = value as String;
        //
        //     });
        //   },
        //   value: _selectedItem,
        //
        //   isExpanded: true,
        //   hint: Text(
        //     'Выбрать',
        //     style: _isOpen
        //         ? widget.theme.textTheme.bodyMedium
        //             ?.copyWith(color: AppColors.black)
        //         : widget.theme.textTheme.bodyMedium
        //             ?.copyWith(color: _isSelected ?AppColors.shade3 : AppColors.red),
        //   ),
        //
        //   iconStyleData: IconStyleData(
        //     icon: Icon(
        //       Icons.keyboard_arrow_down_outlined,
        //       weight: 2,
        //       color: _isSelected ?AppColors.shade3 : AppColors.red,
        //     ),
        //     iconSize: 24,
        //     openMenuIcon: const Icon(
        //       Icons.keyboard_arrow_up_outlined,
        //       weight: 2,
        //       color: AppColors.black,
        //     ),
        //   ),
        //   underline: const SizedBox(),
        //   onMenuStateChange: (isOpen) {
        //     setState(() {
        //       _isOpen = !_isOpen;
        //       _isSelected = true;
        //     });
        //   },
        //   dropdownStyleData: const DropdownStyleData(
        //     elevation: 0,
        //     decoration: BoxDecoration(
        //         border: Border(
        //           bottom: BorderSide(color: AppColors.main),
        //           left: BorderSide(color: AppColors.main),
        //           right: BorderSide(color: AppColors.main),
        //         ),
        //         borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(20),
        //             bottomRight: Radius.circular(20)),
        //         color: AppColors.shade1,
        //         backgroundBlendMode: null,),
        //   ),
        //   buttonStyleData: ButtonStyleData(
        //     height: 52,
        //     padding: const EdgeInsets.only(right: 14),
        //     decoration: BoxDecoration(
        //       color: _isSelected ?AppColors.shade1 : AppColors.softRed,
        //       border: _isOpen
        //           ? const Border(
        //               top: BorderSide(color: AppColors.main),
        //               left: BorderSide(color: AppColors.main),
        //               right: BorderSide(color: AppColors.main),
        //             )
        //           : null,
        //       borderRadius: _isOpen
        //           ? const BorderRadius.only(
        //               topLeft: Radius.circular(20),
        //               topRight: Radius.circular(20),
        //             )
        //           : BorderRadius.circular(20),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
