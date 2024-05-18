import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';
import 'package:test/presentation/screens/authentication_screens/common_widgets/common_button.dart';
import 'package:test/presentation/screens/authentication_screens/onboard_screen/onboard_widget/logo_widget.dart';
import 'package:test/presentation/screens/authentication_screens/onboard_screen/onboard_widget/text_widget.dart';

@RoutePage()
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 186, 132, 246),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const LogoWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Image.asset('assets/image/onboard-image.png'),
                ),
                const TextWidget(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 38),
              child: CommonWidgetButton(
                text: 'войти',
                colorButton: Colors.white,
                textColor: Color.fromARGB(255, 186, 132, 246),
                pathRoute: IdentificationRoute(),
              ),
            )
          ],
        ),
      ),
    );
  }
}



