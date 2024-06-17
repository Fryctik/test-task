import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/presentation/pages/auth/identification/components/agreement_widget.dart';
import 'package:test/presentation/pages/auth/identification/components/title_identification_widget.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/custom_num_textfield.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  bool _isValidPhoneNumber = true;
  bool _isNumberValidInputed = false;

  bool isValidPhoneNumber(String value) {
    return RegExp(r'\(\d{3}\) \d{3}-\d{2}-\d{2}$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return PopScope(
        canPop: false,
      child: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
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
                            GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: const Icon(
                                Icons.close_sharp,
                                size: 24,
                                color: AppColors.accent,
                                weight: 2,
                              ),
                            )
                          ],
                        ),
                        const TitleIdentificationWidget(),
                        if(MediaQuery.sizeOf(context).height < 666)...[
                          SizedBox(
                            height: 20.h,
                          ),
                        ] else ...[
                            SizedBox(
                              height: 48.h,
                            ),
                        ],
                        CustomNumTextfield(
                          focusNode: focusNode,
                          phoneNumberController: _phoneNumberController,
                          isValidPhoneNumber: _isValidPhoneNumber,
                          isNumberValidInputed: _isNumberValidInputed,
                          onChange: (value) {
                            if(_phoneNumberController.text.length > 14) {
                              setState(() {
                                _isValidPhoneNumber = isValidPhoneNumber(value);
                                _isValidPhoneNumber
                                    ? _isNumberValidInputed = true
                                    : _isNumberValidInputed = false;
                              });
                            } else {
                              setState(() {

                              });
                            }
                          },
                          onSubmitted: (value) {
                            setState(() {
                              _isValidPhoneNumber = isValidPhoneNumber(value);
                              _isValidPhoneNumber
                                  ? _isNumberValidInputed = true
                                  : _isNumberValidInputed = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      AgreementText(phoneNumberController: _phoneNumberController),
                      SizedBox(
                        height: 16.h,
                      ),
                      CommonWidgetButton(
                          text: 'ПОЛУЧИТЬ КОД',
                          colorButton: AppColors.main,
                          textColor: AppColors.white,
                          ignorePoint: _phoneNumberController.text.length > 3? false : true,
                          openPath: () {
                            focusNode.unfocus();
                            Future.delayed(Duration(milliseconds: 300), () {
                              if(_isValidPhoneNumber) {
                                setState(() {
                                  _isValidPhoneNumber = isValidPhoneNumber(_phoneNumberController.text);
                                  _isValidPhoneNumber
                                      ? _isNumberValidInputed = true
                                      : _isNumberValidInputed = false;
                                });
                                if(_isValidPhoneNumber) {
                                  context.pushNamed('/otp_verefication', pathParameters: {
                                    'number': '+7${_phoneNumberController.text}'
                                  });
                                } else {
                                  setState(() {
                                    _isValidPhoneNumber = isValidPhoneNumber(_phoneNumberController.text);
                                    _isValidPhoneNumber
                                        ? _isNumberValidInputed = true
                                        : _isNumberValidInputed = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  _isValidPhoneNumber = isValidPhoneNumber(_phoneNumberController.text);
                                  _isValidPhoneNumber
                                      ? _isNumberValidInputed = true
                                      : _isNumberValidInputed = false;
                                });
                              }
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

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}