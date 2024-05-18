import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
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
                color: Color.fromARGB(255, 230, 216, 246),
                height: 20 / 16,
              ),
            ),
            Text(
              'Re',
              style: TextStyle(
                fontFamily: 'Geologica',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 175, 222, 46),
                height: 20 / 16,
              ),
            ),
            Text(
              'Лав',
              style: TextStyle(
                fontFamily: 'Geologica',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 230, 216, 246),
                height: 20 / 16,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Собирай, Сдавай, Сохраняй',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Unbounded',
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 255, 255, 255),
              height: 33.6 / 28,
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
              height: 20 / 16,
            ),
          ),
        )
      ],
    );
  }
}