import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ///опечатка
  final _appRoter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 186, 132, 246)),
        useMaterial3: true,
      ),
      routerConfig: _appRoter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
