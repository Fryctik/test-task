import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
import 'package:test/presentation/pages/edit_profiel/widget/selection_gender.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/input_name.dart';
import 'package:test/presentation/pages/edit_profiel/widget/input_birthday.dart';
import 'package:test/presentation/pages/edit_profiel/widget/input_email.dart';
import 'package:test/presentation/pages/edit_profiel/widget/selection_city.dart';
import '../../../../../config/contstants/app_colors.dart';
import '../../../../../config/contstants/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../manager/profile_cubit/profile_cubit.dart';
import '../../../../widgets/custom_common_button.dart';

class NewEditProfile extends StatefulWidget {
  const NewEditProfile({super.key});

  @override
  State<NewEditProfile> createState() => _NewEditProfileState();
}

class _NewEditProfileState extends State<NewEditProfile> {
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

  final TextEditingController nameController = TextEditingController();
  bool _validateName = true;
  void validateName(String name) {
    if (nameController.text.isEmpty) {
      _validateName = false;
    } else {
      _validateName = true;
    }
  }

  final TextEditingController birthdayController = TextEditingController();

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
  void initState() {
    nameController.text = context.read<ProfileCubit>().state.name;
    emailController.text = context.read<ProfileCubit>().state.email;
    birthdayController.text = context.read<ProfileCubit>().state.dateOfBirth;
    selectedItem = context.read<ProfileCubit>().state.city;
    selectedItemG = context.read<ProfileCubit>().state.gender;
    super.initState();
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
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomBackButton(
                                  onBack: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        barrierColor:
                                            AppColors.black.withOpacity(0.3),
                                        builder: (context) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              dialogBackgroundColor:
                                                  Colors.white,
                                            ),
                                            child: AlertDialog(
                                              actionsPadding: EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 20,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              alignment: Alignment.center,
                                              actionsAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              actionsOverflowAlignment:
                                                  OverflowBarAlignment.start,
                                              content: Container(
                                                width: 350.w,
                                                child: Text(
                                                  'ВЫЙТИ БЕЗ \nИЗМЕНЕНИЙ?',
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyles
                                                      .body16UnboundedMedium,
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(16),
                                                            color:
                                                                AppColors.shade1,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 44,
                                                          width: 120,
                                                          child: Text(
                                                            "Продолжить",
                                                            style: AppTextStyles
                                                                .body16GeologicaSemiBold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          ///custom
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop();
                                                          context.pop();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(16),
                                                            color:
                                                                AppColors.shade1,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 44,
                                                          width: 120,
                                                          child: Text(
                                                            "Выйти ",
                                                            style: AppTextStyles
                                                                .body16GeologicaLight
                                                                .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .red),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Text(
                              "ПРОФИЛЬ",
                              style: AppTextStyles.body16UnboundedMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: Container(
                          width: 158,
                          height: 158,
                          clipBehavior: Clip.none,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: _image != null
                              ? Stack(
                            alignment: Alignment.bottomRight,
                                children: [
                                  Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  Positioned(
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
                              )
                              : Stack(
                            alignment: Alignment.bottomRight,
                                children: [
                                  Center(
                                      child: Image.asset(
                                      Assets.imageHuman,
                                      height: 158,
                                      width: 158,
                                      fit: BoxFit.cover,
                                    )),
                                  Positioned(
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
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: InputNameWidget(
                                nameController: nameController,
                                onSubmitted: (value) {},
                                isValidateName: _validateName,
                                focusNode: focusNode,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: InputEmailWidget(
                              emailController: emailController,
                              isEmailValid: _isEmailValid,
                              onSubmitted: (value) {},
                              focusNode: focusNode1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25),
                            child: InputBirthdayWidget(
                              isValidBirthday: isDateBirthError,
                              birthdayController: birthdayController,
                              isValidBirthdayText: isDateErrorText,
                              focusNode: focusNode2,
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
                            context
                                .read<ProfileCubit>()
                                .changeGender(selectedItemG);
                            print("1");
                            errorChecker();
                            context
                                .read<ProfileCubit>()
                                .changeCity(selectedItem);

                            print("2");
                            validateName(nameController.text);
                            context
                                .read<ProfileCubit>()
                                .changeName(nameController.text);
                            print("3");
                            validateEmail(emailController.text);
                            context
                                .read<ProfileCubit>()
                                .changeEmail(emailController.text);
                            print("4");

                            isDateErrorText =
                                validateDateOfBirth(birthdayController.text) ??
                                    '';
                            context
                                .read<ProfileCubit>()
                                .changeBirthday(birthdayController.text);

                            focusNode.unfocus();
                            focusNode1.unfocus();
                            focusNode2.unfocus();

                            if (isError == true ||
                                isErrorG == true ||
                                isDateBirthError == true ||
                                _validateName == false ||
                                _isEmailValid == false) {
                              setState(() {});
                            } else {
                              print("else");
                              Future.delayed(Duration(milliseconds: 350), () {
                                context.pop();
                              });
                            }
                          },
                        ),
                      ),
                      if (MediaQuery.of(context).viewPadding.bottom <= 20) ...[
                        SizedBox(
                          height: 35.h,
                        ),
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
