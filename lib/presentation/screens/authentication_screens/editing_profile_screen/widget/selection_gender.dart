import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class SelectionGenderWidget extends StatefulWidget {
  const SelectionGenderWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<SelectionGenderWidget> createState() => _SelectionGenderWidgetState();
}

class _SelectionGenderWidgetState extends State<SelectionGenderWidget> {
  String? _selectedItem;
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            'ПОЛ',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        DropdownButton2<String>(
          // isDense: true,
          items: <String>['Мужской', 'Женский']
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: _selectedItem == item
                          ? AppColors.black
                          : AppColors.shade3,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedItem = value as String;
            });
          },
          value: _selectedItem,

          isExpanded: true,
          hint: Text(
            'Выбрать',
            style: _isOpen
                ? widget.theme.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.black)
                : widget.theme.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.shade3),
          ),

          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              weight: 2,
              color: AppColors.shade3,
            ),
            iconSize: 24,
            openMenuIcon: Icon(
              Icons.keyboard_arrow_up_outlined,
              weight: 2,
              color: AppColors.black,
            ),
          ),
          underline: const SizedBox(),
          onMenuStateChange: (isOpen) {
            setState(() {
              _isOpen = !_isOpen;
            });
          },
          dropdownStyleData: const DropdownStyleData(
            elevation: 0,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.main),
                  left: BorderSide(color: AppColors.main),
                  right: BorderSide(color: AppColors.main),
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: AppColors.shade1,
                backgroundBlendMode: null),
          ),
          buttonStyleData: ButtonStyleData(
            height: 52,
            padding: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              color: AppColors.shade1,
              border: _isOpen
                  ? const Border(
                      top: BorderSide(color: AppColors.main),
                      left: BorderSide(color: AppColors.main),
                      right: BorderSide(color: AppColors.main),
                    )
                  : null,
              borderRadius: _isOpen
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                  : BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
