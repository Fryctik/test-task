import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onBack, this.isOrder});
  final Function() onBack;
  final bool? isOrder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack,
      child: Row(
        children: [
            SvgPicture.asset(Assets.iconsBackButtonAccent,height: 24,width: 24,fit: BoxFit.cover,),
            Text(isOrder == true? "Все услуги": "Назад",style: AppTextStyles.body14GeologicaLight,),
        ],
      ),
    );
  }
}
