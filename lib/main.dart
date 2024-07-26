import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test/data/local/di/injects.dart';
import 'package:test/presentation/manager/navigation/navigation_cubit.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test/presentation/pages/achievements/manager/achievements_cubit.dart';
import 'package:test/presentation/pages/main/view/market/manager/delivery_address_cubit.dart';
import 'package:test/presentation/pages/main/manager/main_cubit.dart';
import 'package:test/presentation/pages/main/view/usluga/manager/sevice_cubit.dart';
import 'package:test/presentation/pages/only_nav_bar/manager/only_nav_bar_cubit.dart';
import 'package:test/presentation/pages/order/manager/order_cubit.dart';
import 'package:test/presentation/routes/go_router.dart';
import 'package:test/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/pages/main/view/market/manager/cart_cubit.dart';

Future<void> main() async{
  await initMain();
  runApp(BlocProvider(
      create: (_) => Get.find<NavigationCubit>(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> Get.find<OnlyNavBarCubit>()),
          BlocProvider(create: (context)=> Get.find<MainCubit>()),
          BlocProvider(create: (context)=> Get.find<ProfileCubit>()),
          BlocProvider(create: (context)=>Get.find<CartCubit>()),
          BlocProvider(create: (context)=>Get.find<DeliveryAddressCubit>()),
          BlocProvider(create: (context)=>Get.find<OrderCubit>()),
          BlocProvider(create: (context)=>Get.find<ServiceCubit>()),
          BlocProvider(create: (context)=>Get.find<AchievementsCubit>()),
        ],
        child: MaterialApp.router(
          localizationsDelegates:  const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          ],
          title: 'ReЛав',
          theme: theme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
