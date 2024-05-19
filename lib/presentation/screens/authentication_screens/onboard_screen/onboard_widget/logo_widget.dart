import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/heart.png', width: 40, height: 33.33,),
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
                    color: Color.fromARGB(255, 175, 222, 46),
                    height: 22 / 22,
                  ),
                ),
                Text(
                  'ЛАВ',
                  style: TextStyle(
                    fontFamily: 'Unbounded',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: 22 / 22,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
