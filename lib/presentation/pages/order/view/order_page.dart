import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = -1;
  List str = ["КОРОЛЕВ", "МЫТЫЩИ", "МОСКВА"];


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
                  CustomBackButton(
                    onBack: () {
                      context.pop();
                    },
                  ),
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
                "Выберите ваш город",
                maxLines: 2,
                style: AppTextStyles.body32UnboundedSemiBold.copyWith(height: 1.2),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ...List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16, left: 20, right: 20),
                child: IgnorePointer(
                  ignoring: index == 2 ? true : false,
                  child: GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 62,
                      width: 350.w,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: index == 2
                                  ? AppColors.shade2
                                  : selectedIndex == index
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
                            style: AppTextStyles.body16UnboundedMedium.copyWith(
                                color: index == 2
                                    ? AppColors.shade2
                                    : selectedIndex == index
                                        ? AppColors.white
                                        : AppColors.main),
                          ),
                          index == 2
                              ? Text(
                                  "Скоро появится",
                                  style: AppTextStyles.body16GeologicaLight
                                      .copyWith(color: AppColors.shade2),
                                )
                              : selectedIndex == index
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
              );
            }),
            Spacer(),
            CommonWidgetButton(
                colorButton: AppColors.main,
                textColor: AppColors.white,
                text: "ДАЛЕЕ",
                openPath: () {
                  context.read<OrderCubit>().updateOrder(str[selectedIndex], '', '', '', '', '');
                  context.pushNamed("enter_order_address");
                }),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
