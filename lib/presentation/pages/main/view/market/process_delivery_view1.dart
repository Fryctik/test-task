import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/data/local/models/order_model.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/components/comment_text_field.dart';
import 'package:test/presentation/pages/main/manager/delivery_address/delivery_address_cubit.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class ProcessDeliveryView1 extends StatefulWidget {
  const ProcessDeliveryView1({super.key});

  @override
  State<ProcessDeliveryView1> createState() => _ProcessDeliveryView1State();
}

class _ProcessDeliveryView1State extends State<ProcessDeliveryView1> {

  bool select = false;

  bool isError = false;
  bool isSelected = false;

  void isErrorAddress(){

    if(selectedAddress == null){
      isError = false;
    }else{
      isError = true;
    }
  }

  final TextEditingController commentController = TextEditingController();

  List<OrderAddress> ordersAddress = [
    OrderAddress(
        city:
            "MSK647, Москва, ул. Зеленоградская Адрес: ул. Зеленоградская, 17",
        address: "Вход в ПВЗ со стороны Клинского проезда, на углу дома № 17.",
        time: "Время работы: Пн-Пт 10:00-21:00, Сб-Вс 10:00-20:00",
        number: "Телефон: +79672507081"),
    OrderAddress(
        city: "NSK647, Новосибирск, ул. Зеленоградская, 27",
        address: "Вход в ПВЗ со стороны Питерского проезда, на углу дома № 27",
        time: "Время работы: Пн-Пт 10:00-21:00, Сб-Вс 10:00-20:00",
        number: "Телефон: +79672507081"),
    OrderAddress(
        city:
            "MSK647, Москва, ул. Зеленоградская Адрес: ул. Зеленоградская, 11",
        address: "Вход в ПВЗ со стороны Клинского проезда, на углу дома № 11.",
        time: "Время работы: Пн-Пт 10:00-21:00, Сб-Вс 10:00-20:00",
        number: "Телефон: +79672507081"),
    OrderAddress(
        city: "NSK647, Новосибирск, ул. Зеленоградская, 01",
        address: "Вход в ПВЗ со стороны Питерского проезда, на углу дома № 01",
        time: "Время работы: Пн-Пт 10:00-21:00, Сб-Вс 10:00-20:00",
        number: "Телефон: +79672507081"),
  ];

  String? selectedAddress1;

  TextEditingController menusController = TextEditingController();
  FocusNode focusNode4 = FocusNode();

  FocusNode focusNodeDropdown = FocusNode();

