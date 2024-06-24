import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';
import 'package:test/themes/themes.dart';



class ServiceCard extends StatefulWidget {
  const ServiceCard(
      {super.key,
      required,
      required this.description,
      required this.price,
      required this.kilogram,
      required this.typeTariff,
      required this.available});
  final TypeTariff typeTariff;
  final String description;
  final String price;
  final int kilogram;
  final bool available;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return widget.available == true? 
    Container(
      height: 150,
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shade1, // Shadow color
              spreadRadius: 3, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 1), // Offset in x and y direction
            ),
          ]),
      child: Row(
        children: [
          widget.typeTariff == TypeTariff.courierExport || widget.typeTariff == TypeTariff.truckExport? Image.asset(widget.typeTariff == TypeTariff.courierExport ? Assets.imageCustomCar : Assets.imageNormalTruck,) : Image.asset(Assets.imageBigTruck,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 20),
              width: 202.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.typeTariff == TypeTariff.courierExport ||
                          widget.typeTariff == TypeTariff.truckExport
                          ? Text(
                        widget.typeTariff == TypeTariff.courierExport
                            ? "Вывоз курьером"
                            : "Грузовой вывоз",
                        style: AppTextStyles.body16GeologicaSemiBold,
                        maxLines: 1,
                      )
                          : Text(
                        "Оптовый вывоз",
                        style: AppTextStyles.body16GeologicaSemiBold,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body14GeologicaLight
                            .copyWith(color: AppColors.shade3),
                      ),
                    ],
                  )
,
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 25,
                    width: 202.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.typeTariff == TypeTariff.truckExport
                            ? Text(
                                widget.typeTariff == TypeTariff.truckExport &&
                                        widget.available
                                    ? "Бесплатно"
                                    : "Временно недоступен",
                                style: AppTextStyles.body16GeologicaSemiBold
                                    .copyWith(
                                        color: widget.available == true
                                            ? AppColors.black
                                            : AppColors.shade2),
                                maxLines: 1,
                              )
                            : widget.typeTariff == TypeTariff.warehouseExport
                                ? Text(
                                    widget.typeTariff ==
                                                TypeTariff.warehouseExport &&
                                            widget.available
                                        ? "Заплатим"
                                        : "Временно недоступен",
                                    style: AppTextStyles.body16GeologicaSemiBold
                                        .copyWith(
                                            color: widget.available == true
                                                ? AppColors.black
                                                : AppColors.shade2),
                                    maxLines: 1,
                                  )
                                : Text(
                                    widget.available == true
                                        ? "от ${widget.price}₽"
                                        : "Временно недоступен",
                                    style: AppTextStyles.body16GeologicaSemiBold
                                        .copyWith(
                                            color: widget.available == true
                                                ? AppColors.black
                                                : AppColors.shade2),
                                    maxLines: 1,
                                  ),
                        widget.available == true
                            ?   Container(
                          height: 25,
                          width: 81.w,
                          decoration: widget.typeTariff == TypeTariff.warehouseExport ?
                          BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: AppColors.shade2) :BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: widget.typeTariff == TypeTariff.courierExport?  AppColors.accent : AppColors.main),
                          child:Center(
                                  child: widget.typeTariff ==
                                              TypeTariff.courierExport ||
                                          widget.typeTariff ==
                                              TypeTariff.truckExport
                                      ? Text(
                                          widget.typeTariff ==
                                                  TypeTariff.courierExport
                                              ? "от 20 кг"
                                              : "от 100 кг",
                                          style: AppTextStyles
                                              .body16GeologicaSemiBold
                                              .copyWith(color: AppColors.white),
                                        )
                                      : Text(
                                          "от 500 кг",
                                          style: AppTextStyles
                                              .body16GeologicaSemiBold
                                              .copyWith(color: AppColors.white),
                                        ),
                                ),

                      ) : SizedBox.shrink()
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ) : Opacity(
      opacity: 0.5,
      child: Container(
        height: 150,
        width: 350.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.shade1, // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 3, // Blur radius
                offset: Offset(0, 1), // Offset in x and y direction
              ),
            ]),
        child: Row(
          children: [
            widget.typeTariff == TypeTariff.courierExport || widget.typeTariff == TypeTariff.truckExport? Image.asset(widget.typeTariff == TypeTariff.courierExport ? Assets.imageCustomCar : Assets.imageNormalTruck,) : Image.asset(Assets.imageBigTruck,),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 16, bottom: 16, right: 20),
                width: 202.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.typeTariff == TypeTariff.courierExport ||
                        widget.typeTariff == TypeTariff.truckExport
                        ? Text(
                      widget.typeTariff == TypeTariff.courierExport
                          ? "Вывоз курьером"
                          : "Грузовой вывоз",
                      style: AppTextStyles.body16GeologicaSemiBold,
                      maxLines: 1,
                    )
                        : Text(
                      "Оптовый вывоз",
                      style: AppTextStyles.body16GeologicaSemiBold,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body14GeologicaLight
                          .copyWith(color: AppColors.shade3),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 25,
                      width: 202.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.typeTariff == TypeTariff.truckExport
                              ? Text(
                            widget.typeTariff == TypeTariff.truckExport &&
                                widget.available
                                ? "Бесплатно"
                                : "Временно недоступен",
                            style: AppTextStyles.body16GeologicaSemiBold
                                .copyWith(
                                color: widget.available == true
                                    ? AppColors.black
                                    : AppColors.shade2),
                            maxLines: 1,
                          )
                              : widget.typeTariff == TypeTariff.warehouseExport
                              ? Text(
                            widget.typeTariff ==
                                TypeTariff.warehouseExport &&
                                widget.available
                                ? "Заплатим"
                                : "Временно недоступен",
                            style: AppTextStyles.body16GeologicaSemiBold
                                .copyWith(
                                color: widget.available == true
                                    ? AppColors.black
                                    : AppColors.shade2),
                            maxLines: 1,
                          )
                              : Text(
                            widget.available == true
                                ? "от ${widget.price}₽"
                                : "Временно недоступен",
                            style: AppTextStyles.body16GeologicaSemiBold
                                .copyWith(
                                color: widget.available == true
                                    ? AppColors.black
                                    : AppColors.shade2),
                            maxLines: 1,
                          ),
                          widget.available == true
                              ?   Container(
                            height: 25,
                            width: 81.w,
                            decoration: widget.typeTariff == TypeTariff.warehouseExport ?
                            BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: AppColors.shade2) :BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: widget.typeTariff == TypeTariff.courierExport?  AppColors.accent : AppColors.main),
                            child:Center(
                              child: widget.typeTariff ==
                                  TypeTariff.courierExport ||
                                  widget.typeTariff ==
                                      TypeTariff.truckExport
                                  ? Text(
                                widget.typeTariff ==
                                    TypeTariff.courierExport
                                    ? "от 20 кг"
                                    : "от 100 кг",
                                style: AppTextStyles
                                    .body16GeologicaSemiBold
                                    .copyWith(color: AppColors.white),
                              )
                                  : Text(
                                "от 500 кг",
                                style: AppTextStyles
                                    .body16GeologicaSemiBold
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
      
                          ) : SizedBox.shrink()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
