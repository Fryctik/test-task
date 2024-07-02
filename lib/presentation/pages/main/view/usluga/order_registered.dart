import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class OrderRegistered extends StatefulWidget {
  const OrderRegistered({super.key});

  @override
  State<OrderRegistered> createState() => _OrderRegisteredState();
}

class _OrderRegisteredState extends State<OrderRegistered> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top <= 52 ? 27.h : 0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Expanded(
                child: SizedBox(

                ),
              ),
                  Text("20 апреля в 13:43",style: AppTextStyles.body16GeologicaSemiBold,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            context.pop();
                          },
                          child: SvgPicture.asset(Assets.iconsClose,
                            height: 24,
                            width: 24,
                            colorFilter: ColorFilter.mode(AppColors.accent, BlendMode.srcIn),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 26,),
                        RichText(text: TextSpan(
                          text: "Заказ",
                            style: AppTextStyles.body32UnboundedSemiBold.copyWith(color: AppColors.black),
                            children: [
                              TextSpan(
                                text: " №23",style: AppTextStyles.body32UnboundedSemiBold.copyWith(color: AppColors.accent),

                              ),
                              TextSpan(
                                  text: "\nоформлен",
                                style: AppTextStyles.body32UnboundedSemiBold.copyWith(color: AppColors.black),
                              ),
                            ] )),
                        Text("Пожалуйста, будьте на связи в указанное для курьера время",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),

                        SizedBox(height: 24,),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(13),
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    color: AppColors.shade1,
                                    shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(Assets.iconsFile36x36,),
                              ),
                              SizedBox(height: 12,),
                              Text("Сопроводительная записка",style: AppTextStyles.body15GeologicaLight.copyWith(color: AppColors.shade3),)

                            ],
                          ),
                        )
                   ,SizedBox(height: 24,),
                       Divider(height: 1,color: AppColors.shade1,),
                        SizedBox(height: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("О заказе",style: AppTextStyles.body16GeologicaSemiBold,),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.iconsClock),
                                SizedBox(width: 12,),
                                Text("18 апреля с 12:00 до 14:00",style: AppTextStyles.body16GeologicaLight,)
                              ],
                            ) ,
                            SizedBox(height: 16,),

                            Row(
                              children: [
                                SvgPicture.asset(Assets.iconsLocationTag16x16,
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.fitWidth,
                                  colorFilter: ColorFilter.mode(AppColors.accent,BlendMode.srcIn),),
                                SizedBox(width: 12,),
                                Text("г. Мытищи, ул. Пионерская  14, кв. 112",style: AppTextStyles.body16GeologicaLight,)
                              ],
                            ),
                            SizedBox(height: 24,),
                            Divider(height: 1,color: AppColors.shade1,),
                            SizedBox(height: 16,),
                            Text("Содержимое пакетов",style: AppTextStyles.body16GeologicaSemiBold,),
                            Column(
                              children: [
                                SizedBox(height: 24,),
                                Row(
                                  children: [
                                    Text("Пакет 1",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                    SizedBox(width: 35,),
                                    Text("Стекло",style: AppTextStyles.body16GeologicaLight,)
                                  ],
                                ) ,
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Пакет 2",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                    SizedBox(width: 35,),
                                    Text("Пластик",style: AppTextStyles.body16GeologicaLight,)
                                  ],
                                ) ,
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Пакет 2",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                    SizedBox(width: 35,),
                                    Text("Одежда",style: AppTextStyles.body16GeologicaLight,)
                                  ],
                                ) ,
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 24,),
                        Divider(height: 1,color: AppColors.shade1,),
                        SizedBox(height: 16,),
                        Text("Комментарий к заказу",style: AppTextStyles.body16GeologicaSemiBold,),
                        SizedBox(height: 24,),
                        Text("Смогу после 12:20",style: AppTextStyles.body16GeologicaLight,),
                      SizedBox(height: 17,),
                      ]
                      ,

                    ),
                  ),
                ),
              ),
              Container(
                height: 104,
                width: 390,

                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.22),

                        blurRadius: 3,
                      )
                    ]
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Оплачено",style: AppTextStyles.body16GeologicaSemiBold,),
                          Text("700₽",style: AppTextStyles.body16UnboundedMedium,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),

                      child: Text("Вывоз курьером",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
