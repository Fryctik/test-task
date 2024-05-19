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
  String _selectedItem = 'Выбрать';

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
        Container(
          width: double.infinity,
          height: 52,
          padding: const EdgeInsets.only(left: 16).copyWith(right: 14),
          decoration: BoxDecoration(
            color: AppColors.shade1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            focusColor: AppColors.shade1,
            items:
                <String>['Выбрать', 'Мужской', 'Женский'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  child: Text(value),
                ),
              );
            }).toList(),
            value: _selectedItem,
            onChanged: (newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
            },
            isExpanded: true,
            dropdownColor: AppColors.shade1,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              weight: 2,
            ),
            iconDisabledColor: AppColors.shade3,
            underline: Container(),
          ),
        )
      ],
    );
  }
}