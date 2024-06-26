import 'package:get/get.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/main/main_cubit.dart';

/// внедряем зависимости, чтобы можно было вызвать в любом месте приложения
Future initMain() async {

  // Get.put<DioClient>(DioClient(Dio()));
  // Get.put<Api>(Api());

  // Get.put<Connectivity>(Connectivity());

  Get.put<MainCubit>(MainCubit());
  Get.put<ProfileCubit>(ProfileCubit());
  Get.put<CartCubit>(CartCubit());
}