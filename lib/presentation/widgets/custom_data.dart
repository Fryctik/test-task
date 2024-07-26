import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/easy_date_timeline/easy_date_timeline.dart';

class CustomData extends StatefulWidget {
  const CustomData({
    super.key,
  });
  @override
  State<CustomData> createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  DateTime selectedDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  ScrollController scrollController = ScrollController();
  // DateTime(2024, 07, 19)

  List<DateTime> generateDisabledDates() {
    List<DateTime> disabledDates = [];
    DateTime startDate = DateTime.now();

    for (int i = 0; i < 365; i++) {
      DateTime currentDate = startDate.add(Duration(days: i));
      if (currentDate.day % 2 != 0) {
        disabledDates.add(currentDate);
      }
    }

    return disabledDates;
  }

  bool selected = true;

  @override
  void initState() {
    if(selectedDateTime.day.isOdd) {
      selected = true;
    } else {
      selected = false;
    }
    super.initState();
  }

  void func() {
    setState(() {

    });
  }

  int selectedIndex = -1;
  List str = ["08:00-10:00", "10:00-12:00", "12:00-14:00", "14:00-16:00", "14:00-16:00", "16:00-18:00", "18:00-20:00"];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Text(
                DateFormat.MMM('ru').format(selectedDateTime).toUpperCase(),
                style: AppTextStyles.body16UnboundedMedium,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            EasyDateTimeLine(
            // disabledDates: [...generateDisabledDates()],
              itemBuilder: (context, date, isSelected, func) {
                print(date);
                print('selected $selectedDateTime');
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = -1;
                      selectedDateTime = date;
                      context.read<OrderCubit>().updatePackage(
                        context.read<OrderCubit>().state.package.package1,
                        context.read<OrderCubit>().state.package.package2,
                        context.read<OrderCubit>().state.package.package3,
                        context.read<OrderCubit>().state.package.package4,
                        '',
                        selectedDateTime , );
                      if (selectedDateTime.day.isOdd) {
                        selected = true;
                        setState(() {});
                      } else {
                        selected = false;
                        setState(() {});
                      }
                      //selectedDate` the new date selected.
                    },
                    child: Container(
                      width: 53.3.w,
                      decoration: selectedDateTime == date? BoxDecoration(
                          color: AppColors.shade1,
                          borderRadius:  BorderRadius.circular(16)
                      ): BoxDecoration(
                          color: AppColors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(EasyDateFormatter.shortDayName(date, 'ru_RU').toUpperCase(), style: AppTextStyles.body16GeologicaMedium.copyWith(fontSize: 11.sp, color: !isSelected && date.day.isOdd? AppColors.black: AppColors.shade3),),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(date.day.toString(), style: AppTextStyles.body16UnboundedMedium
                              .copyWith(color: !isSelected && date.day.isOdd? AppColors.main: AppColors.shade3),)
                        ],
                      ),
                    ),
                  );
              },
              timeLineProps: EasyTimeLineProps(
                margin: EdgeInsets.zero,
                separatorPadding: 0,
              ),
              headerProps: EasyHeaderProps(
                  showHeader: false,
                  showMonthPicker: false,
                  padding: EdgeInsets.zero,
                  // selectedDateStyle: AppTextStyles.body16UnboundedMedium
              ),
              locale: "ru_RU",
              activeColor: Colors.transparent,
              initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day ),
              onDateChange: (selectedDate) {
                selectedIndex = -1;
                selectedDateTime = selectedDate;
                context.read<OrderCubit>().updatePackage(
                    context.read<OrderCubit>().state.package.package1,
                    context.read<OrderCubit>().state.package.package2,
                    context.read<OrderCubit>().state.package.package3,
                    context.read<OrderCubit>().state.package.package4,
                    '',
                    selectedDateTime , );
             if (selectedDateTime.day.isOdd) {
                  selected = true;
                  setState(() {});
                } else {
                  selected = false;
                  setState(() {});
                }
                //selectedDate` the new date selected.
              },
              dayProps: EasyDayProps(
                width: 53.w,
                todayStyle: DayStyle(
                    dayNumStyle: AppTextStyles.body16UnboundedMedium
                        .copyWith(color: AppColors.shade3),
                    dayStrStyle: AppTextStyles.body16GeologicaMedium.copyWith(fontSize: 11.sp)
                        .copyWith(color: AppColors.shade3)),
                activeDayStyle: DayStyle(
                    decoration: BoxDecoration(color: AppColors.shade1, borderRadius: BorderRadius.circular(16)),
                    dayNumStyle: AppTextStyles.body16UnboundedMedium
                        .copyWith(color: !selected && !selectedDateTime.day.isOdd? AppColors.shade3: AppColors.main),
                    dayStrStyle: AppTextStyles.body16GeologicaMedium.copyWith(fontSize: 11.sp, color: selected && selectedDateTime.day.isOdd? AppColors.black: AppColors.shade3)),
                inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
                    dayStrStyle: AppTextStyles.body16GeologicaMedium.copyWith(fontSize: 11.sp)
                        .copyWith(color: AppColors.shade3),
                    dayNumStyle: AppTextStyles.body16UnboundedMedium
                        .copyWith(color: AppColors.shade3)),
                dayStructure: DayStructure.dayStrDayNum,
                // The height is not required in this case.
                height: 60.0,
              ),
            ),
            Transform.translate(
              offset: const Offset(0.0, 7.0),
              child: Divider(
                indent: 20.w,
                endIndent: 20.w,
              ),
            ),
            selected == true && selectedDateTime.day.isOdd
                ? Expanded(
                  child: AdaptiveScrollbar(
                    controller: scrollController,
                    width: 10.w,
                    underColor: Colors.transparent,
                    position: ScrollbarPosition.right,
                    sliderDecoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(29.r)
                    ),
                    sliderHeight: 80.h,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      controller: scrollController,
                      itemCount: str.length,
                      itemBuilder: (context, index) {
                        if(index == str.length - 1) {
                          return SizedBox(
                            height: 80,
                          );
                        }
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20.w, right: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  selectedIndex = index;
                                  setState(() {});
                                  context.read<OrderCubit>().updatePackage(
                                    context.read<OrderCubit>().state.package.package1,
                                    context.read<OrderCubit>().state.package.package2,
                                    context.read<OrderCubit>().state.package.package3,
                                    context.read<OrderCubit>().state.package.package4,
                                    str[index],
                                    selectedDateTime,);


                                },
                                child: Container(
                                  height: 62,
                                  width: 350.w,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: selectedIndex == index
                                              ? AppColors.mainDark
                                              : AppColors.main),
                                      borderRadius: BorderRadius.circular(24),
                                      color: selectedIndex == index
                                          ? AppColors.main
                                          : AppColors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        str[index],
                                        style: AppTextStyles.body16UnboundedMedium
                                            .copyWith(
                                            color: selectedIndex == index
                                                ? AppColors.white
                                                : AppColors.main),
                                      ),
                                      selectedIndex == index
                                          ? SvgPicture.asset(
                                        Assets.iconsCheck,
                                        colorFilter: ColorFilter.mode(
                                            selectedIndex == index
                                                ? AppColors.white
                                                : AppColors.main,
                                            BlendMode.srcIn),
                                      )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:16,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          Assets.imageDefTruck,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "НЕТ СВОБОДНЫХ СЛОТОВ",
                          style: AppTextStyles.body16UnboundedMedium,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Пожалуйста, выберите другой день для оформления вывоза вторсырья',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                        )
                      ],
                    ),
                  )
          ],
        ),
        selected == true && selectedDateTime.day.isOdd? Container(
          margin: EdgeInsets.only(bottom: 16),
          child: CommonWidgetButton(
              colorButton: AppColors.main,
              textColor: AppColors.white,
              text: "ДАЛЕЕ",
              openPath: () {
                if(selectedIndex == -1){

                } if(selectedIndex == 0 || selectedIndex == 1){
                  context.pushNamed("check_info");
                }

                if(selectedIndex ==2 ) {
                  context.pushNamed("time_up");
                }

              }),
        ): SizedBox.shrink(),
      ],
    );
  }
}
