import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/delivery_address/delivery_address_cubit.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class SuccessfulOrder extends StatelessWidget {
  const SuccessfulOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Text(""),
        actions: [
          GestureDetector(
            onTap: (){
              context.read<CartCubit>().clearCart();
              context.pop();
              context.pop();
              context.pop();
              context.pop();
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                Assets.iconsClose,colorFilter: ColorFilter.mode(AppColors.accent,BlendMode.srcIn),),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 140,),
          Center(child: Image.asset(Assets.imageImgSuccess,height: 130,width: 130,)),
          SizedBox(height: 10),
          Center(child: Text("СПАСИБО ЗА ЗАКАЗ",style: AppTextStyles.body16UnboundedMedium,)),
          SizedBox(height: 5,),
          Center(
            child: RichText(
                text: TextSpan(
                    text: "Сумма заказа: ",
                    style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
                    children: [
                      TextSpan(
                          text: "${context.read<CartCubit>().state.totalCost.toStringAsFixed(0)}₽",
                          style: AppTextStyles.body16GeologicaLight
                      )
                    ])),
          ),
          SizedBox(height: 5,),
          Center(child: Text("Письмо с информацией о заказе\n и трек номер СДЭК были отправлены\nна вашу почту",style: AppTextStyles.body16GeologicaLight,textAlign: TextAlign.center,)),
         Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CommonWidgetButton(
                colorButton: AppColors.main,
                textColor: AppColors.white,
                text: "НА ГЛАВНУЮ", openPath: (){
              context.read<CartCubit>().clearCart();
              Future.delayed(Duration(milliseconds: 300),(){
                context.go("/main");
              });
            }),
          ),
        ],
      ),
    );
  }
}
