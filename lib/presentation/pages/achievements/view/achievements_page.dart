import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/pages/achievements/components/custom_level.dart';
import 'package:test/presentation/pages/achievements/manager/achievements_cubit.dart';
import 'package:test/presentation/widgets/custom_bottom_navigation.dart';

import '../../../../../../config/contstants/app_colors.dart';
import '../../../../../../generated/assets.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {

  bool expanded=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: AppColors.white,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ДОСТИЖЕНИЯ",
                  style: AppTextStyles.body16UnboundedMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<AchievementsCubit, int>(
                builder: (context, state) {
                return SingleChildScrollView(
                  child:
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            CustomLevel(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "ВАША СТАТИСТИКА",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                            ),
                            SizedBox(height: 16,),
                           state == 0 ? Column(
                             children: [
                                Image.asset(Assets.imageImgSmile, height: 130,width: 130,fit: BoxFit.cover,),
                               Text("ОЙ,ПУСТО!",style: AppTextStyles.body16UnboundedMedium,),
                               SizedBox(height: 5,),
                               Text("Пока тут нет данных",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                               SizedBox(height: 12,),
                               Divider(color: AppColors.shade1,),
                               SizedBox(height: 16,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Всего вывозов",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                   Text("0",style: AppTextStyles.body16GeologicaLight,),

                                 ],
                               ),
                               SizedBox(height: 20,),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Последний вывоз",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                   Text("-",style: AppTextStyles.body16GeologicaLight,),

                                 ],
                               ),
                               SizedBox(height: 20,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Общий эковклад",style: AppTextStyles.body16GeologicaSemiBold,),
                                   Text("0 СО2",style: AppTextStyles.body16GeologicaSemiBold,),

                                 ],
                               ),
                             ],
                           ) : Column(
                             children: [
                               expanded? Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,

                                     children: [
                                       Text(
                                         "Маркировка",
                                         style: AppTextStyles.body14GeologicaLight
                                             .copyWith(color: AppColors.shade3),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 20,
                                       ),
                                       Text(
                                         "1 ПЭТ ПЭТФ | PETE",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "2 ПНД HDPE",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "4 ПЭВД | LDPE",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "7 ПНЖТ | PNDT",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "5 ВКА | VKA",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "11 ДЭС | DES",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "04 РТСК | PTSK",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Text(
                                         "Последний вывоз",
                                         style: AppTextStyles.body14GeologicaLight
                                             .copyWith(color: AppColors.shade3),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 20,
                                       ),
                                       Text(
                                         "+1,2",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+0,7",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+0,8",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+0,3",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+0,2",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+1,3",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ), Text(
                                         "+0,5",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       )
                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Text(
                                         "Всего, кг",
                                         style: AppTextStyles.body14GeologicaLight
                                             .copyWith(color: AppColors.shade3),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 20,
                                       ),
                                       Text(
                                         "4,2",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "3,5",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "2,7",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ), Text(
                                         "2,6",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ), Text(
                                         "2,4",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ), Text(
                                         "2,0",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ), Text(
                                         "1,4",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                     ],
                                   )
                                 ],
                               ): Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         "Маркировка",
                                         style: AppTextStyles.body14GeologicaLight
                                             .copyWith(color: AppColors.shade3),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 20,
                                       ),
                                       Text(
                                         "1 ПЭТ ПЭТФ | PETE",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "2 ПНД HDPE",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "4 ПЭВД | LDPE",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Text(
                                         "Последний вывоз",
                                         style: AppTextStyles.body14GeologicaLight
                                             .copyWith(color: AppColors.shade3),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 20,
                                       ),
                                       Text(
                                         "+1,2",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+0,7",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "+0,8",
                                         style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.accentDark),
                                         textAlign: TextAlign.justify,
                                       ),

                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Text(
                                         "Всего, кг",
                                         style: AppTextStyles.body14GeologicaLight
                                             .copyWith(color: AppColors.shade3),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 20,
                                       ),
                                       Text(
                                         "4,2",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "3,5",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ), SizedBox(
                                         height: 12,
                                       ),
                                       Text(
                                         "2,7",
                                         style: AppTextStyles.body14GeologicaLight,
                                         textAlign: TextAlign.justify,
                                       ),



                                     ],
                                   )
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   GestureDetector(
                                     onTap: () {
                                       setState(() {
                                         expanded = !expanded;
                                       });
                                     },
                                     child: expanded
                                         ? Row(
                                       children: [
                                         Text(
                                           'Скрыть',
                                           style: AppTextStyles.body14GeologicaLight
                                               .copyWith(color: AppColors.shade3),
                                         ),
                                         SvgPicture.asset(
                                           Assets.iconsArrowUp,
                                           colorFilter: ColorFilter.mode(
                                               AppColors.shade3, BlendMode.srcIn),
                                         )
                                       ],
                                     )
                                         : Row(
                                       children: [
                                         Text(
                                           'Подробнее',
                                           style:
                                           AppTextStyles.body14GeologicaLight.copyWith(
                                             color: AppColors.shade3,
                                           ),
                                         ),
                                         SvgPicture.asset(
                                           Assets.iconsArrowDown,
                                           colorFilter: ColorFilter.mode(
                                               AppColors.shade3, BlendMode.srcIn),
                                         )
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 16,),
                               Divider(color: AppColors.shade1,),
                               SizedBox(height: 16,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Всего вывозов",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                   Text("4",style: AppTextStyles.body16GeologicaLight,),

                                 ],
                               ),
                               SizedBox(height: 20,),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Последний вывоз",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),),
                                   Text("15 дней назад",style: AppTextStyles.body16GeologicaLight,),

                                 ],
                               ),
                               SizedBox(height: 20,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Общий эковклад",style: AppTextStyles.body16GeologicaSemiBold,),
                                   Text("354 СО2",style: AppTextStyles.body16GeologicaSemiBold,),

                                 ],
                               ),
                             ],
                           ),
                            SizedBox(height: 24,)
                          ],
                        ),
                      ),

                    ]

                  ),
                );
              }
            ),
          ),
        ],
      ), ),
    );
  }
}

class StepCircle extends StatelessWidget {
  final bool isActive;
  final bool isCurrent;

  final Function( ) function;

  StepCircle({required this.isActive, required this.isCurrent, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:(MediaQuery.sizeOf(context).width-160)/3 ),
      child: GestureDetector(
         onTap: function,
        child: SizedBox(
          width: 20,
          child: CircleAvatar(
            radius: 10.0,
            backgroundColor: isCurrent ? AppColors.main : (isActive ? AppColors.accent :AppColors.shade1),
            child: CircleAvatar(
              radius: 6.0,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
class CustomLine extends StatelessWidget {
   bool isActive;
 CustomLine({super.key,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
       margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(color:isActive? AppColors.accent:AppColors.shade1),height: 6,
    width: (MediaQuery.sizeOf(context).width-160)/3,);
  }
}

