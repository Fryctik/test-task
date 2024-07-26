import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
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
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:  20.w, right: 20.w, top: MediaQuery.of(context).viewPadding.top <= 52? 27.h: 0,),
                  child: Row(
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
                ),
                // const Spacer(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const TitleIdentificationWidget(),
                        if(MediaQuery.sizeOf(context).height < 785)...[
                          SizedBox(
                            height: 20.h,
                          ),
                        ] else ...[
                          SizedBox(
                            height: 48.h,
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomNumTextfield(
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
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
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

                          Future.delayed(Duration(milliseconds: 400), () {
                            if(_isValidPhoneNumber) {
                              setState(() {
                                _isValidPhoneNumber = isValidPhoneNumber(_phoneNumberController.text);
                                _isValidPhoneNumber
                                    ? _isNumberValidInputed = true
                                    : _isNumberValidInputed = false;
                              });
                              if(_isValidPhoneNumber) {
                                context.read<ProfileCubit>().updatePhoneNumber('+7${_phoneNumberController.text}');
                                context.pushNamed('otp_verefication');
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
                    if(MediaQuery.of(context).viewPadding.bottom == 20 && !focusNode.hasFocus)...[
                      SizedBox(
                        height: 35.h,
                      )
                    ]
                    else...[
                      SizedBox(
                        height: 20.h,
                      )
                    ]
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
