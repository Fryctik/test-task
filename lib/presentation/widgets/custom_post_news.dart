import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/read_more_text.dart';



class CustomPostNews extends StatefulWidget {
  final String text;


  CustomPostNews({required this.text});

  @override
  _CustomPostNewsState createState() => _CustomPostNewsState();
}

class _CustomPostNewsState extends State<CustomPostNews> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: 350,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.imageDeliveryman),
          SizedBox(height: 15),
          Text("Запустили доставку в Химках!",style: AppTextStyles.body16GeologicaSemiBold,),
          AnimatedContainer(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeInOut,
            constraints: BoxConstraints(
              maxHeight: expanded ? MediaQuery.of(context).size.height : 3 * 23.h, // 3 lines with 24.0 font height
            ),
            child: Text(
              widget.text,
              style: AppTextStyles.body16GeologicaLight,
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: expanded ?  Row(
                  children: [
                    Text('Скрыть' , style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3),),
                    SvgPicture.asset(Assets.iconsArrowUp ,colorFilter: ColorFilter.mode(AppColors.shade3, BlendMode.srcIn),)
                  ],
                ) :   Row(
                  children: [
                    Text('Подробнее' , style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3,),),
                    SvgPicture.asset(Assets.assetsIconsArrowDown,colorFilter: ColorFilter.mode(AppColors.shade3, BlendMode.srcIn),)
                  ],
                ) ,
              ),
            ],
          ),
          SizedBox(height: 16,),
          Divider(
            height: 1,
            color: AppColors.shade1,
          ),
        ],
      ),
    );
  }


}




