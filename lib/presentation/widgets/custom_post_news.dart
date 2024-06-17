import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/read_more_text.dart';



class CustomPostNews extends StatefulWidget {
  final String text;
  final int short = 2;

  CustomPostNews({required this.text});

  @override
  _CustomPostNewsState createState() => _CustomPostNewsState();
}

class _CustomPostNewsState extends State<CustomPostNews> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: 350,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.imageDeliveryman),
          Text("Запустили доставку в Химках!",style: AppTextStyles.body16GeologicaSemiBold,),

          ReadMoreText(
            widget.text,
            numLines: 3,

            readLessText: 'Скрыть',

            readMoreText: 'Подробнее',
            readMoreAlign: AlignmentDirectional.center,
            // The main or content text style.
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: AppColors.black, fontFamily: "Geologica-Light"),
            onReadMoreClicked: _onReadMoreClicked,
            // Specify the read more/less text style.
            readMoreIconColor: Colors.black,
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
  void _onReadMoreClicked() {}

}

