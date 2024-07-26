import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test/presentation/pages/main/view/market/components/comment_text_field.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/notofications/show_info_notification.dart';

class CheckInfo extends StatefulWidget {
  const CheckInfo({super.key});

  @override
  State<CheckInfo> createState() => _CheckInfoState();
}


class _CheckInfoState extends State<CheckInfo> {
  FocusNode focusNode = FocusNode();

  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
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
                                "Проверка данных",
                                style: AppTextStyles.body32UnboundedSemiBold
                                    .copyWith(height: 1.2),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Проверьте правильность введенных данных",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "УСЛУГА",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 89,
                                width: 350.w,
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.shade1,
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Вывоз курьером',
                                          style: AppTextStyles
                                              .body16GeologicaSemiBold,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "750₽",
                                              style: AppTextStyles
                                                  .body16GeologicaSemiBold,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              height: 25,
                                              width: 81,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColors.main),
                                              child: Center(
                                                  child: Text(
                                                "до 20 кг",
                                                style: AppTextStyles
                                                    .body14GeologicaMedium
                                                    .copyWith(
                                                        color: AppColors.white),
                                              )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                      Assets.imageCustomLargus,
                                      height: 57,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 1,
                                color: AppColors.shade1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "ПЕРСОНАЛЬНЫЕ ДАННЫЕ",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Имя",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  Text(
                                    context.read<ProfileCubit>().state.name,
                                    style: AppTextStyles.body16GeologicaLight,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Адрес",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              "г. ${context.read<OrderCubit>().state.order.city.capitalizeFirst}, ",
                                          style: AppTextStyles
                                              .body16GeologicaLight
                                              .copyWith(color: AppColors.black),
                                          children: [
                                        TextSpan(
                                          text:
                                              "ул. ${context.read<OrderCubit>().state.order.address}",
                                          style: AppTextStyles
                                              .body16GeologicaLight
                                              .copyWith(color: AppColors.black),
                                        ),
                                      ]))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "${context.read<OrderCubit>().state.order.floor}, ",
                                      style: AppTextStyles.body16GeologicaLight
                                          .copyWith(color: AppColors.black)),
                                  Text(
                                      "кв. ${context.read<OrderCubit>().state.order.apartment}",
                                      style: AppTextStyles.body16GeologicaLight
                                          .copyWith(color: AppColors.black)),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Телефон",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  Text(
                                    context
                                        .read<ProfileCubit>()
                                        .state
                                        .phoneNumber,
                                    style: AppTextStyles.body16GeologicaLight,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  Text(
                                    context.read<ProfileCubit>().state.email,
                                    style: AppTextStyles.body16GeologicaLight,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Дата и время",
                                    style: AppTextStyles.body16GeologicaLight
                                        .copyWith(color: AppColors.shade3),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        context
                                            .read<OrderCubit>()
                                            .state
                                            .dateTime
                                            .day
                                            .toString(),
                                        style:
                                            AppTextStyles.body16GeologicaLight,
                                      ),
                                      Text(
                                          " ${DateFormat('MMMM', 'ru').format(context.read<OrderCubit>().state.dateTime)} с ",
                                          style: AppTextStyles
                                              .body16GeologicaLight),
                                      Text(
                                        context.read<OrderCubit>().state.data,
                                        style:
                                            AppTextStyles.body16GeologicaLight,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 1,
                                color: AppColors.shade1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Комментарий к заказу",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CommentTextField(
                                  commentController: context.read<OrderCubit>().commentController,
                                  focusNode: focusNode),
                              SizedBox(
                                height: 32,
                              ),
                              MyCheckboxWidget(),
                              SizedBox(
                                height: 24,
                              ),
                              Container(
                                height: 104,
                                width: 350.w,
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.shade1,
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 1),
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsActiveCaution),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                        child: Text(
                                      "Если хотите изменить данные в одном из пунктов, пожалуйста, вернитесь на соответствующую страницу",
                                      style: AppTextStyles.body16GeologicaLight.copyWith(
                                          height: 20 / 16.sp
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CommonWidgetButton(
                        colorButton: AppColors.main,
                        textColor: AppColors.white,
                        text: "ПЕРЕЙТИ К ОПЛАТЕ",
                        openPath: () {
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pushNamed("order_registered");
                        }),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class MyCheckboxWidget extends StatefulWidget {
  const MyCheckboxWidget({
    super.key,
  });

  @override
  _MyCheckboxWidgetState createState() => _MyCheckboxWidgetState();
}

class _MyCheckboxWidgetState extends State<MyCheckboxWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          if (_isSelected == true) {
            showInfoNotification(context,
              "Выбрав этот пункт, вы соглашаетесь на возможный вывоз вторсырья ранее указанного времени и будете уведомлены о прибытии курьера", 100);
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.shade1,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Center(
                  child: _isSelected? SvgPicture.asset(Assets.iconsCheckboxCustom): const SizedBox.shrink(),
                ),
              ),
            ),
          ),
          SizedBox(width: 14),
          Flexible(
            child: Text(
              'Если курьер освободится раньше, забрать мой заказ',
              style: AppTextStyles.body16GeologicaLight.copyWith(
                color: _isSelected ? AppColors.black : AppColors.shade3,
                height: 20 / 16.sp
              ),
            ),
          ),
        ],
      ),
    );
  }
}
