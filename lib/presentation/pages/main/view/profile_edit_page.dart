import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

import '../../../../config/contstants/app_colors.dart';
import '../../../../config/contstants/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../widgets/custom_back_button.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomBackButton(
                                  onBack: () {
                                    widget.pageController.jumpToPage(0);
                                  },
                                ),
                                SvgPicture.asset(
                                  Assets.iconsEdit,
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.cover,
                                ),
                              ],
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
                            Center(
                              child: Container(
                                width: 200,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 13),
                                margin: EdgeInsets.only(
                                  top: 138,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.main),
                                    borderRadius: BorderRadius.circular(40),
                                    color: AppColors.white),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.iconsStar,
                                      height: 16,
                                      width: 16,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Железная мафия",
                                      style:
                                          AppTextStyles.body14GeologicaRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Алина",
                          style: AppTextStyles.body32UnboundedSemiBold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Номер телефона",
                              style: AppTextStyles.body16GeologicaExtraLight
                                  .copyWith(color: AppColors.shade3),
                            ),
                            Text(
                              "+7 (977) 983-45-67",
                              style: AppTextStyles.body16GeologicaLight,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "E-mail",
                              style: AppTextStyles.body16GeologicaExtraLight
                                  .copyWith(color: AppColors.shade3),
                            ),
                            Text(
                              "alina@mail.ru",
                              style: AppTextStyles.body16GeologicaLight,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Город",
                              style: AppTextStyles.body16GeologicaExtraLight
                                  .copyWith(color: AppColors.shade3),
                            ),
                            Text(
                              "Мытищи",
                              style: AppTextStyles.body16GeologicaLight,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Дата рождения",
                              style: AppTextStyles.body16GeologicaExtraLight
                                  .copyWith(color: AppColors.shade3),
                            ),
                            Text(
                              "21 апреля 1995",
                              style: AppTextStyles.body16GeologicaLight,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Пол",
                              style: AppTextStyles.body16GeologicaExtraLight
                                  .copyWith(color: AppColors.shade3),
                            ),
                            Text(
                              "Женский",
                              style: AppTextStyles.body16GeologicaLight,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Политика конфиденциальности",
                                style: AppTextStyles.body16GeologicaExtraLight
                                    .copyWith(color: AppColors.shade3),
                              ),
                              SvgPicture.asset(
                                Assets.iconsArrowRight,
                                color: AppColors.shade3,
                                height: 24,
                                width: 24,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CommonWidgetButton(
                          text: "Выйти из профиля",
                          openPath: () {
                            showDialog(
                                context: context,
                                barrierColor: AppColors.black.withOpacity(0.3),
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    content: Text('Хотите выйти из профиля??'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Dismiss the dialog
                                          Navigator.pop(context, false);
                                        },
                                        child: Text('Отмена'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Dismiss the dialog and proceed with dismissal
                                          Navigator.pop(context, true);
                                        },
                                        child: Text('Выйти'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          colorButton: AppColors.shade1,
                          margin: 0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            child: Text(
                              "Удалить профиль?",
                              style: AppTextStyles.body16GeologicaLight
                                  .copyWith(color: AppColors.red),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierColor: AppColors.black.withOpacity(0.3),
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.white,
                                    content: Align(
                                        child: Text(
                                            'навсегда удалить ваш профиль??')),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          // Dismiss the dialog
                                          Navigator.pop(context, false);
                                        },
                                        child: Text('Отмена'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Dismiss the dialog and proceed with dismissal
                                          Navigator.pop(context, true);
                                        },
                                        child: Text('Удалить'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }),
                        if (MediaQuery.of(context).viewPadding.bottom <=
                            20) ...[
                          SizedBox(
                            height: 35.h,
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
    ;
  }
}
