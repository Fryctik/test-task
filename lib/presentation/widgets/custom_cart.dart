import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

import 'add_minus_buttons.dart';

class CustomCart extends StatefulWidget {
  const CustomCart({super.key, required this.title, required this.description, required this.price});

  final String title;
  final String description;
  final double price;

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 89,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
              Container(
                height: 89,
                width: 89,
                decoration: BoxDecoration(
                  color: AppColors.shade1,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                child: Image.asset(Assets.imagePacket,width: 64,height: 63,),
                      ),
                  ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  SizedBox(height: 5 ,),
                  Text(widget.title,

                    style: AppTextStyles.body16GeologicaSemiBold,),
                  Text(widget.description,style: AppTextStyles.body14GeologicaLight.copyWith(
                    color: AppColors.shade3,
                  ),),
                  Text("${widget.price}₽",

                    style: AppTextStyles.body16GeologicaSemiBold,),
                ],
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AddMinusButtons(),
              GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset(Assets.iconsDisabledTrash)),


            ],
          )
        ],
      ),
    );
  }
}
