import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_state.dart';
import 'package:test/presentation/pages/main/manager/delivery_address/delivery_address_cubit.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class CheckDelivery extends StatefulWidget {
  const CheckDelivery({super.key});

  @override
  State<CheckDelivery> createState() => _CheckDeliveryState();
}

class _CheckDeliveryState extends State<CheckDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top <= 52 ? 27.h : 0, right: 20, left: 20),
              color: AppColors.white,
              child: CustomBackButton(
                onBack: () {
                  context.pop();
                },
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Проверка\nданных",
                                style: AppTextStyles.body32UnboundedSemiBold,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "ТОВАРЫ",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ...List.generate(state.products.length, (index) {
                              final product = state.products.keys.elementAt(index);
                              final quantity = state.products[product];
                              return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 89,
                                        width: 89,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: AppColors.shade1,
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: Image.asset(product.imagePath)),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 115,
                                          child: Text(
                                            product.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles
                                                .body16GeologicaSemiBold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            product.size != null
                                                ? Text(
                                                    product.size ?? "",
                                                    style: AppTextStyles
                                                        .body14GeologicaLight
                                                        .copyWith(
                                                            color:
                                                                AppColors.shade3),
                                                  )
                                                : const SizedBox.shrink(),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              product.color == AppColors.black
                                                  ? "черный"
                                                  : "белый",
                                              style: AppTextStyles
                                                  .body14GeologicaLight
                                                  .copyWith(
                                                      color: AppColors.shade3),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "${int.tryParse(product.price)! * quantity!}₽",
                                            style: AppTextStyles
                                                .body16GeologicaSemiBold),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartCubit>()
                                                    .decrementProduct(product);
                                              },
                                              child: Container(
                                                height: 28,
                                                width: 28,
                                                padding: const EdgeInsets.all(9.0),
                                                decoration: BoxDecoration(
                                                    color: AppColors.shade1,
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                child: SvgPicture.asset(
                                                  Assets.iconsMinus16x16,
                                                  height: 2,
                                                  width: 7.5,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text('$quantity'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartCubit>()
                                                    .addProduct(product);
                                              },
                                              child: Container(
                                                height: 28,
                                                width: 28,
                                                padding: const EdgeInsets.all(9.0),
                                                decoration: BoxDecoration(
                                                    color: AppColors.shade1,
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                child: SvgPicture.asset(
                                                  Assets.iconsPlus16x16,
                                                  height: 2,
                                                  width: 7.5,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          child: SvgPicture.asset(
                                              Assets.iconsDisabledTrash),
                                          onTap: () {
                                            context
                                                .read<CartCubit>()
                                                .deleteProduct(product);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                            SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "АДРЕС ПОЛУЧЕНИЯ",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Город",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  Text(
                                    "Новосибирск",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Служба доставки",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  Text(
                                    "СДЭК",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Пункт получения",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          context
                                              .read<DeliveryAddressCubit>()
                                              .state
                                              .orderAddress
                                              .city,
                                          textAlign: TextAlign.end,
                                          style: AppTextStyles.body16GeologicaLight
                                              .copyWith(color: AppColors.shade3),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          context
                                              .read<DeliveryAddressCubit>()
                                              .state
                                              .orderAddress
                                              .address,
                                          textAlign: TextAlign.end,
                                          style: AppTextStyles.body16GeologicaLight
                                              .copyWith(color: AppColors.shade3),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          context
                                              .read<DeliveryAddressCubit>()
                                              .state
                                              .orderAddress
                                              .time,
                                          textAlign: TextAlign.end,
                                          style: AppTextStyles.body16GeologicaLight
                                              .copyWith(color: AppColors.shade3),
                                        ),
                                        Text(
                                          context
                                              .read<DeliveryAddressCubit>()
                                              .state
                                              .orderAddress
                                              .number,
                                          textAlign: TextAlign.end,
                                          style: AppTextStyles.body16GeologicaLight
                                              .copyWith(color: AppColors.shade3),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "ПЕРСОНАЛЬНЫЙ ДАННЫЕ",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ФИО",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),
                                      Text(
                                        context
                                            .read<DeliveryAddressCubit>()
                                            .state
                                            .deliveryAddress
                                            .name,
                                        style: AppTextStyles.body16GeologicaLight,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
              
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Email",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),
                                      Text(
                                        context
                                            .read<DeliveryAddressCubit>()
                                            .state
                                            .deliveryAddress
                                            .email,
                                        style: AppTextStyles.body16GeologicaLight,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Телефон",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),                                Text(
                                        context
                                            .read<DeliveryAddressCubit>()
                                            .state
                                            .deliveryAddress
                                            .number,
                                        style: AppTextStyles.body16GeologicaLight,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Комментарий",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),                                Text(
                                        context
                                            .read<DeliveryAddressCubit>()
                                            .state.comment,
                                        style: AppTextStyles.body16GeologicaLight,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "СУММА К ОПЛАТЕ",
                                    style: AppTextStyles.body16UnboundedMedium,
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Товары",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),                            Text(
                                        "${context.read<CartCubit>().state.totalCost.toInt().toString()}₽",
                                        style: AppTextStyles.body16GeologicaLight,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
              
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Доставка",
                                        style: AppTextStyles.body16GeologicaLight
                                            .copyWith(color: AppColors.shade3),
                                      ),                            Text(
                                        "${400}₽",
                                        style: AppTextStyles.body16GeologicaLight,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 15,),
              
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Итоговая сумма",
                                        style: AppTextStyles.body16GeologicaSemiBold,
                                      ),                            Text(
                                        "${ int.tryParse( (context.read<CartCubit>().state.totalCost + 400).toStringAsFixed(0)) }₽",
                                        style: AppTextStyles.body16GeologicaSemiBold,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 34,),
              
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  CommonWidgetButton(
                      colorButton: AppColors.main,
                      textColor: AppColors.white,
                      text: "ПЕРЕЙТИ К ОПЛАТЕ",
                      openPath: () {
                        Future.delayed(Duration(milliseconds: 300),(){
                          context.pushReplacementNamed("successful_order");
                        });
                      }),
                  SizedBox(height: 10,),
              
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
