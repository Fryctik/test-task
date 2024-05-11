
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/presentation/routes/routes.dart';

@RoutePage()
class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {

  final TextEditingController _phoneNumberController = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );
  bool _isValidPhoneNumber = true;
  bool _isNumberValidInputed = false;

  bool isValidPhoneNumber(String value) {
    return RegExp(r'^\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}$').hasMatch(value);
  }        

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 45, 20, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.router.back();
                      },
                      child: const Icon(Icons.close_sharp, size: 24, color: Color.fromARGB(255, 175, 222, 46), weight: 2,),
                    )
                  ],
                ), 
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    'Вход\n и регистрация',
                    textAlign: TextAlign.center,
                    softWrap: false,
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Для получения кода введите \n свой номер телефона',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Geologica',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color.fromARGB(255, 130, 133, 137)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: TextField(

                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [maskFormatter],

                    cursorColor: const Color.fromARGB(255, 186, 132, 246),
                    style:TextStyle(
                      fontFamily: 'Geologica',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: _isValidPhoneNumber ? const Color.fromARGB(255, 22, 21, 33) : const Color.fromARGB(255, 221, 34, 34),
                    ),

                    onChanged: (value) {
                      setState(() {
                        _isValidPhoneNumber = isValidPhoneNumber(value);
                        _isValidPhoneNumber ? _isNumberValidInputed = true : _isNumberValidInputed = false;
                      });
                    },

                    decoration: InputDecoration(
                      hintText: '+7',
                      hintStyle: const TextStyle(
                        fontFamily: 'Geologica',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 130, 133, 137)
                      ),

                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 186, 132, 246),
                          width: 1
                        )
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none
                      ),

                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none
                      ),


                      errorText: _isValidPhoneNumber ? null : 'Неправильный номер',
                      errorStyle: const TextStyle(
                        fontFamily: 'Geologica',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 221, 34, 34)
                      ),

                      fillColor: _isValidPhoneNumber ? const Color.fromARGB(255, 239, 242, 245) : const Color.fromARGB(255, 245, 210, 210),
                      filled: true,

                      suffixIcon: _isNumberValidInputed ? const Icon(Icons.check, size: 24, color: Color.fromARGB(255, 175, 222, 46), weight: 3,) : null,
                    )
                  ),
                ),
              ],
            ),

            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Продолжая, вы соглашаетесь на ',
                        style: TextStyle(
                          fontFamily: 'Geologica',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 130, 133, 137)
                        ),
                      ),
                      TextSpan(
                        text: 'сбор,\n обработку и хранение персональных данных',
                        recognizer: TapGestureRecognizer()..onTap = (){},
                        style: const TextStyle(
                          fontFamily: 'Geologica',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 175, 222, 46)
                        ),
                        
                      )
                    ]
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_isNumberValidInputed == true){
                          context.router.push(OtpVereficationRoute(number: _phoneNumberController.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 186, 132, 246),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                        )
                      ),
                      child: const Text(
                        'получить код',
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
            )
          ],
        ),
      ),
    );
  }
}