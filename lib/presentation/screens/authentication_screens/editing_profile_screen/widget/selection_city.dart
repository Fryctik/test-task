import 'package:flutter/material.dart';
import 'package:test/presentation/screens/common_widgets/common_dropdown.dart';
class SelectionCityWidget extends StatefulWidget {
  const SelectionCityWidget({
    super.key,
    required this.theme,
    required this.onSelectionChanged,
  });

  final ThemeData theme;
  final Function(bool) onSelectionChanged;
  @override
  State<SelectionCityWidget> createState() => _SelectionCityWidgetState();
}

typedef ChangeThemeCallback = void Function(bool isSelected);

class _SelectionCityWidgetState extends State<SelectionCityWidget> {
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
      ],
    );
  }
}
