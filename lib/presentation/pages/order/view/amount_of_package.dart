import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_check.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class AmountOfPackage extends StatefulWidget {
  const AmountOfPackage({super.key});

  @override
  State<AmountOfPackage> createState() => _AmountOfPackageState();
}

class _AmountOfPackageState extends State<AmountOfPackage> {
  String selectedItem = 'Выбрать';

  bool isError = false;
  void selectedAmount(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  void errorChecker() {
    if (selectedItem == "Выбрать") {
      isError = true;
    } else {
      isError = false;
    }
    setState(() {});
  }

  String selectedItem1 = 'Выбрать';

  bool isError1 = false;
  void selectedAmount1(String item) {
    setState(() {
      selectedItem1 = item;
    });
  }

  void errorChecker1() {
    if (selectedItem1 == "Выбрать") {
      isError1 = true;
    } else {
      isError1 = false;
    }
    setState(() {});
  }

  String selectedItem2 = 'Выбрать';

  bool isError2 = false;
  void selectedAmount2(String item) {
    setState(() {
      selectedItem2 = item;
    });
  }

  void errorChecker2() {
    if (selectedItem2 == "Выбрать") {
      isError2 = true;
    } else {
      isError2 = false;
    }
    setState(() {});
  }

  String selectedItem3 = 'Выбрать';

  bool isError3 = false;
  void selectedAmount3(String item) {
    setState(() {
      selectedItem3 = item;
    });
  }

  void errorChecker3() {
    if (selectedItem3 == "Выбрать") {
      isError3 = true;
    } else {
      isError3 = false;
    }
    setState(() {});
  }

  String selectedItem4 = 'Выбрать';

  bool isError4 = false;
  void selectedAmount4(String item) {
    setState(() {
      selectedItem4 = item;
    });
  }

  void errorChecker4() {
    if (selectedItem4 == "Выбрать") {
      isError4 = true;
    } else {
      isError4 = false;
    }
    setState(() {});
  }

  void changePage(){
    {
      if (selectedItem == 'Выбрать') {
        errorChecker();
      } else {
        errorChecker();
        if (selectedItem == "1 пакет") {
          errorChecker1();
          print("done1");
          context
              .read<OrderCubit>()
              .updatePackage(selectedItem1, '', '', '','',DateTime.now(), );
        }
        if (selectedItem == "2 пакета") {
          errorChecker1();
          errorChecker2();
          context.read<OrderCubit>().updatePackage(
              selectedItem1, selectedItem2, '', '','',DateTime.now(),);
        }
        if (selectedItem == "3 пакета") {
          errorChecker1();
          errorChecker2();
          errorChecker3();

          print("3");
          context.read<OrderCubit>().updatePackage(
              selectedItem1, selectedItem2, selectedItem3, '','',DateTime.now(),);
        }
        if (selectedItem == "4 пакета") {
          errorChecker1();
          errorChecker2();
          errorChecker3();
          errorChecker4();

          context.read<OrderCubit>().updatePackage(
              selectedItem1,
              selectedItem2,
              selectedItem3,
              selectedItem3,'',DateTime.now(), );
        }
      }
      setState(() {});

      if (!isError && selectedItem == "1 пакет" && !isError1 ||
          selectedItem == "2 пакета" &&
              !isError1 &&
              !isError2 ||
          selectedItem == "3 пакета" &&
              !isError1 &&
              !isError2 &&
              !isError3 ||
          selectedItem == "4 пакета" &&
              !isError1 &&
              !isError2 &&
              !isError3 &&
              !isError4) {
        context.pushNamed("choose_time");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: selectedItem == "Выбрать" ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics() ,
              child: Column(
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
                          "Количество пакетов",
                          style: AppTextStyles.body32UnboundedSemiBold.copyWith(height: 1.2),

                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Укажите количество пакетов, которые вы хотите сдать",
                          style: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomDropdown(
                            isError: isError,
                            selectedItem: selectedItem,
                            customList: amountOfPackage,
                            onTap: selectedAmount),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Нам важно знать данную информацию, так как каждому пакету будет присвоен уникальный QR-код, который поможет составить статистику для ваших достижений",
                          style: AppTextStyles.body14GeologicaLight
                              .copyWith(color: AppColors.shade3),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          "СОДЕРЖИМОЕ ПАКЕТОВ",
                          style: AppTextStyles.body16UnboundedMedium,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        if (selectedItem == "1 пакет") ...{
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 1",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError1,
                                    selectedItem: selectedItem1,
                                    customList: typePackages,
                                    onTap: selectedAmount1),
                              ),
                            ],
                          )
                        },
                        if (selectedItem == "2 пакета") ...{
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 1",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError1,
                                    selectedItem: selectedItem1,
                                    customList: typePackages,
                                    onTap: selectedAmount1),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 2",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError2,
                                    selectedItem: selectedItem2,
                                    customList: typePackages,
                                    onTap: selectedAmount2),
                              ),
                            ],
                          )
                        },
                        if (selectedItem == "3 пакета") ...{
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 1",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError1,
                                    selectedItem: selectedItem1,
                                    customList: typePackages,
                                    onTap: selectedAmount1),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 2",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError2,
                                    selectedItem: selectedItem2,
                                    customList: typePackages,
                                    onTap: selectedAmount2),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 3",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError3,
                                    selectedItem: selectedItem3,
                                    customList: typePackages,
                                    onTap: selectedAmount3),
                              ),
                            ],
                          )
                        },
                        if (selectedItem == "4 пакета") ...{
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 1",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError1,
                                    selectedItem: selectedItem1,
                                    customList: typePackages,
                                    onTap: selectedAmount1),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 2",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError2,
                                    selectedItem: selectedItem2,
                                    customList: typePackages,
                                    onTap: selectedAmount2),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 3",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError3,
                                    selectedItem: selectedItem3,
                                    customList: typePackages,
                                    onTap: selectedAmount3),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Пакет 4",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: CustomDropdown(
                                    isError: isError4,
                                    selectedItem: selectedItem4,
                                    customList: typePackages,
                                    onTap: selectedAmount4),
                              ),
                            ],
                          )
                        },
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  )
                ],
              ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CommonWidgetButton(
                    colorButton: AppColors.main,
                    textColor: AppColors.white,
                    text: "ДАЛЕЕ",
                    openPath:changePage),
              ),
            )
          ],
        ),
      ),
    );
  }
}
