import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class CartBadge extends StatelessWidget {
  final int itemCount;

  const CartBadge({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        SvgPicture.asset(
          Assets.iconsActiveCart,
          height: 24,
          width: 24,
          fit: BoxFit.cover,
        ),
        if (itemCount > 0)
          Positioned(
            bottom: 15,
            right:  -1,
            child: Container(
              height: 14,
              width: 14,
              decoration:
                  BoxDecoration(
                    border: Border.all(width: 1.5,color: AppColors.white),
                      color: AppColors.main, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  '$itemCount',
                  style: AppTextStyles.body9GeologicaExtraLight
                      .copyWith(color: AppColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
