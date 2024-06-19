import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_check.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

import '../../../widgets/custom_price_tariff.dart';

class MoreDetailsView extends StatefulWidget {
  const MoreDetailsView({super.key, required this.typeTariff, required this.pageController});
  final TypeTariff typeTariff;
  final PageController pageController;

  @override
  State<MoreDetailsView> createState() => _MoreDetailsViewState();
}

class _MoreDetailsViewState extends State<MoreDetailsView> {

  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();

  bool _validateName = true;
  void validateName(String name) {
    if (nameController.text.isEmpty) {
      _validateName = false;
    } else {
      _validateName = true;
    }
  }

  String selectedItem = 'Выбрать';

  bool isError = false;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              Assets.iconsActiveCart,
              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ),
          ),
        ],
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CustomBackButton(onBack: () {
            widget.pageController.jumpToPage(1);
          }),
        ),
        title: Text(
          "УСЛУГИ",
          style: AppTextStyles.body16UnboundedMedium,
        ),
        centerTitle: true,
      ),
      body: Column(

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
                  height: 134.91,
                ))
              : Center(
                  child: Image.asset(Assets.imageCustomBigT,
                      height: 134.91, width: 257.96)),
          SizedBox(
            height: 16,
          ),
          widget.typeTariff == TypeTariff.courierExport ||
                  widget.typeTariff == TypeTariff.truckExport
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Text(
                    widget.typeTariff == TypeTariff.courierExport
                        ? "Вывоз курьером"
                        : "Грузовой вывоз",
                    style: AppTextStyles.body32UnboundedSemiBold,
                    maxLines: 1,
                  ),
              )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(
                    "Оптовый вывоз",
                    style: AppTextStyles.body32UnboundedSemiBold,
                    maxLines: 1,
                  ),
              ),
          widget.typeTariff == TypeTariff.courierExport ||
                  widget.typeTariff == TypeTariff.truckExport
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(
                    widget.typeTariff == TypeTariff.courierExport
                        ? "750 руб"
                        : "Бесплатно",
                    style: AppTextStyles.body32UnboundedSemiBold
                        .copyWith(color: AppColors.accent),
                  ),
              )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(
                    "Заплатим вам",
                    style: AppTextStyles.body32UnboundedSemiBold
                        .copyWith(color: AppColors.accent),
                  ),
              ),
          SizedBox(
            height: 10,
          ),
          widget.typeTariff == TypeTariff.courierExport ||
                  widget.typeTariff == TypeTariff.truckExport
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(
                    widget.typeTariff == TypeTariff.courierExport
                        ? "Вывезем чистое и отсортированное на фракции вторсырье, согласно положениям инструкции, общим весом не более 20 кг"
                        : "Бесплатно вывезем чистое вторсырье для дальнейшей переработки только одной фракции и общим весом от 100 кг",
                    style: AppTextStyles.body16GeologicaLight,
                  ),
              )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(
                    "Вывезем чистое и отсортированное на фракции вторсырье общим весом от 500 кг и заплатим вам по нашему прайсу",
                    style: AppTextStyles.body16GeologicaLight,
                  ),
              ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Container(
              height: 84,
              width: 350,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
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
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                            style: AppTextStyles.body16GeologicaLight,
                              text:
                                  "Перед тем как заказать услугу, пожалуйста, ознакомьтесь с информацией в",
                              children: [TextSpan(text: ' инструкции',
                                style: AppTextStyles.body16GeologicaMedium.copyWith(color: AppColors.accent),
                              )])),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(   widget.typeTariff == TypeTariff.courierExport ? "В ней вы узнаете, какие фракции мы принимаем и как правильно подготовить вторсырье к сдаче на переработку" : "Убедитесь, что ваше вторсырьё подходят под условия оказания услуги, а также подготовьте вторсырьё к сдаче, обеспечив к нему беспрепятственный доступ и возможность погрузки",style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3),),
          )
      ,
          Spacer(),
          CommonWidgetButton(
              text:  widget.typeTariff == TypeTariff.courierExport ?'ЗАКАЗАТЬ' : "ОСТАВИТЬ ЗАЯВКУ",
              colorButton: AppColors.main,
              textColor: AppColors.white,
              openPath: () {
                showModalBottomSheet(
                  scrollControlDisabledMaxHeightRatio: 1,
                  context: context,

                  builder: (context) {
                    return Container(
                      height: 616,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 25,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Оформление заявки",style: AppTextStyles.body16UnboundedMedium,),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);

                                        },
                                        child: Container(height: 24,width: 24,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: AppColors.shade1),
                                          child: SvgPicture.asset(Assets.iconsClose16x16,height: 16,width: 16,fit: BoxFit.scaleDown,),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Text("Для оформления заявки укажите адрес вывоза, опишите и сфотографируйте ваше вторсырье",style: AppTextStyles.body16GeologicaLight,),
                                  SizedBox(height: 22),
                                  Text("Город",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),)
                                  ,SizedBox(height: 10,),

                                  CustomDropdown(isError: isError, selectedItem: selectedItem, customList: citiesList, onTap:selectedCity)
                                  ,   SizedBox(height: 16,),
                                  Text("Адрес вывоза",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),)
                                  ,SizedBox(height: 10,),
                                  TextField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    controller:nameController,
                                    cursorColor: AppColors.main,
                                    textCapitalization: TextCapitalization.sentences,
                                    style: AppTextStyles.body16GeologicaLight,
                                    onChanged: (value) {},
                                    decoration:  InputDecoration(
                                      hintStyle: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: _validateName? BorderSide(
                                          color: AppColors.main,
                                          width: 1,
                                        ): BorderSide.none,
                                      ),

                                      fillColor: _validateName ? AppColors.shade1 : AppColors.softRed,
                                      filled: true,
                                    ),
                                  ),
                                  SizedBox(height: 16,),

                                  Text("Описание сырья",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),)
                                  ,SizedBox(height: 10,),
                                  TextField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                      controller:desController,
                                    cursorColor: AppColors.main,
                                    textCapitalization: TextCapitalization.sentences,
                                    style: AppTextStyles.body16GeologicaLight,
                                    onChanged: (value) {},
                                    decoration:  InputDecoration(
                                      hintStyle: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: _validateName? BorderSide(
                                          color: AppColors.main,
                                          width: 1,
                                        ): BorderSide.none,
                                      ),

                                      fillColor:  AppColors.shade1 ,
                                      filled: true,
                                    ),
                                  ),
                                  SizedBox(height: 16,),

                                  Row(
                                    children: [
                                      Container(
                                        height: 38,
                                        width:  38,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: AppColors.shade1),
                                        child: SvgPicture.asset(Assets.assetsIconsAttachments,height: 24,width: 24, fit: BoxFit.scaleDown,colorFilter: ColorFilter.mode(AppColors.accent, BlendMode.srcIn),),
                                      ),
                                      SizedBox(width: 12,),
                                      Text("Прикрепить фото",style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),)
                                    ],
                                  ),
                                  SizedBox(height: 32,),



                                ],
                              ),
                            ),
                            CommonWidgetButton(text: "ОТПРАВИТЬ",colorButton: AppColors.main, textColor: AppColors.white, openPath: (){},)

                          ],
                        ),
                      ),

                    );
                  },
                );
              }
          ),

                SizedBox(height: 60,)
        ],
      ),
    );
  }
}
