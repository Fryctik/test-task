import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/edit_profiel/widget/input_birthday.dart';
import 'package:test/presentation/pages/edit_profiel/widget/input_email.dart';
import 'package:test/presentation/pages/edit_profiel/widget/selection_city.dart';
import 'package:test/presentation/pages/edit_profiel/widget/selection_gender.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

import '../../../../config/contstants/app_colors.dart';
import '../../widgets/input_name.dart';

class EditingProfileScreen extends StatefulWidget {
  const EditingProfileScreen({super.key});

  @override
  State<EditingProfileScreen> createState() => _EditingProfileScreenState();
}

class _EditingProfileScreenState extends State<EditingProfileScreen> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  bool isDateBirthError = false;
  String isDateErrorText = '';

  String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      isDateBirthError = true;
      return 'Пожалуйста, введите дату рождения';
    }

    // Define the date format
    final dateFormat = DateFormat('dd.MM.yyyy');
    DateTime? birthDate;

    try {
      birthDate = dateFormat.parseStrict(value);
    } catch (e) {
      isDateBirthError = true;
      return 'Неверный формат даты.';
    }

    // Check if the date is realistic
    final now = DateTime.now();
    if (birthDate.isAfter(now) || birthDate.year < 1900) {
      isDateBirthError = true;
      return 'Неверная дата рождения';
    }

    // Check if the age is at least 16 years
    final age = now.year - birthDate.year;
    if (age < 16 ||
        (age == 16 && now.isBefore(birthDate.add(Duration(days: age * 365))))) {
      isDateBirthError = true;
      return 'Вам должно быть не менее 16 лет';
    }

    isDateBirthError = false;
    return null;
  }

  String selectedItem = 'Выбрать';
  bool isError = false;
  void selectedCity(String item) {
    selectedItem = item;
    setState(() {});
  }

  void errorChecker() {
    if (selectedItem == "Выбрать") {
      setState(() {});
      isError = true;
    } else {
      isError = false;
    }
  }

  String selectedItemG = 'Выбрать';
  bool isErrorG = false;
  void selectedGender(String item) {
    selectedItemG = item;
    setState(() {});
  }

  void errorCheckerG() {
    if (selectedItemG == "Выбрать") {
      setState(() {});
      isErrorG = true;
    } else {
      isErrorG = false;
    }
  }

  final TextEditingController _nameController = TextEditingController();
  bool _validateName = true;
  void validateName(String name) {
    if (_nameController.text.isEmpty) {
      _validateName = false;
    } else {
      _validateName = true;
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@(mail\.ru|gmail\.com|yandex\.ru)$');
  bool _isEmailValid = true;
  bool validateEmail(String email) {
    _isEmailValid = emailRegex.hasMatch(email);
    setState(() {});
    return emailRegex.hasMatch(email);
  }

  ///imagePicker
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(
                    top:
                        MediaQuery.of(context).viewPadding.top <= 52 ? 27.h : 0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          CustomBackButton(
                            onBack: () {
                              context.pop();
                            },
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            "ПРОФИЛЬ",
                            style: AppTextStyles.body16UnboundedMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 158,
                              height: 158,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    )
                                  : Center(
                                      child: Image.asset(
                                      Assets.imageHuman,
                                      height: 158,
                                      width: 158,
                                      fit: BoxFit.cover,
                                    )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 120.h, left: 240.w),
                            child: GestureDetector(
                              onTap: () {
                                _pickImage();
                              },
                              child: Image.asset(
                                'assets/icons/camera.png',
                                width: 36,
                                height: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: InputNameWidget(
                                nameController: _nameController,
                                onSubmitted: (value) {},
                                isValidateName: _validateName,
                                focusNode: focusNode,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: InputEmailWidget(
                              emailController: _emailController,
                              isEmailValid: _isEmailValid,
                              onSubmitted: (value) {},
                              focusNode: focusNode1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: SelectionCityWidget(
                              selectedItem: selectedItem,
                              onTap: selectedCity,
                              isError: isError,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: InputBirthdayWidget(
                              isValidBirthday: isDateBirthError,
                              birthdayController: _birthdayController,
                              isValidBirthdayText: isDateErrorText,
                              focusNode: focusNode2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: SelectionGenderWidget(
                              selectedItem: selectedItemG,
                              onTap: selectedGender,
                              isError: isErrorG,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: CommonWidgetButton(
                          text: 'СОХРАНИТЬ',
                          colorButton: AppColors.main,
                          textColor: AppColors.white,
                          openPath: () {
                            errorCheckerG();
                            print("1");
                            errorChecker();
                            print("2");
                            validateName(_nameController.text);
                            print("3");
                            validateEmail(_emailController.text);
                            print("4");

                            isDateErrorText =
                                validateDateOfBirth(_birthdayController.text) ??
                                    '';

                            if (isError == true ||
                                isErrorG == true ||
                                isDateBirthError == true ||
                                _validateName == false ||
                                _isEmailValid == false) {
                              setState(() {});
                            } else {
                              print("else");
                              context.pushNamed("/main");
                            }
                          },
                        ),
                      ),
                      if (MediaQuery.of(context).viewPadding.bottom <= 20) ...[
                        SizedBox(
                          height: 35.h,
                        )
                      ]
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}



