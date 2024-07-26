import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/presentation/pages/main/view/usluga/manager/sevice_cubit.dart';
import 'package:test/presentation/widgets/custom_check.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';


class CustomTariffView extends StatefulWidget {
  const CustomTariffView({super.key});

  @override
  State<CustomTariffView> createState() => _CustomTariffViewState();
}

class _CustomTariffViewState extends State<CustomTariffView> {
  String selectedItem = 'Выбрать';

  bool isError = false;

  void selectedCity(String item) {
    selectedItem = item;
    context.read<ServiceCubit>().city = item;

    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "ВЫБЕРИТЕ ГОРОД",
            style: AppTextStyles.body16UnboundedMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomDropdown(
            isError: isError,
            selectedItem: context.read<ServiceCubit>().city ?? 'Выбрать',
            customList: citiesList,
            onTap: selectedCity,
          ),
          if (selectedItem == "Выбрать") ...{
            const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "от 780",
                  typeTariff: TypeTariff.courierExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "780",
                  typeTariff: TypeTariff.truckExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "1000",
                  typeTariff: TypeTariff.warehouseExport,
                ),
              ],
            )
            },
          if (selectedItem == "Королев") ...{
            const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "780",
                  typeTariff: TypeTariff.courierExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "780",
                  typeTariff: TypeTariff.truckExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "1000",
                  typeTariff: TypeTariff.warehouseExport,
                ),
              ],
            )
          },
          if (selectedItem == "Москва") ...{
            const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "780",
                  typeTariff: TypeTariff.courierExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: true,
                  price: "780",
                  typeTariff: TypeTariff.truckExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: false,
                  price: "1000",
                  typeTariff: TypeTariff.warehouseExport,
                ),
              ],
            )
          },
          if (selectedItem == "Мытищи") ...{
            const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: false,
                  price: "780",
                  typeTariff: TypeTariff.courierExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: false,
                  price: "780",
                  typeTariff: TypeTariff.truckExport,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPriceTariff(
                  available: false,
                  price: "1000",
                  typeTariff: TypeTariff.warehouseExport,
                ),
              ],
            )
          }
        ],
      ),
    );
  }
}
