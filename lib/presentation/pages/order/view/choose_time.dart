import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_data.dart';

class ChooseTime extends StatefulWidget {
  const ChooseTime({super.key});

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 68,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Выбор времени",
                        style: AppTextStyles.body32UnboundedSemiBold,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Выберите удобную для вас дату и время",
                        style: AppTextStyles.body16GeologicaLight
                            .copyWith(color: AppColors.shade3),
                      ),
                      SizedBox(height: 24,),

                    ],
                  ),
                ),
                Expanded(child: CustomData()),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
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
            ),

          ],
        ),
      ),
    );
  }
}
