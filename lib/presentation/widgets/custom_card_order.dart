
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

  enum OrderStatus{
    executed,
    canceled,
    executedLate,
    waitingExecution,
  }

class CustomCardOrder extends StatefulWidget {
  const CustomCardOrder({super.key, required this.orderStatus, required this.orderNumber, required this.type,required this.address,});

  final OrderStatus orderStatus;
  final int orderNumber;
  final String type;
  final String? address;

  @override
  State<CustomCardOrder> createState() => _CustomCardOrderState();
}

class _CustomCardOrderState extends State<CustomCardOrder> {
  @override
  Widget build(BuildContext context) {
    return  Container(
    height: widget.address == null ?100 : 122,
    width: 350,
    padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 30),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: AppColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: widget.orderStatus == OrderStatus.executed  || widget.orderStatus == OrderStatus.canceled ? BoxDecoration(
                    color: widget.orderStatus == OrderStatus.executed ?AppColors.accent : AppColors.red,
                    shape: BoxShape.circle
                ): BoxDecoration(
                    color: widget.orderStatus == OrderStatus.waitingExecution ?AppColors.shade2: AppColors.yellow,
                    shape: BoxShape.circle
                )
              ),
              SizedBox(width: 8,),
              widget.orderStatus == OrderStatus.executed || widget.orderStatus == OrderStatus.canceled ?  Text( widget.orderStatus == OrderStatus.executed? "Выполнен" : "Отменен",style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3)) :   Text( widget.orderStatus == OrderStatus.waitingExecution ? "Ожидает выполнения" : "Выполнен с опозданием",style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3))


            ]
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ЗАКАЗ №${widget.orderNumber}",style: AppTextStyles.body16UnboundedMedium,),
              GestureDetector(
                onTap: (){},
                child: SvgPicture.asset(Assets.iconsArrowRight,colorFilter: ColorFilter.mode(AppColors.shade3,BlendMode.srcIn)),
              )
            ],
          ),
          Text(widget.type,style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
         widget.address != null  ?Text(widget.address!,style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),maxLines: 1,overflow: TextOverflow.ellipsis,): SizedBox.shrink()
        ],
      ),
    );
  }
}
