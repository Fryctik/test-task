import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';

import '../../../widgets/custom_check.dart';

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
    return  Padding(
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
            selectedItem: selectedItem,
            customList: citiesList,
            onTap: selectedCity,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomPriceTariff(
            available: true,
            price: 780,
            typeTariff: TypeTariff.courierExport,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomPriceTariff(
            available: true,
            price: 780,
            typeTariff: TypeTariff.truckExport,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomPriceTariff(
            available: false,
            price: 1000,
            typeTariff: TypeTariff.warehouseExport,
          ),
        ],
      ),
    );
  }
}
