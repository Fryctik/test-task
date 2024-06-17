import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/themes/themes.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required});
  // final String description;
  // final double price;
  // final double kilogram;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: AppColors.white),
      child: Row(
        children: [
          Image.asset(Assets.imageCustomCar),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              width: 202.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Вывоз курьером",
                    style: AppTextStyles.body16GeologicaSemiBold,
                  ),
                  Flexible(
                    child: Text(
                      "Вывезем отсортированное на фракции и чистое вторсырье",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body14GeologicaLight
                          .copyWith(color: AppColors.shade3),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 202.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "от 750₽",
                          style: AppTextStyles.body16GeologicaSemiBold,
                        ),
                        Container(
                          height: 25,
                          width: 81.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: AppColors.accent),
                          child: Center(
                              child: Text(
                            "до 20 кг",
                            style: AppTextStyles.body14GeologicaMedium
                                .copyWith(color: AppColors.white),
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
