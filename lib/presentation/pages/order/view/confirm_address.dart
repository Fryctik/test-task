import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class ConfirmAddress extends StatefulWidget {
  const ConfirmAddress({super.key});

  @override
  State<ConfirmAddress> createState() => _ConfirmAddressState();
}

class _ConfirmAddressState extends State<ConfirmAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: AppColors.white,
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(onBack: () {
                  context.pop();
                }),
                GestureDetector(
                  onTap: () {
                    context.pushNamed("cart_view");
                  },
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, cart) {
                      return CartBadge(itemCount: cart.totalQuantity);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Подтвердите адрес",
                      style: AppTextStyles.body32UnboundedSemiBold.copyWith(height: 1.2),
              
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Курьер приедет на указанную точку Пожалуйста, подтвердите правильность геолокации вашего адреса",
                          style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 250,
                            width: 350.w,
                            child: Image.asset(
                              Assets.imageAddressMap,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Адрес",
                              style: AppTextStyles.body16GeologicaLight
                                  .copyWith(color: AppColors.shade3),
                            ),
                            RichText(text: TextSpan(text: "г. ${context.read<OrderCubit>().state.order.city.capitalizeFirst}, ",
                                style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.black),
                                children: [
                                  TextSpan(
                                    text: "ул. ${context.read<OrderCubit>().state.order.address}",
                                    style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.black),
                                  ),
                                ]))
                          ],
              
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text( "${context.read<OrderCubit>().state.order.floor}, ",
                                style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.black)),
                            Text("кв. ${context.read<OrderCubit>().state.order.apartment}",
                                style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.black)),
              
              
                          ],
                        ),
              
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CommonWidgetButton(
              colorButton: AppColors.main,
              textColor: AppColors.white,
              text: "ПОДТВЕРДИТЬ", openPath: (){
                context.pushNamed("amount_of_package");
          }),
          SizedBox(height: 16,)
        ],
      )),
    );
  }
}
