import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/custom_otp_textfield.dart';

import '../components/title_otp_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.number});

  final String number;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  FocusNode focusNode = FocusNode();

  String otpNumbers = '';
  Timer? _timer;
  int _start = 60;
  int _attempts = 3;
  late final GlobalKey<FormState> formKey;

  void startTimer() {
    _start = 60;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
        if (_attempts > 0) {
          setState(() {
            _attempts--;
          });
        } else {
          context.pop(); // Go back to the previous screen
        }
      }
    });
  }

  String getFormattedTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedTime = '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onCodeChanged(String code) {
    otpNumbers = code;
    setState(() {
    });
    print("Code changed: $code");
  }

  void _onSubmit(String code) {
    otpNumbers = code;
    _timer?.cancel();
    Future.delayed(Duration(milliseconds: 300), () {
      // context.goNamed('/editing_profile');
    });
    print("Code submitted: $code");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top <= 52? 27.h: 0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:  20.w, right: 20.w, ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomBackButton(
                              onBack: () {
                                context.pop();
                          })
                        ],
                      ),
                    ],
                  ),
                ),
                TitleOtpWidget(widget: widget),
                SizedBox(
                  height: 48.h,
                ),
                SizedBox(
                  height: 58,
                  child: CustomOtpTextField(

                    numberOfFields: 4,
                    onCodeChanged: _onCodeChanged,
                    onSubmit: _onSubmit,
                    focusNode: focusNode,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: _start == 0 && _attempts > 0
                          ? [
                              TextSpan(
                                text: 'Не получили код?',
                                style: AppTextStyles.body16GeologicaLight.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (_attempts > 0) {
                                      startTimer();
                                    }
                                  },
                                text: ' Отправить повторно',
                                style: AppTextStyles.body14GeologicaLight.copyWith(
                                  color: AppColors.accent,
                                ),
                              )
                            ]
                          : [
                              TextSpan(
                                text:
                                    'Новый код можно будет запросить через ',
                                style: AppTextStyles.body14GeologicaLight.copyWith(
                                  color: AppColors.shade3,
                                  height: 17.5 / 14,
                                ),
                              ),
                              TextSpan(
                                text: '${getFormattedTime(_start)}',
                                style: AppTextStyles.body16GeologicaLight.copyWith(
                                  color: AppColors.shade3,
                                  height: 17.5 / 14,
                                ),
                              ),
                            ],
                    ),
                  ),
                const Spacer(),
                CommonWidgetButton(
                    text: 'ПОДТВЕРДИТЬ',
                    colorButton: AppColors.main,
                    textColor: AppColors.white,
                    ignorePoint: otpNumbers.length > 3? false: true,
                    openPath: () {
                      _timer!.cancel();
                      Future.delayed(Duration(milliseconds: 300), () {
                        context.pushNamed('/editing_profile');
                      });
                    }
                ),
                if(MediaQuery.of(context).viewPadding.bottom <= 20 && !focusNode.hasFocus)...[
                  SizedBox(
                    height: 35.h,
                  )
                ] else...[
                  SizedBox(
                    height: 14.h,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
