import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class SelectionCityWidget extends StatefulWidget {
  const SelectionCityWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<SelectionCityWidget> createState() => _SelectionCityWidgetState();
}

class _SelectionCityWidgetState extends State<SelectionCityWidget> {
  String _selectedItem = 'Выбрать';

  bool _isOpen = false;

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
        DropdownButton2<String>(
          isDense: true,
          items: <String>['Мытищи', 'Королев', 'Москва']
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (value) {},
          isExpanded: true,
          hint: Text(
            'Выбрать',
            style: _isOpen
                ? widget.theme.textTheme.bodyMedium?.copyWith(color: AppColors.black)
                : widget.theme.textTheme.bodyMedium?.copyWith(color: AppColors.shade3),
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
              backgroundBlendMode: null
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: 60,
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