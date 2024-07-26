import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class EmptyHistoryView extends StatelessWidget {
  const EmptyHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text("ИСТОРИЯ ЗАКАЗОВ",style: AppTextStyles.body16UnboundedMedium,),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  context.pushNamed("history_page");
                },
                child: Image.asset(Assets.imageImgSmile,height: 120,width: 120,fit: BoxFit.cover,)),
            SizedBox(
              height: 12,
            ),
            Text(
              "ОЙ,ПУСТО!",
              textAlign: TextAlign.center,
              style: AppTextStyles.body16UnboundedMedium,
            ),
            SizedBox(
              height: 8,
            ),
            Text("Пока тут нет заказов",
              textAlign: TextAlign.center,
              style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),)
          ],
        ),
      ),
    );
  }
}
