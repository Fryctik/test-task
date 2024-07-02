import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_state.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_check.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';


class MoreDetailsView extends StatefulWidget {
  const MoreDetailsView({super.key, required this.typeTariff});
  final TypeTariff typeTariff;

  @override
  State<MoreDetailsView> createState() => _MoreDetailsViewState();
}

class _MoreDetailsViewState extends State<MoreDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.white,
                padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(onBack: () {
                      context.pop();
                    }),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        "УСЛУГИ",
                        style: AppTextStyles.body16UnboundedMedium,
                      ),
                    ),
                    GestureDetector(onTap: () {
                      context.pushNamed("cart_view");
                    }, child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, cart) {
                        return CartBadge(itemCount: cart.products.length);
                      },
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.typeTariff == TypeTariff.courierExport ||
                                      widget.typeTariff == TypeTariff.truckExport
                                  ? Center(
                                      child: Image.asset(
                                      widget.typeTariff == TypeTariff.courierExport
                                          ? Assets.imageCustomLargus
                                          : Assets.imageCustomNormalT,
                                      width: 257.96,
                                      height: 134.91.h,
                                    ))
                                  : Center(
                                      child: Image.asset(Assets.imageCustomBigT,
                                          height: 134.91.h, width: 257.96)),
                              SizedBox(
                                height: 8.h,
                              ),
                              widget.typeTariff == TypeTariff.courierExport ||
                                      widget.typeTariff == TypeTariff.truckExport
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        widget.typeTariff == TypeTariff.courierExport
                                            ? "Вывоз курьером"
                                            : "Грузовой вывоз",
                                        style: AppTextStyles.body32UnboundedSemiBold,
                                        maxLines: 1,
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "Оптовый вывоз",
                                        style: AppTextStyles.body32UnboundedSemiBold,
                                        maxLines: 1,
                                      ),
                                    ),
                              widget.typeTariff == TypeTariff.courierExport ||
                                      widget.typeTariff == TypeTariff.truckExport
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        widget.typeTariff == TypeTariff.courierExport
                                            ? "750 руб"
                                            : "Бесплатно",
                                        style: AppTextStyles.body32UnboundedSemiBold
                                            .copyWith(color: AppColors.accent),
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "Заплатим вам",
                                        style: AppTextStyles.body32UnboundedSemiBold
                                            .copyWith(color: AppColors.accent),
                                      ),
                                    ),
                              SizedBox(
                                height: 10.h,
                              ),
                              widget.typeTariff == TypeTariff.courierExport ||
                                      widget.typeTariff == TypeTariff.truckExport
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        widget.typeTariff == TypeTariff.courierExport
                                            ? "Вывезем чистое и отсортированное на фракции вторсырье, согласно положениям инструкции, общим весом не более 20 кг"
                                            : "Бесплатно вывезем чистое вторсырье для дальнейшей переработки только одной фракции и общим весом от 100 кг",
                                        style: AppTextStyles.body16GeologicaLight,
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "Вывезем чистое и отсортированное на фракции вторсырье общим весом от 500 кг и заплатим вам по нашему прайсу",
                                        style: AppTextStyles.body16GeologicaLight,
                                      ),
                                    ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 84,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: AppColors.shade1,
                                          spreadRadius: 3,
                                          blurRadius: 3,
                                          offset: Offset(0, 1),
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(Assets.iconsActiveCaution),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: RichText(
                                              text: TextSpan(
                                                  style: AppTextStyles
                                                      .body16GeologicaLight,
                                                  text:
                                                      "Перед тем как заказать услугу, пожалуйста, ознакомьтесь с информацией в",
                                                  children: [
                                                TextSpan(

                                                    ///on tap

                                                    text: ' инструкции',
                                                    style: AppTextStyles
                                                        .body16GeologicaMedium
                                                        .copyWith(
                                                            color: AppColors.accent),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        context.pushNamed(
                                                            "instruction_page");
                                                      })
                                              ])),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  widget.typeTariff == TypeTariff.courierExport
                                      ? "В ней вы узнаете, какие фракции мы принимаем и как правильно подготовить вторсырье к сдаче на переработку"
                                      : "Убедитесь, что ваше вторсырьё подходят под условия оказания услуги, а также подготовьте вторсырьё к сдаче, обеспечив к нему беспрепятственный доступ и возможность погрузки",
                                  style: AppTextStyles.body14GeologicaLight
                                      .copyWith(color: AppColors.shade3),
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              CommonWidgetButton(
                                  text: widget.typeTariff == TypeTariff.courierExport
                                      ? 'ЗАКАЗАТЬ'
                                      : "ОСТАВИТЬ ЗАЯВКУ",
                                  colorButton: AppColors.main,
                                  textColor: AppColors.white,
                                  openPath: () {
                                    widget.typeTariff == TypeTariff.courierExport ? context.pushNamed("order_registered") : null;
                                    setState(() {
                                    });

                                    widget.typeTariff == TypeTariff.warehouseExport ||
                                            widget.typeTariff == TypeTariff.truckExport
                                        ? showModalBottomSheet(
                                            scrollControlDisabledMaxHeightRatio: 1,
                                            context: context,
                                            builder: (context) {
                                              return const ShowModalBottomSheetUpdate();
                                            },
                                          )
                                        : null;
                                  }),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ShowModalBottomSheetUpdate extends StatefulWidget {
  const ShowModalBottomSheetUpdate({super.key});

  @override
  State<ShowModalBottomSheetUpdate> createState() =>
      _ShowModalBottomSheetUpdateState();
}

