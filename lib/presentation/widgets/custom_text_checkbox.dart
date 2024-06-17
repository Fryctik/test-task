import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CustomTextCheckbox extends StatefulWidget {
  @override
  _CustomTextCheckboxState createState() => _CustomTextCheckboxState();
}

class _CustomTextCheckboxState extends State<CustomTextCheckbox> {
  int _selectedIndex = -1; // Initially, no row is selected

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152,
      width: 390,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Row(
              children: [
                Checkbox(
                  value: _selectedIndex == index,
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  hoverColor: AppColors.accent,
                  activeColor:  AppColors.shade1,
                  side: BorderSide(width: 1, color: AppColors.shade1,),
                  checkColor: AppColors.main,
                ),
                Text(
                  'Лично передам пакеты курьеру',
                  style: AppTextStyles.body16GeologicaLight.copyWith(color: _selectedIndex == index ? AppColors.black : AppColors.shade3,),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
