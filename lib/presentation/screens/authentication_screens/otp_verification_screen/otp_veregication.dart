import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/presentation/routes/routes.dart';
import 'package:test/presentation/screens/authentication_screens/otp_verification_screen/widget/back_widget.dart';
import 'package:test/presentation/screens/authentication_screens/otp_verification_screen/widget/title_otp_widget.dart';
import 'package:test/presentation/theme/theme.dart';

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
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  bool inputStarted = false;
  int _minutes = 1;
  int _seconds = 0;
  bool _isTimeExpired = false;
  late Timer _timer;

  void timer() {
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
    String timerString =
        '${_minutes.toString()}:${_seconds.toString().padLeft(2, '0')}';
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 74, 30, 38),
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
                        child: const BackWidget(),
                      )
                    ],
                  ),
                  TitleOtpWidget(widget: widget),

                  ///не по макету. цифры не по середине
                  /// ТУТ НУЖНА ПОМОЩЬ, я не могу оцентровать их
                  Padding(
                    padding: const EdgeInsets.fromLTRB(39, 48, 39, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) {
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
                                color: AppColors.black,
                                height: 27.28 / 22,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (index == 0) {
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                      color: AppColors.main,
                                      width: 1),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Color.fromARGB(255, 239, 242, 245),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (inputStarted)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: _isTimeExpired
                              ? [
                                  TextSpan(
                                    text: 'Не получили код?',
                                    style: theme.textTheme.displayMedium?.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          _isTimeExpired = false;
                                        });
                                        timer();
                                      },
                                    text: ' Отправить повторно',
                                    style: theme.textTheme.displayLarge?.copyWith(
                                      color: AppColors.accent,
                                    ),
                                  )
                                ]
                              : [
                                  TextSpan(
                                    text:
                                        'Новый код можно будет запросить через ',
                                    style: theme.textTheme.displayMedium?.copyWith(
                                      color: AppColors.shade3,
                                      height: 17.5 / 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: timerString,
                                    style: theme.textTheme.displayMedium?.copyWith(
                                      color: AppColors.shade3,
                                      height: 17.5 / 14,
                                    ),
                                  ),
                                ],
                        ),
                      ),
                    )
                  else
                    const SizedBox()
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _timer.cancel();
                    context.router.push(EditingProfileRoute());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.main,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20)),
                  child: Text(
                    'ПОДТВЕРДИТЬ',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
