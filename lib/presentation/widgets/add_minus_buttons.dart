import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class AddMinusButtons extends StatefulWidget {
  const AddMinusButtons({super.key});

  @override
  _AddMinusButtonsState createState() => _AddMinusButtonsState();
}

class _AddMinusButtonsState extends State<AddMinusButtons> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 96,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(

            onTap: () {
              _decrementCounter();
            },
            child: Container(
                padding: const EdgeInsets.all(9.5),
              height: 28,
              width: 28,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.shade1),
              child: SvgPicture.asset(Assets.iconsMinus16x16),

            ),
          ),
          Text(
            '$counter',
            style: AppTextStyles.body16GeologicaSemiBold,
          ),
          GestureDetector(

            onTap: () {
              _incrementCounter();
            },
            child: Container(
              padding: const EdgeInsets.all(9.5),
              height: 28,
              width: 28,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColors.shade1),
              child: SvgPicture.asset(Assets.iconsPlus16x16),
            ),
          ),
        ],
      ),
    );
  }
}

