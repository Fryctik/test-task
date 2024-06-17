import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class CustomCardProduct extends StatefulWidget {
  const CustomCardProduct({super.key, required this.packet, required this.price, required this.available});
  final bool available;
  final num packet;
  final num price;

  @override
  State<CustomCardProduct> createState() => _CustomCardProductState();
}

class _CustomCardProductState extends State<CustomCardProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221,
      width: 173,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 173,
            width: 173,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: widget.available == true? AppColors.shade1 : AppColors.shade2),
            child: Center(
              child:  Image.asset(Assets.imagePacket,fit: BoxFit.cover,),
            ),
          ),

      Text("Пакет ${widget.packet} л",style: AppTextStyles.body16GeologicaSemiBold.copyWith(color: widget.available == true ? AppColors.black : AppColors.shade3,),),
          Text("${widget.price}₽",style: AppTextStyles.body16GeologicaLight,),
        ],
      ),
    );
  }
}