  OrderAddress? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0, right: 20, left: 20),
                color: AppColors.white,
                child: CustomBackButton(
                  onBack: () {
                    context.pop();
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<DeliveryAddressCubit, DeliveryAddressState>(
                    builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Оформление доставки",
                            style: AppTextStyles.body32UnboundedSemiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Город",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: IgnorePointer(
                                ignoring: true,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintStyle: AppTextStyles.body16GeologicaLight,
                                    fillColor: AppColors.shade1,
                                    hintText: context
                                        .read<DeliveryAddressCubit>()
                                        .state
                                        .deliveryAddress.city,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 210,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 16,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppColors.shade1),
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              color: AppColors.main,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "СДЭК",
                                      style: AppTextStyles.body16GeologicaLight,
                                    ),
                                    Text(
                                      "от 3 дней, 400₽",
                                      style: AppTextStyles.body16GeologicaLight
                                          .copyWith(color: AppColors.shade3),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Пункт получения",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            selectedAddress == null
                                ? Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal:20),
                                        child: DropdownMenu<String>(
                                          onSelected: (String? newValue) {
                                            FocusManager.instance.primaryFocus!.unfocus();
                                            setState(() {
                                              selectedAddress1 = newValue;
                                              menusController.text = newValue!;
                                              if(ordersAddress.any((element)=> element.address == newValue)) {
                                                selectedAddress = ordersAddress.firstWhere((element)=> element.address == newValue);
                                              }
                                            });
                                          },
                                          // focusNode: focusNodeDropdown,
                                          trailingIcon: RotatedBox(
                                            quarterTurns: 2,
                                              child: SvgPicture.asset(Assets.assetsIconsArrowDown)),
                                          selectedTrailingIcon: SvgPicture.asset(Assets.assetsIconsArrowDown),
                                          width: 345.w,
                                          menuHeight: 200,
                                          controller: menusController,
                                          hintText: "Выберите пункт получения",
                                          requestFocusOnTap: true,
                                          enableFilter: true,
                                          enableSearch: true,
                                          menuStyle: MenuStyle(
                                            backgroundColor: WidgetStateProperty.all(AppColors.shade1),
                                          elevation: WidgetStateProperty.all(0)
                                          ),
                                          dropdownMenuEntries: [
                                            ...List.generate(ordersAddress.length, (index) {
                                              return DropdownMenuEntry(
                                                  value: ordersAddress[index].address,
                                                  label: ordersAddress[index].address);
                                            })
                                          ],
                                          inputDecorationTheme:
                                               InputDecorationTheme(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all( Radius.circular(0)),
                                              borderSide: BorderSide.none,
                                            ),
                                            // isDense: false,
                                            filled: true,
                                            fillColor: isError == false ? AppColors.shade1 : AppColors.softRed,
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 12),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      GestureDetector(
                                        onTap:(){
                                          ///go route qilish kere
                                          select = true;
                                          setState(() {
                
                                          });
                                        },
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 20),
                                                height: 250,
                                                width: MediaQuery.sizeOf(context).width,
                                                child: Image.asset(Assets.imageImgMap,fit: BoxFit.cover,),
                                              ),
                                             select == true?
                                             Container(
                                                margin: EdgeInsets.only(top:20),
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                height: 220,
                                                width: 350,
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
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Column(
                                                  crossAxisAlignment :CrossAxisAlignment.start,
                                                  mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("ТОМ22, Томск, пр. Фрунзе",style: AppTextStyles.body16GeologicaSemiBold.copyWith(color: AppColors.accent),),
                                                        GestureDetector(
                                                          onTap: (){
                                                            select = false;
                                                              setState(() {
                
                                                              });
                                                          },
                                                          child: SvgPicture.asset(Assets.iconsClose16x16,colorFilter: ColorFilter.mode(AppColors.accent, BlendMode.srcIn),),
                                                        )
                                                      ],
                                                    ),
                                                    Row(children: [
                                                      Text("Адрес:",style: AppTextStyles.body14GeologicaSemiBold.copyWith(color: AppColors.main),),
                                                      Text(" г. Королев, ул. Ленина 11",style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3),),
                                                    ],),
                                                    Row(children: [
                                                      Text("Время работы:",style: AppTextStyles.body12GeologicaSemiBold.copyWith(color: AppColors.main),),
                                                      Text(" Пн-Пт 09:00-21:00",style: AppTextStyles.body12GeologicaLight.copyWith(color: AppColors.shade3),),
                                                    ],),
                                                    Text("Пересечение цлиц Красноармейская и Фрунзе, вход ТЦ Европа со стороны ул. Красноамейская. Оставновка общественного транспорта ЦОТ",style: AppTextStyles.body11GeologicaLight.copyWith(color: AppColors.shade3),),
                
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal:  20),
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                        onPressed: (){
                                                      setState(() {
                                                        isSelected = true;
                                                        selectedAddress != null;
                
                                                      });
                                                          },
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: AppColors.shade1,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(24),
                                                            ),
                                                            padding: EdgeInsets.symmetric(vertical: 12)),
                                                        child: Text(
                                                          "ВЫБРАТЬ ЭТОТ ПУНКТ",
                                                          style: AppTextStyles.body14UnboundedMedium.copyWith(
                                                            color: AppColors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ): SizedBox.shrink()
                
                                            ],
                                          ),
                                        ),
                                      ),
                
                                    ],
                                  )
                                : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          selectedAddress!.city,
                                          style: AppTextStyles.body16GeologicaLight,
                                        ),
                                        Text(
                                          selectedAddress!.address,
                                          style: AppTextStyles.body16GeologicaLight
                                              .copyWith(color: AppColors.shade3),
                                        ),
                                        Text(
                                          selectedAddress!.time,
                                          style: AppTextStyles.body16GeologicaLight,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          selectedAddress!.number,
                                          style: AppTextStyles.body16GeologicaLight,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedAddress = null;
                                              });
                                            },
                                            child: Text(
                                              "Изменить",
                                              style: AppTextStyles
                                                  .body16GeologicaLight
                                                  .copyWith(
                                                      color: AppColors.accent),
                                            )),
                
                
                                      ],
                                    ),
                                ),
                
                
                            const SizedBox(
                              height: 16,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "ФИО",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: IgnorePointer(
                                ignoring: true,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: AppColors.shade1,
                                    hintStyle: AppTextStyles.body16GeologicaLight,
                                    hintText: context
                                        .read<DeliveryAddressCubit>()
                                        .state.deliveryAddress.name,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Email",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: IgnorePointer(
                                ignoring: true,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: AppColors.shade1,
                                    hintText: context
                                        .read<DeliveryAddressCubit>()
                                        .state
                                        .deliveryAddress.email,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintStyle: AppTextStyles.body16GeologicaLight,
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Телефон",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: IgnorePointer(
                                ignoring: true,
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: AppColors.shade1,
                                    hintText: context
                                        .read<DeliveryAddressCubit>()
                                        .state
                                        .deliveryAddress.number,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintStyle: AppTextStyles.body16GeologicaLight,
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Комментарий",
                                style: AppTextStyles.body16GeologicaLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: CommentTextField(
                                  commentController: commentController,
                                  focusNode: focusNode4),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CommonWidgetButton(
                            colorButton: AppColors.main,
                            textColor: AppColors.white,
                            text: "ПЕРЕЙТИ К ПРОВЕРКЕ",
                            openPath: () {
                              if(isSelected == true){
                                context.read<DeliveryAddressCubit>().updateOrderAddress(ordersAddress[0].city, ordersAddress[0].address, ordersAddress[0].time,  ordersAddress[0].number, '');
                
                              }else{
                                isErrorAddress();
                                context
                                    .read<DeliveryAddressCubit>().updateOrderAddress(selectedAddress!.city, selectedAddress!.address, selectedAddress!.time, selectedAddress!.number, commentController.text);
                
                              }
                
                              focusNode4.unfocus();
                              if(isError == true || isSelected ==true){
                                context.pushNamed("check_delivery");
                
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
