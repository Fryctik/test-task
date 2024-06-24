import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/view/more_details_view.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';

import '../../../widgets/custom_serice_card.dart';

class CustomService extends StatelessWidget {
  const CustomService({super.key, required this.pageController});

  final PageController pageController;

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
            pageController.jumpToPage(0);
          }),
        ),
        title: Text(
          "УСЛУГИ",
          style: AppTextStyles.body16UnboundedMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            GestureDetector(
                onTap: () {
                  pageController.jumpToPage(4);

                },
                child: ServiceCard(
                  description:
                      'Вывезем отсортированное на фракции и чистое вторсырье',
                  kilogram: 20,
                  price: "750",
                  typeTariff: TypeTariff.courierExport,
                  available: true,
                )),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: (){
                pageController.jumpToPage(5);

              },
              child: ServiceCard(
                description:
                    'Вывезем чистое вторсырье ТОЛЬКО одной фракции',
                kilogram: 20,
                price: "750",
                typeTariff: TypeTariff.truckExport,
                available: true,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                  onTap: (){
                    pageController.jumpToPage(6);


                  },
              child: ServiceCard(
                description:
                    'Вывезем чистое вторсырье разных фракций',
                kilogram: 20,
                price: "750",
                typeTariff: TypeTariff.warehouseExport,
                available: true,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
