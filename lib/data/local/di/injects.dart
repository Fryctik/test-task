import 'package:get/get.dart';
import 'package:test/presentation/manager/navigation/navigation_cubit.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test/presentation/pages/achievements/manager/achievements_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/delivery_address_cubit.dart';
import 'package:test/presentation/pages/main/manager/main_cubit.dart';
import 'package:test/presentation/pages/main/view/usluga/manager/sevice_cubit.dart';
import 'package:test/presentation/pages/only_nav_bar/manager/only_nav_bar_cubit.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';

/// внедряем зависимости, чтобы можно было вызвать в любом месте приложения
Future initMain() async {

  // Get.put<DioClient>(DioClient(Dio()));
  // Get.put<Api>(Api());

  // Get.put<Connectivity>(Connectivity());

  Get.put<NavigationCubit>(NavigationCubit());
  Get.put<OnlyNavBarCubit>(OnlyNavBarCubit());
  Get.put<MainCubit>(MainCubit());
  Get.put<ProfileCubit>(ProfileCubit());
  Get.put<CartCubit>(CartCubit());
  Get.put<DeliveryAddressCubit>(DeliveryAddressCubit());
  Get.put<OrderCubit>(OrderCubit());
  Get.put<ServiceCubit>(ServiceCubit());
  Get.put<AchievementsCubit>(AchievementsCubit());
}