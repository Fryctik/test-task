import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/themes/themes.dart';



class CustomData extends StatefulWidget {
  const CustomData({super.key});

  @override
  State<CustomData> createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {


  @override
  Widget build(BuildContext context) {
    return  EasyDateTimeLine(
      locale: "ru_RU",
      activeColor: Colors.transparent,
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //`selectedDate` the new date selected.
        },

        dayProps:  EasyDayProps(
          todayStyle: DayStyle(
            dayNumStyle: AppTextStyles.body16UnboundedMedium.copyWith(color: AppColors.shade3),
                dayStrStyle: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3)
          ),
          activeDayStyle: DayStyle(
            decoration: const BoxDecoration(color: Colors.transparent),
              dayNumStyle: AppTextStyles.body16UnboundedMedium.copyWith(color: AppColors.main),
              dayStrStyle: AppTextStyles.body16GeologicaLight
          ),
          inactiveDayStyle: DayStyle(
          decoration: const BoxDecoration(color: Colors.transparent),
            dayStrStyle: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
            dayNumStyle: AppTextStyles.body16UnboundedMedium.copyWith(color: AppColors.shade3)),

          dayStructure: DayStructure.dayStrDayNum,

        ),
    );
  }
}
