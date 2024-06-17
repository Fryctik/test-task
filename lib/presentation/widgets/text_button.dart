import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CustomNewsTariffInstrc extends StatefulWidget {
  @override
  _CustomNewsTariffInstrcState createState() => _CustomNewsTariffInstrcState();
}

class _CustomNewsTariffInstrcState extends State<CustomNewsTariffInstrc> {
  List<int> _selectedButtonIndexes = [-1, -1, -1];

  void _onButtonTapped(int column, int index) {
    setState(() {
      if (_selectedButtonIndexes[column] == index) {
        _selectedButtonIndexes[column] = -1; // Deselect if tapped again
      }
      /// Deselect previously selected button
      // else {
      //   if (_selectedButtonIndexes[column] != -1) {
      //     _selectedButtonIndexes[column] = -1;
      //   }
      //   _selectedButtonIndexes[column] = index;
      // }
      _selectedButtonIndexes[column] = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
              (columnIndex) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => GestureDetector(
                onTap: () => _onButtonTapped(columnIndex, index),
                child: Column(
                  children: [
                   columnIndex == 0 || columnIndex == 1? Text(
                      columnIndex == 0 ?"Новости" : "Тарифы",
                      style: AppTextStyles.body16GeologicaSemiBold.copyWith(color: _selectedButtonIndexes[columnIndex] == index ?AppColors.black : AppColors.shade2)
                    ) : Text("Инструкция",style: AppTextStyles.body16GeologicaSemiBold.copyWith(color: _selectedButtonIndexes[columnIndex] == index ?AppColors.black : AppColors.shade2)
                   ),
                    SizedBox(height: 4),
                    Container(
                      height: columnIndex == 0 ? 3 :2,
                      decoration: BoxDecoration(
                        borderRadius: columnIndex == 0 ? BorderRadius.only(topRight: Radius.circular(100),topLeft: Radius.circular(100)) : BorderRadius.circular(100),
                        color: _selectedButtonIndexes[columnIndex] == index
                            ? AppColors.main
                            : Colors.transparent,
                      ),
                      width: 105,
                   
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
