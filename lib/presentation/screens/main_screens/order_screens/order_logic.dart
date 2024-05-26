import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';

@RoutePage()
class OrderLogicScreen extends StatefulWidget {
  const OrderLogicScreen({super.key});

  @override
  State<OrderLogicScreen> createState() => _OrderLogicScreenState();
}

class _OrderLogicScreenState extends State<OrderLogicScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        SelectedCityOrderRoute(),
        InputAddressOrderRoute()
      ],
      builder: (context, child) {
        return child;
      },
    );
  }
}