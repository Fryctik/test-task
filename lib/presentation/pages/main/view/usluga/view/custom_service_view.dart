import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/manager/navigation/navigation_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_state.dart';
import 'package:test/presentation/pages/main/view/usluga/manager/sevice_cubit.dart';
import 'package:test/presentation/pages/only_nav_bar/manager/only_nav_bar_cubit.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_price_tariff.dart';
import 'package:test/presentation/widgets/custom_serice_card.dart';


class CustomServiceView extends StatelessWidget {
  const CustomServiceView({super.key});

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
                  CustomBackButton(
                      onBack: () {
                        context.read<NavigationCubit>().statefulNavigationShell.goBranch(0);
                  },
                  ),
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
                      return CartBadge(itemCount: cart.totalQuantity);
                    },
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  context.read<OnlyNavBarCubit>().updateIndex(2);
                  context.read<ServiceCubit>().updateIndex(1);
                  context.pushNamed('more_detail_courier');
                },
                child: const ServiceCard(
                  description:
                      'Вывезем отсортированное на фракции и чистое вторсырье',
                  kilogram: 20,
                  price: "750",
                  typeTariff: TypeTariff.courierExport,
                  available: true,
                )),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed('more_detail_truck');
              },
              child: const ServiceCard(
                description: 'Вывезем чистое вторсырье ТОЛЬКО одной фракции',
                kilogram: 20,
                price: "750",
                typeTariff: TypeTariff.truckExport,
                available: true,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed('more_detail_warehouse');
              },
              child: const ServiceCard(
                description: 'Вывезем чистое вторсырье разных фракций',
                kilogram: 20,
                price: "750",
                typeTariff: TypeTariff.warehouseExport,
                available: true,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