bool _validateName = true;
bool _validateDes = true;

TextEditingController nameController = TextEditingController();
TextEditingController desController = TextEditingController();

void validateNameFunc() {
  if (nameController.text.isEmpty) {
    _validateName = false;
  } else {
    _validateName = true;
  }
}

void validateDesFunc() {
  if (desController.text.isEmpty) {
    _validateDes = false;
  } else {
    _validateDes = true;
  }
}

String selectedItem = 'Выбрать';

bool isError = false;

class _ShowModalBottomSheetUpdateState
    extends State<ShowModalBottomSheetUpdate> {
  ///imagePicker
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void selectedCity(String item) {
    selectedItem = item;
    setState(() {});
  }

  void errorChecker() {
    if (selectedItem == "Выбрать") {
      setState(() {});
      isError = true;
    } else {
      isError = false;
    }
  }

  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Container(
        height: 616,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Оформление заявки",
                            style: AppTextStyles.body16UnboundedMedium,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.shade1),
                              child: SvgPicture.asset(
                                Assets.iconsClose16x16,
                                height: 16,
                                width: 16,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Для оформления заявки укажите адрес вывоза, опишите и сфотографируйте ваше вторсырье",
                        style: AppTextStyles.body16GeologicaLight,
                      ),
                      const SizedBox(height: 22),
                      Text(
                        "Город",
                        style: AppTextStyles.body16GeologicaLight.copyWith(
                            color: isError ? AppColors.red : AppColors.shade3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDropdown(
                          isError: isError,
                          selectedItem: selectedItem,
                          customList: citiesList,
                          onTap: selectedCity),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Адрес вывоза",
                        style: AppTextStyles.body16GeologicaLight.copyWith(
                            color: !_validateName
                                ? AppColors.red
                                : AppColors.shade3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        focusNode: focusNode1,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        cursorColor: AppColors.main,
                        textCapitalization: TextCapitalization.sentences,
                        style: AppTextStyles.body16GeologicaLight,
                        decoration: InputDecoration(
                          hintStyle: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide: _validateName
                                ? const BorderSide(
                                    color: AppColors.main,
                                    width: 1,
                                  )
                                : BorderSide.none,
                          ),
                          fillColor: _validateName
                              ? AppColors.shade1
                              : AppColors.softRed,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Описание сырья",
                        style: AppTextStyles.body16GeologicaLight.copyWith(
                            color: !_validateDes
                                ? AppColors.red
                                : AppColors.shade3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        focusNode: focusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: desController,
                        cursorColor: AppColors.main,
                        textCapitalization: TextCapitalization.sentences,
                        style: AppTextStyles.body16GeologicaLight,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintStyle: AppTextStyles.body16GeologicaLight
                              .copyWith(color: AppColors.shade3),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide: _validateName
                                ? const BorderSide(
                                    color: AppColors.main,
                                    width: 1,
                                  )
                                : BorderSide.none,
                          ),
                          fillColor: _validateDes
                              ? AppColors.shade1
                              : AppColors.softRed,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.shade1),
                              child: SvgPicture.asset(
                                Assets.assetsIconsAttachments,
                                height: 24,
                                width: 24,
                                fit: BoxFit.scaleDown,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.accent, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Прикрепить фото",
                            style: AppTextStyles.body16GeologicaLight
                                .copyWith(color: AppColors.shade3),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
                CommonWidgetButton(
                  text: "ОТПРАВИТЬ",
                  colorButton: AppColors.main,
                  textColor: AppColors.white,
                  openPath: () {
                    validateDesFunc();
                    errorChecker();
                    validateNameFunc();

                    debugPrint(
                        "TAP '${nameController.text}' 2 '${desController.text}'");
                    debugPrint(_validateName.toString());
                    debugPrint(_validateDes.toString());

                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
