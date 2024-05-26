
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/common_widgets/common_dropdown.dart';
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
        const CommonDropdown(items: ['Мужской', 'Женский']),
      ],
    );
  }
}
