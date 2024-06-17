import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';

 enum TypeTariff {
   courierExport,
   truckExport,
   warehouseExport,
 }

class CustomPriceTariff extends StatefulWidget {
  const CustomPriceTariff({super.key, required this.available, required this.price, required this.typeTariff});
  final bool available;
  final num? price;
  final TypeTariff typeTariff;
  @override
  State<CustomPriceTariff> createState() => _CustomPriceTariffState();
}

class _CustomPriceTariffState extends State<CustomPriceTariff> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:70,
      width:  272,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.typeTariff == TypeTariff.courierExport || widget.typeTariff == TypeTariff.truckExport?  Text(widget.typeTariff == TypeTariff.courierExport? "Вывоз курьером": "Грузовой вывоз",style:  AppTextStyles.body16GeologicaLight,maxLines: 1,) : Text("Оптовый вывоз",style: AppTextStyles.body16GeologicaLight,maxLines: 1,),
          widget.typeTariff == TypeTariff.courierExport || widget.typeTariff == TypeTariff.truckExport?  Text(widget.typeTariff == TypeTariff.courierExport?  "до 20 кг" : "до 100 кг",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),):Text("до 500 кг",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
          widget.typeTariff == TypeTariff.warehouseExport || widget.typeTariff == TypeTariff.truckExport? Text( widget.typeTariff == TypeTariff.courierExport || widget.available == true ? "Бесплатно"  :  "Недоступно в вашем городе",style: AppTextStyles.body16GeologicaSemiBold.copyWith(color: widget.available == true ? AppColors.main: AppColors.shade2 ),maxLines: 1,) : Text( widget.available == true ? "${widget.price}₽" : "Недоступно в вашем городе",style: AppTextStyles.body16GeologicaSemiBold.copyWith(color: widget.available == true ? AppColors.main: AppColors.shade2 ),maxLines: 1,),

        ],
      ),
    );
  }
}
