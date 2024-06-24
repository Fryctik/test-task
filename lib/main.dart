import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test/presentation/manager/injects.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test/presentation/routes/go_router.dart';
import 'package:test/themes/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async{
  await initMain();
  runApp(MyApp());
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
          BlocProvider(create: (context)=> Get.find<ProfileCubit>()),
        ],
        child: MaterialApp.router(
          localizationsDelegates:  [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Demo',
          theme: theme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
