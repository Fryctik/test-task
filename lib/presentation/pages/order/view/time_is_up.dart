import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class TimeIsUp extends StatefulWidget {
  const TimeIsUp({super.key});

  @override
  State<TimeIsUp> createState() => _TimeIsUpState();
}

class _TimeIsUpState extends State<TimeIsUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: AppColors.white,
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: MediaQuery.of(context).viewPadding.top <= 52
                          ? 20.h
                          : 0),
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
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Время вышло...",
                    style: AppTextStyles.body32UnboundedSemiBold,
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imageDefTruck,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "ДАННЫЙ ВРЕМЕННОЙ СЛОТ БОЛЬШЕ НЕДОСТУПЕН",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body16UnboundedMedium,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Выберите другое время для\nоформления вывоза вторсырья",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),)
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CommonWidgetButton(
                    colorButton: AppColors.main,
                    textColor: AppColors.white,
                    text: "НАЗАД К ВЫБОРУ",
                    openPath: () {
                      context.pop();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
