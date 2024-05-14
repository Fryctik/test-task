import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';

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
      body:
      ///не хватает safeArea
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/heart.png'),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            'RE',
                            style: TextStyle(
                              fontFamily: 'Unbounded',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 175, 222, 46)
                            ),
                          ),
                          Text(
                            'ЛАВ',
                            style: TextStyle(
                              fontFamily: 'Unbounded',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 255, 255, 255)
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ///бесполезный padding
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Image.asset('assets/image/onboard-image.png'),
              ),
              const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Добро пожаловать в ',
                          style: TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 230, 216, 246)
                            ///не хватает height
                          ),
                        ),
                        Text(
                          'Re',
                          style: TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 175, 222, 46)
                            ///не хватает height
                          ),
                        ),
                        Text(
                          'Лав',
                          style: TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 230, 216, 246)
                            ///не хватает height
                          ),
                        ),
                      ],
                    ),
                    ///бесполезный padding
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Собирай, Сдавай, Сохраняй',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Unbounded',
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        'Управляйте вашими отходами: приложение для организации вывоза'
                        ' вторсырья, учета и отслеживания вашего эковклада',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Geologica',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 230, 216, 246),
                          ///не хватает height
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),

          ///не по макету
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 16),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              ///высота не должна быть фиксированной
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  context.router.push(const IdentificationRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                child: const Text(
                  'войти',
                  style: TextStyle(
                    fontFamily: 'Unbounded',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromARGB(255, 186, 132, 246)
                  ),
                )
              ),
            )
          )
        ],
      ),
    );
  }
}