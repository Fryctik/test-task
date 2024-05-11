import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@RoutePage()
class OtpVereficationScreen extends StatefulWidget {
  const OtpVereficationScreen({super.key, required this.number});

  final String number;


  @override
  State<OtpVereficationScreen> createState() => _OtpVereficationScreenState();
}

class _OtpVereficationScreenState extends State<OtpVereficationScreen> {

  final formatter = MaskTextInputFormatter(
    mask: '#',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  bool inputStarted = false;
  int _minutes = 1;
  int _seconds = 0;
  bool _isTimeExpired = false;
  late Timer _timer;

  void timer () {
    _isTimeExpired = false;
    _minutes = 1;
    _seconds = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (_minutes == 0 && _seconds == 0) {
          _timer.cancel();
          _isTimeExpired = true;
        } else if (_seconds == 0) {
          _minutes--;
          _seconds = 59;
        } else {
          _seconds--;
        }
      });
    });
  } 

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String timerString = '${_minutes.toString()}:${_seconds.toString().padLeft(2, '0')}';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 45, 30, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _timer.cancel();
                        context.router.back();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, size: 24, color: Color.fromARGB(255, 175, 222, 46), weight: 2,),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              'Назад',
                              style: TextStyle(
                                  fontFamily: 'Geologica',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 22, 21, 23)
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ), 
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    'Введите код',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Мы отправили СМС с кодом подтверждения на ваш номер ${widget.number}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Geologica',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color.fromARGB(255, 130, 133, 137)
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 48, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 54,
                        height: 58,
                        child: TextField(
                          textAlign: TextAlign.center,
                          
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.transparent,

                          style: const TextStyle(
                            fontFamily: 'Unbounded',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 22, 21, 23)
                          ),

                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              if(index == 0){
                                inputStarted = true;
                                      
                              _timer.cancel();
                                timer();
                              }
                              
                              FocusScope.of(context).nextFocus();
                              
                            }
                          },
                          
                          inputFormatters: [formatter],

                          decoration: const InputDecoration(

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 186, 132, 246),
                                width: 1
                              )
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none
                            ),

                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide.none
                            ),
                            fillColor: Color.fromARGB(255, 239, 242, 245),
                            filled: true,
                          ),
                        ),
                      );
                    }
                    )
                  )
                ),
                if (inputStarted) Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: 
                      _isTimeExpired
                      ? [
                        const TextSpan(
                          text: 'Не получили код?',
                          style: TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 22, 21, 23)
                          ),
                        ),
                        TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = (){
                          setState(() {
                            _isTimeExpired = false;
                          });
                          timer();
                        },
                        text: ' Отправить повторно',
                          style: const TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 175, 222, 46)
                          ),
                        )
                      ]
                      : [
                        const TextSpan(
                        text: 'Новый код можно будет запросить через ',
                        style: TextStyle(
                          fontFamily: 'Geologica',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 130, 133, 137)
                          ),
                        ),
                        TextSpan(
                          text: timerString,
                          style: const TextStyle(
                            fontFamily: 'Geologica',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 130, 133, 137)
                          ),
                        )
                      ]
                    )
                  )
                  
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: 
                  //   _isTimeExpired
                  //   ? [
                  //     const Text(
                  //       'Не получили код?',
                  //       style: TextStyle(
                  //         fontFamily: 'Geologica',
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w600,
                  //         color: Color.fromARGB(255, 22, 21, 23)
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: (){
                  //         setState(() {
                  //           _isTimeExpired = false;
                  //         });
                  //         timer();
                  //       },
                  //       child: const Text(
                  //       ' Отправить повторно',
                  //         style: TextStyle(
                  //           fontFamily: 'Geologica',
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600,
                  //           color: Color.fromARGB(255, 175, 222, 46)
                  //         ),
                  //       )
                  //     )
                  //   ]
                  //   : [
                  //     const Text(
                  //       'Новый код можно будет запросить через ',
                  //       style: TextStyle(
                  //         fontFamily: 'Geologica',
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w300,
                  //         color: Color.fromARGB(255, 130, 133, 137)
                  //       ),
                  //     ),
                  //     Text(
                  //       timerString,
                  //       style: const TextStyle(
                  //         fontFamily: 'Geologica',
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w300,
                  //         color: Color.fromARGB(255, 130, 133, 137)
                  //       ),
                  //     )
                  //   ]
                  // ),
                ) else const SizedBox()
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 186, 132, 246),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    )
                  ),
                  child: const Text(
                    'подтвердить',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}