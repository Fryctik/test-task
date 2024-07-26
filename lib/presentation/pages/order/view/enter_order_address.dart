import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/pages/order/component/address_text_field.dart';
import 'package:test/presentation/pages/order/component/appartment_text_field.dart';
import 'package:test/presentation/pages/order/component/code_text_field.dart';
import 'package:test/presentation/pages/order/component/doorway_text_field.dart';
import 'package:test/presentation/pages/order/component/floor_text_field.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class EnterOrderAddress extends StatefulWidget {
  const EnterOrderAddress({super.key});

  @override
  State<EnterOrderAddress> createState() => _EnterOrderAddressState();
}

class _EnterOrderAddressState extends State<EnterOrderAddress> {

  ScrollController controller = ScrollController();

  final TextEditingController addressController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool _validateAddress = true;
  void validateAddress(String name) {
    if (addressController.text.isEmpty) {
      _validateAddress = false;
    } else {
      _validateAddress = true;
    }
  }

  final TextEditingController floorController = TextEditingController();
  FocusNode focusNode2 = FocusNode();
  bool _validateFloor = true;
  void validateFloor(String name) {
    if (floorController.text.isEmpty) {
      _validateFloor = false;
    } else {
      _validateFloor = true;
    }
  }

  final TextEditingController codeController = TextEditingController();
  FocusNode focusNode4 = FocusNode();

  bool _validateCode = true;
  void validateCode(String name) {
    if (codeController.text.isEmpty) {
      _validateCode = false;
    } else {
      _validateCode = true;
    }
  }

  final TextEditingController doorWayController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  bool _validateDoorWay = true;
  void validateDoorWay(String name) {
    if (doorWayController.text.isEmpty) {
      _validateDoorWay = false;
    } else {
      _validateDoorWay = true;
    }
  }

  final TextEditingController appartmentController = TextEditingController();
  FocusNode focusNode3 = FocusNode();
  bool _validateAppartment = true;
  void validateAppartment(String name) {
    if (appartmentController.text.isEmpty) {
      _validateAppartment = false;
    } else {
      _validateAppartment = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 68,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Введите ваш адрес",
                        style: AppTextStyles.body32UnboundedSemiBold.copyWith(height: 1.2),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Адрес",
                            style: AppTextStyles.body16GeologicaLight
                                .copyWith(color: AppColors.shade3),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Focus(
                            onFocusChange: (focus) {
                              if(focus) {
                                if(controller.position.pixels != controller.position.maxScrollExtent) {
                                  controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                }
                              }
                            },
                            child: AddressTextField(
                                addressController: addressController,
                                isValidateAddress: _validateAddress,
                                focusNode: focusNode,
                              onSubmitted: (text) {
                                  FocusScope.of(context).requestFocus(focusNode1);
                                  if(controller.position.pixels != controller.position.maxScrollExtent) {
                                    controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                  }
                                },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Подъезд",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                "Этаж",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Focus(
                                  onFocusChange: (focus) {
                                    if(focus) {
                                      if(controller.position.pixels != controller.position.maxScrollExtent) {
                                        controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                      }
                                    }
                                  },
                                  child: DoorWayTextField(
                                      doorWayController: doorWayController,
                                      isValidatedoorWay: _validateDoorWay,
                                      focusNode: focusNode1,
                                    onSubmitted: (text) {
                                      FocusScope.of(context).requestFocus(focusNode2);
                                      if(controller.position.pixels != controller.position.maxScrollExtent) {
                                        controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Focus(
                                    onFocusChange: (focus) {
                                      if(focus) {
                                        if(controller.position.pixels != controller.position.maxScrollExtent) {
                                          controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                        }
                                      }
                                    },
                                    child: FloorTextField(
                                        floorController: floorController,
                                        isValidateFloor: _validateFloor,
                                        focusNode: focusNode2,
                                      onSubmitted: (text) {
                                        FocusScope.of(context).requestFocus(focusNode3);
                                        if(controller.position.pixels != controller.position.maxScrollExtent) {
                                          controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                        }
                                      }
                                      // },
                                    ),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Квартира",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                "Код домофона",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),

                              ///given size
                              SizedBox(
                                width: 44.w,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Focus(
                                    onFocusChange: (focus) {
                                      if(focus) {
                                        if(controller.position.pixels != controller.position.maxScrollExtent) {
                                          controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                        }
                                      }
                                    },
                                    child: AppartmentTextField(
                                        appartmentController: appartmentController,
                                        isValidateAppartment: _validateAppartment,
                                        focusNode: focusNode3,
                                      onSubmitted: (text) {
                                        FocusScope.of(context).requestFocus(focusNode4);
                                        if(controller.position.pixels != controller.position.maxScrollExtent) {
                                          controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                        }
                                      },
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Focus(
                                    onFocusChange: (focus) {
                                      if(focus) {
                                        if(controller.position.pixels != controller.position.maxScrollExtent) {
                                          controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                        }
                                      }
                                    },
                                    child: CodeTextField(
                                        codeController: codeController,
                                        isValidateCode: _validateCode,
                                        focusNode: focusNode4,
                                      // onSubmitted: (text) {
                                      //   controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.linear);
                                      // },
                                    ),
                                  ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h),
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
                    ),
                  ],
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
                      openPath: () {
                        validateCode(codeController.text);
                        validateAddress(addressController.text);
                        validateDoorWay(doorWayController.text);
                        validateFloor(floorController.text);
                        validateAppartment(appartmentController.text);
                        focusNode.unfocus();
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                        focusNode3.unfocus();
                        focusNode4.unfocus();
                        if (_validateCode == false ||
                            _validateAddress == false ||
                            _validateDoorWay == false ||
                            _validateFloor == false ||
                            _validateAppartment == false) {
                          setState(() {});
                        } else {
                          FocusManager.instance.primaryFocus!.unfocus();
                          context.read<OrderCubit>().updateOrder( context.read<OrderCubit>().state.order.city, addressController.text, floorController.text, codeController.text, doorWayController.text, appartmentController.text);
                          Future.delayed(Duration(milliseconds: 300), () {
                            context.pushNamed("confirm_address");
                          });
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
