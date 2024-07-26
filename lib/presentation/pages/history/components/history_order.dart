// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:test/config/contstants/app_colors.dart';
// import 'package:test/config/contstants/app_text_styles.dart';
// import 'package:test/generated/assets.dart';
//
// class HistoryOrder extends StatefulWidget {
//   const HistoryOrder({super.key, required this.status, required this.orderStatus, required this.statusColor});
//   final String  status;
//   final String orderStatus;
//   final Color statusColor;
//
//
//   @override
//   State<HistoryOrder> createState() => _HistoryOrderState();
// }
//
// class _HistoryOrderState extends State<HistoryOrder> {
//   bool moreVisible = false;
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             boxShadow: [    BoxShadow(
//               color: AppColors.black.withOpacity(0.12),
//               blurRadius: 48,
//               offset: Offset(0, 2),
//             )
//             ],
//             color: Colors.white),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "23 апреля, 13:27",
//                     style: AppTextStyles.body14GeologicaLight
//                         .copyWith(color: AppColors.shade3),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                             width: 1, color: widget.statusColor)),
//                     child: Text(
//                       widget.status,
//                       style: AppTextStyles.body14GeologicaLight
//                           .copyWith(color: widget.statusColor),
//                     ),
//                   )
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               ),
//               Text(
//                 "заказ №343",
//                 style: AppTextStyles.body16UnboundedMedium,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12),
//                     child: CustomPaint(
//                       size: Size(
//                           MediaQuery.sizeOf(context).width - 60,
//                           10), // kengligi va balandligini sozlang
//                       painter: DashedLinePainter(),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       for (int i = 0; i < 6; i++)
//                         Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.center,
//                           children: [
//                           widget.status == "Отменен" && i == 0 ||  widget.status == "Выполнен" && i == 5?
//                                  SvgPicture.asset(
//                               Assets.iconsDisabledTruck,
//                               height: 24,
//                               width: 24,
//                             )
//                                 : SizedBox(
//                               height: 24,
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             CircleAvatar(
//                               radius: 5,
//                               backgroundColor: i == 0
//                                   ? AppColors.main
//                                   : AppColors.shade2,
//                             ),
//                           ],
//                         )
//                     ],
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                   child: Text(
//                     widget.orderStatus,
//                     style: AppTextStyles.body15GeologicaLight
//                         .copyWith(color: AppColors.shade3),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               !moreVisible
//                   ? Column(
//                 children: [
//                   Container(
//                     height: 1,
//                     color: AppColors.shade1,
//                   ),
//                   SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       moreVisible = true;
//                       setState(() {});
//                     },
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Подробнее",
//                           style: AppTextStyles
//                               .body16GeologicaLight
//                               .copyWith(
//                               color: AppColors.shade3),
//                         ),
//                         SvgPicture.asset(
//                           Assets.iconsArrowDown,
//                           colorFilter: ColorFilter.mode(
//                               AppColors.shade3,
//                               BlendMode.srcIn),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//                   : Column(
//                 children: [
//                   Text(
//                     "О заказе",
//                     style: AppTextStyles
//                         .body16GeologicaSemiBold,
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     children: [
//                       SvgPicture.asset(
//                           Assets.iconsOrderTag),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         "Вывоз курьером",
//                         style: AppTextStyles
//                             .body16GeologicaLight,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     children: [
//                       SvgPicture.asset(Assets.iconsClock),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         "18 апреля с 12:00 до 14:00",
//                         style: AppTextStyles
//                             .body16GeologicaLight,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Row(children: [
//                     SvgPicture.asset(
//                       Assets.iconsLocationTag16x16,
//                       height: 24,
//                       width: 24,
//                       fit: BoxFit.fitWidth,
//                       colorFilter: ColorFilter.mode(
//                           AppColors.accent,
//                           BlendMode.srcIn),
//                     ),
//                     SizedBox(
//                       width: 12,
//                     ),
//                     SizedBox(
//                       width: 250,
//                       child: Text(
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         "г. Мытищи, ул. Пионерская  14, кв. 112",
//                         style: AppTextStyles
//                             .body16GeologicaLight
//                             .copyWith(),
//                       ),
//                     ),
//                   ]),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Text(
//                     "Содержимое пакетов",
//                     style: AppTextStyles
//                         .body16GeologicaSemiBold,
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 24,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Пакет 1",
//                             style: AppTextStyles
//                                 .body16GeologicaLight
//                                 .copyWith(
//                                 color:
//                                 AppColors.shade3),
//                           ),
//                           SizedBox(
//                             width: 35,
//                           ),
//                           Text(
//                             "Стекло",
//                             style: AppTextStyles
//                                 .body16GeologicaLight,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Пакет 2",
//                             style: AppTextStyles
//                                 .body16GeologicaLight
//                                 .copyWith(
//                                 color:
//                                 AppColors.shade3),
//                           ),
//                           SizedBox(
//                             width: 35,
//                           ),
//                           Text(
//                             "Пластик",
//                             style: AppTextStyles
//                                 .body16GeologicaLight,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Пакет 2",
//                             style: AppTextStyles
//                                 .body16GeologicaLight
//                                 .copyWith(
//                                 color:
//                                 AppColors.shade3),
//                           ),
//                           SizedBox(
//                             width: 35,
//                           ),
//                           Text(
//                             "Одежда",
//                             style: AppTextStyles
//                                 .body16GeologicaLight,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                       Container(
//                         height: 1,
//                         color: AppColors.shade1,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           moreVisible = false;
//                           setState(() {});
//                         },
//                         child: Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Скрыть",
//                               style: AppTextStyles
//                                   .body16GeologicaLight
//                                   .copyWith(
//                                   color:
//                                   AppColors.shade3),
//                             ),
//                             SvgPicture.asset(
//                               Assets.iconsArrowUp,
//                               colorFilter: ColorFilter.mode(
//                                   AppColors.shade3,
//                                   BlendMode.srcIn),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   //   SizedBox(
//                   //
//                   // height: 60,
//                   //     child: TimelineTile(
//                   //       axis: TimelineAxis.horizontal,
//                   //       alignment: TimelineAlign.center,
//                   //       lineXY: 0.5,
//                   //       isFirst: false,
//                   //       indicatorStyle: IndicatorStyle(
//                   //         width: 10,
//                   //         height: 10,
//                   //         color: Colors.purple,
//                   //
//                   //
//                   //       ),
//                   //       afterLineStyle:LineStyle(
//                   //         color: Colors.grey,
//                   //         thickness: 2,
//                   //       ) ,
//                   //       beforeLineStyle: LineStyle(
//                   //         color: Colors.grey,
//                   //         thickness: 2,
//                   //       ),
//                   //     ),
//                   //   ),
//                 ],
//               ),
//             ]));
//   }
// }
//
//
