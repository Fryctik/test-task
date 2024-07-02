import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/components/city_text_field.dart';
import 'package:test/presentation/pages/main/components/comment_text_field.dart';
import 'package:test/presentation/pages/main/components/email_text_field.dart';
import 'package:test/presentation/pages/main/components/name_text_field.dart';
import 'package:test/presentation/pages/main/manager/delivery_address/delivery_address_cubit.dart';
import 'package:test/presentation/pages/main/view/market/cart_view.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_check.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/custom_num_textfield.dart';

class ProcessDeliveryView extends StatefulWidget {
  const ProcessDeliveryView({super.key, });

  @override
  State<ProcessDeliveryView> createState() => _ProcessDeliveryViewState();
}

class _ProcessDeliveryViewState extends State<ProcessDeliveryView> {
  final TextEditingController cityController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  bool _validateCity = true;
  void validateCity(String name) {
    if (cityController.text.isEmpty) {
      _validateCity = false;
    } else {
      _validateCity = true;
    }
  }

  final TextEditingController nameController = TextEditingController();
  bool _validateName = true;
  void validateName(String name) {
    if (nameController.text.isEmpty) {
      _validateName = false;
    } else {
      _validateName = true;
    }
  }

  void onSubmitted(value) {
    setState(() {
      _isValidPhoneNumber = isValidPhoneNumber(value);
      _isValidPhoneNumber
          ? _isNumberValidInputed = true
          : _isNumberValidInputed = false;
    });
  }

  final TextEditingController emailController = TextEditingController();
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@(mail\.ru|gmail\.com|yandex\.ru)$');
  bool _isEmailValid = true;

  String removeTrailingSpaces(String input) {
    return input.replaceAll(RegExp(r'\s+$'), '');
  }

  bool validateEmail(String email) {
    email = removeTrailingSpaces(email);
    _isEmailValid = emailRegex.hasMatch(email);
    setState(() {});
    return emailRegex.hasMatch(email);
  }

  bool _isValidPhoneNumber = true;
  bool _isNumberValidInputed = false;
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValidPhoneNumber(String value) {
    return RegExp(r'\(\d{3}\) \d{3}-\d{2}-\d{2}$').hasMatch(value);
  }




  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0, right: 20, left: 20, bottom: 15),
                color: AppColors.white,
                child: CustomBackButton(
                  onBack: () {
                    context.pop();
                  },
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Оформление доставки",
                              style: AppTextStyles.body32UnboundedSemiBold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Город",
                                  style: AppTextStyles.body16GeologicaLight
                                      .copyWith(color: AppColors.shade3),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CityTextField(
                                    cityController: cityController,
                                    isValidateCity: _validateCity,
                                    focusNode: focusNode),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "ФИО",
                                  style: AppTextStyles.body16GeologicaLight
                                      .copyWith(color: AppColors.shade3),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                NameTextField(
                                    nameController: nameController,
                                    isValidateName: _validateName,
                                    focusNode: focusNode1),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Email",
                                  style: AppTextStyles.body16GeologicaLight
                                      .copyWith(color: AppColors.shade3),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                EmailTextField(
                                    focusNode: focusNode2,
                                    isEmailValid: _isEmailValid,
                                    emailController: emailController),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Телефон",
                                  style: AppTextStyles.body16GeologicaLight
                                      .copyWith(color: AppColors.shade3),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomNumTextfield(
                                  focusNode: focusNode3,
                                  phoneNumberController: _phoneNumberController,
                                  isValidPhoneNumber: _isValidPhoneNumber,
                                  isNumberValidInputed: _isNumberValidInputed,
                                  onChange: (value) {
                                    if (_phoneNumberController.text.length > 14) {
                                      setState(() {
                                        _isValidPhoneNumber =
                                            isValidPhoneNumber(value);
                                        _isValidPhoneNumber
                                            ? _isNumberValidInputed = true
                                            : _isNumberValidInputed = false;
                                      });
                                    } else {
                                      setState(() {});
                                    }
                                  },
                                  onSubmitted: onSubmitted,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 90),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CommonWidgetButton(
                            colorButton: AppColors.main,
                            textColor: AppColors.white,
                            text: "ПЕРЕЙТИ К ПРОВЕРКЕ",
                            openPath: () {
                              validateEmail(emailController.text);
                              validateName(nameController.text);
                              validateCity(cityController.text);
                              onSubmitted(_phoneNumberController.text);
                              context.read<DeliveryAddressCubit>().updateDeliveryAddress(cityController.text, nameController.text, emailController.text, "+7 ${_phoneNumberController.text}", '');


                              focusNode.unfocus();
                              focusNode1.unfocus();
                              focusNode2.unfocus();
                              focusNode3.unfocus();
                              if (_validateName == false ||
                                  _validateCity == false ||
                                  _validateCity == false ||
                                  _isValidPhoneNumber == false) {
                                setState(() {});
                              } else {
                                Future.delayed(Duration(milliseconds: 300), () {
                                  if (_isValidPhoneNumber) {
                                    setState(() {
                                      _isValidPhoneNumber = isValidPhoneNumber(
                                          _phoneNumberController.text);
                                      _isValidPhoneNumber
                                          ? _isNumberValidInputed = true
                                          : _isNumberValidInputed = false;
                                    });
                                    if (_isValidPhoneNumber) {
                                      context.pushNamed('process_delivery1');
                                    } else {
                                      setState(() {
                                        _isValidPhoneNumber = isValidPhoneNumber(
                                            _phoneNumberController.text);
                                        _isValidPhoneNumber
                                            ? _isNumberValidInputed = true
                                            : _isNumberValidInputed = false;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      _isValidPhoneNumber = isValidPhoneNumber(
                                          _phoneNumberController.text);
                                      _isValidPhoneNumber
                                          ? _isNumberValidInputed = true
                                          : _isNumberValidInputed = false;
                                    });
                                  }
                                });
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
