import 'package:get/get.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';

/// внедряем зависимости, чтобы можно было вызвать в любом месте приложения
Future initMain() async {

  // Get.put<DioClient>(DioClient(Dio()));
  // Get.put<Api>(Api());

  // Get.put<Connectivity>(Connectivity());

  Get.put<ProfileCubit>(ProfileCubit());
}