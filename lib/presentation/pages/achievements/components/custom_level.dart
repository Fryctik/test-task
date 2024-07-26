import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/achievements/manager/achievements_cubit.dart';
import 'package:test/presentation/pages/achievements/view/achievements_page.dart';
import 'package:test/presentation/widgets/custom_bottom_navigation.dart';

class CustomLevel extends StatefulWidget {
  const CustomLevel({super.key});

  @override
  State<CustomLevel> createState() => _CustomLevelState();
}

class _CustomLevelState extends State<CustomLevel> {
  List<String> titles = ["ЗЕЛЕНЫЙ НОВОБРАНЕЦ","ЗНАТОК ФРАКЦИИ", "ГИК - СОБИРАТЕЛЬ"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding:
      EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:    [
          BoxShadow(
            color: AppColors.black.withOpacity(0.12),
            blurRadius: 48,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: BlocBuilder<AchievementsCubit, int>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state<3?  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Уровень ${state+1}",style: AppTextStyles.body14GeologicaLight,),

                  SizedBox(height: 16,),
                  Text(titles[state] ,style: AppTextStyles.body16UnboundedMedium,),
                  SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.sizeOf(context).width,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.shade1,

                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * state/5,

                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( "${state ==0 ? "0 кг" :" 200 кг"}",style: AppTextStyles.body11GeologicaRegular.copyWith(color: AppColors.shade3),),
                      Text("${state ==0 ? "50 кг" :" 500 кг"} ",style: AppTextStyles.body11GeologicaRegular.copyWith(color: AppColors.shade3)),


                    ],),
                  SizedBox(height: 10,),
                  Text("${state<1?"Повысьте ваш эковклад до 50 кг CO2 для перехода на следующий уровень" : "Повысьте ваш эковклад до 500 кг CO2 для перехода на следующий уровень"}",
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: AppTextStyles.body16GeologicaLight,
                  ),
                  SizedBox(height: 15,),
                  Container(width: double.infinity,color: AppColors.shade1,height: 1,),
                  SizedBox(height: 15,),
                ],):
              SizedBox(
                height: 240.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Column(children: [
                      Text("Уровень ${state+1}",style: AppTextStyles.body14GeologicaLight,),

                      SizedBox(height: 16,),
                      Text("зеленый новобранец",style: AppTextStyles.body16UnboundedMedium,),
                      SizedBox(height: 16,),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.sizeOf(context).width,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.shade1,

                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width*2/5,

                          decoration: BoxDecoration(
                            color: AppColors.main,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("200 кг",style: AppTextStyles.body11GeologicaRegular.copyWith(color: AppColors.shade3),),
                          Text("500 кг",style: AppTextStyles.body11GeologicaRegular.copyWith(color: AppColors.shade3)),


                        ],),
                      SizedBox(height: 10,),
                      Text("Повысьте ваш эковклад до 500 кг CO2 для перехода на следующий уровень",
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        style: AppTextStyles.body16GeologicaLight,
                      ),
                      SizedBox(height: 15,),
                      Container(width: double.infinity,color: AppColors.shade1,height: 1,),
                      SizedBox(height: 15,),
                    ],),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 60,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 9,sigmaY: 9),child: Container(

                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.2),
                          ),
                        ),),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20,),
                        Image.asset(Assets.imageLock,height: 54,width: 43,),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Для перехода на этот уровень необходимо повысить эковклад на 9 646 кг СО2",maxLines: 4,style: AppTextStyles.body16GeologicaLight,textAlign: TextAlign.center,),
                        )
                      ],),
                    DottedBorder(child: Container(
                      height: 175,
                      width: MediaQuery.sizeOf(context).width-40,
                    ),
                      radius: Radius.circular(12),
                      dashPattern: [
                        10,10
                      ],
                      strokeWidth: 4,
                      color: AppColors.shade1,
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: levelScrollController,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    Positioned(top: 7,
                      child: Row(
                        children: [
                          ... List.generate(10, (index)=>CustomLine(isActive: index<2)),
                        ],
                      ),
                    ),

                    Row(children: [
                      ... List.generate(10, (index)=>Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          StepCircle(isActive: index < 3? true:false, isCurrent: index == state, function: (){
                            context.read<AchievementsCubit>().updateAchievementIndex(index);
                          }),
                          SizedBox(height: 4,),
                          Text("Ур.${index+1}",style: AppTextStyles.body11GeologicaRegular,)
                        ],
                      ))
                    ],)

                  ],
                ),
              ),
              SizedBox(height: 6,),
            ],
          );
        }
      ),
    );
  }
}
