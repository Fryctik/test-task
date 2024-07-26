import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class CustomCardProcess extends StatefulWidget {
  const CustomCardProcess({super.key});

  @override
  State<CustomCardProcess> createState() => _CustomCardProcessState();
}

class _CustomCardProcessState extends State<CustomCardProcess> {
  bool moreVisible2 = false;

  ScrollController _scrollController = ScrollController();

  @override

  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.shade1,
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
            color: Colors.white),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "23 апреля, 13:27",
                    style: AppTextStyles.body14GeologicaLight
                        .copyWith(color: AppColors.shade3),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1, color: AppColors.accent)),
                    child: Text(
                      "В работе",
                      style: AppTextStyles.body14GeologicaLight
                          .copyWith(color: AppColors.accent),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Text(
                "ЗАКАЗ №343",
                style: AppTextStyles.body16UnboundedMedium,
              ),
              SizedBox(
                height: 25,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: CustomPaint(
                      size: Size(
                          MediaQuery.sizeOf(context).width - 60,
                          10), // kengligi va balandligini sozlang
                      painter: DashedLinePainter(),
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(2, (index){
                        return Container(
                          margin: EdgeInsets.only(bottom: 3.75),
                          height: 2.5,
                          width: (MediaQuery.sizeOf(context).width - 60)/5,
                          color: AppColors.main,
                        );
                      }),
                    ],
                  ),


                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 6; i++)
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            i == 2
                                ? SvgPicture.asset(
                              Assets.iconsActiveTruck,
                              height: 24,
                              width: 24,
                            )
                                : SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: i <=2
                                  ? AppColors.main
                                  : AppColors.shade2,
                            ),
                          ],
                        )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                    "Курьер скоро будет у вас",
                    style: AppTextStyles.body15GeologicaLight
                        .copyWith(color: AppColors.shade3),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              !moreVisible2
                  ? Column(
                children: [
                  Container(
                    height: 1,
                    color: AppColors.shade1,
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      moreVisible2 = true;
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          "Подробнее",
                          style: AppTextStyles
                              .body16GeologicaLight
                              .copyWith(
                              color: AppColors.shade3),
                        ),
                        SvgPicture.asset(
                          Assets.iconsArrowDown,
                          colorFilter: ColorFilter.mode(
                              AppColors.shade3,
                              BlendMode.srcIn),
                        )
                      ],
                    ),
                  ),
                ],
              )
                  : Column(
                children: [
                  Text(
                    "О заказе",
                    style: AppTextStyles
                        .body16GeologicaSemiBold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                          Assets.iconsOrderTag),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Вывоз курьером",
                        style: AppTextStyles
                            .body16GeologicaLight,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.iconsClock),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "18 апреля с 12:00 до 14:00",
                        style: AppTextStyles
                            .body16GeologicaLight,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    SvgPicture.asset(
                      Assets.iconsLocationTag16x16,
                      height: 24,
                      width: 24,
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(
                          AppColors.accent,
                          BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        "г. Мытищи, ул. Пионерская  14, кв. 112",
                        style: AppTextStyles
                            .body16GeologicaLight
                            .copyWith(),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Содержимое пакетов",
                    style: AppTextStyles
                        .body16GeologicaSemiBold,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            "Пакет 1",
                            style: AppTextStyles
                                .body16GeologicaLight
                                .copyWith(
                                color:
                                AppColors.shade3),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            "Стекло",
                            style: AppTextStyles
                                .body16GeologicaLight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            "Пакет 2",
                            style: AppTextStyles
                                .body16GeologicaLight
                                .copyWith(
                                color:
                                AppColors.shade3),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            "Пластик",
                            style: AppTextStyles
                                .body16GeologicaLight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            "Пакет 3",
                            style: AppTextStyles
                                .body16GeologicaLight
                                .copyWith(
                                color:
                                AppColors.shade3),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            "Одежда",
                            style: AppTextStyles
                                .body16GeologicaLight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 1,
                        color: AppColors.shade1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          moreVisible2 = false;
                          setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              "Скрыть",
                              style: AppTextStyles
                                  .body16GeologicaLight
                                  .copyWith(
                                  color:
                                  AppColors.shade3),
                            ),
                            SvgPicture.asset(
                              Assets.iconsArrowUp,
                              colorFilter: ColorFilter.mode(
                                  AppColors.shade3,
                                  BlendMode.srcIn),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ]));
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.5;

    var max = size.width;
    var dashWidth = (size.width - 60) / 30;
    var dashSpace = (size.width - 60) / 30;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
