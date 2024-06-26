import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/data/local/models/profile_model.dart';
import 'package:test/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';
import 'package:test/presentation/widgets/profile_status_model.dart';

import '../../../../config/contstants/app_colors.dart';
import '../../../../config/contstants/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../widgets/custom_back_button.dart';

class ProfileEditPageView extends StatefulWidget {
  const ProfileEditPageView({super.key});

  @override
  State<ProfileEditPageView> createState() => _ProfileEditPageViewState();
}

class _ProfileEditPageViewState extends State<ProfileEditPageView> {
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

  final List<BadgeItem> badges = [
    BadgeItem(img: Assets.iconsStar16x16, text: 'Зелёный новобранец', color: AppColors.accent , [AppColors.white,AppColors.black,AppColors.accent]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Гик - собиратель', color: Color(0xffDADE2E),[AppColors.white,AppColors.black,Color(0xffDADE2E)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Знаток фракций', color: Color(0xffF0BB31),[AppColors.white,AppColors.black,Color(0xffF0BB31)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Мастер сортировки', color: Color(0xffF08131),[AppColors.white,AppColors.black,Color(0xffF0BB31)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Эко рейнджер', color: Color(0xffF03131),[AppColors.white,AppColors.black,Color(0xffF03131)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Гуру ресурсов', color: Color(0xffF234EB),[AppColors.white,AppColors.black,Color(0xffF234EB)]),
    BadgeItem(img:Assets.iconsStar16x16, text: 'Гигант утилизатор', color: Color(0xff8F42E3),[AppColors.white,AppColors.black,Color(0xff8F42E3)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Спаситель природы', color: Color(0xff2848ED),[AppColors.white,AppColors.black,Color(0xff2848ED)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Хранитель экосистем', color: Color(0xff228EF2),[AppColors.white,AppColors.black,Color(0xff228EF2)]),
    BadgeItem(img: Assets.iconsStar16x16, text: 'Вершитель биосферы', color: Color(0xff1CD1EA),[AppColors.white,AppColors.black,Color(0xff1CD1EA)]),
  ];


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
                                    context.pop();
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.pushNamed('new_edit_profile');
                                  },
                                  child: SvgPicture.asset(
                                    Assets.iconsEdit,
                                    height: 24,
                                    width: 24,
                                    fit: BoxFit.cover,
                                  ),
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
                        ///
                     BlocBuilder<ProfileCubit,Profile>(
                       builder: (context, state) {
                         return Column(
                           children: [
                             Stack(
                               alignment: Alignment.bottomCenter,
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

                                 BadgeWidget(badge: badges[9]),

                                 // Center(
                                 //   child: Container(
                                 //     width: 200,
                                 //     alignment: Alignment.center,
                                 //     padding: EdgeInsets.symmetric(
                                 //         vertical: 6, horizontal: 13),
                                 //     margin: EdgeInsets.only(
                                 //       top: 138,
                                 //     ),
                                 //     decoration: BoxDecoration(
                                 //         border: Border.all(
                                 //             width: 1, color: AppColors.main),
                                 //         borderRadius: BorderRadius.circular(40),
                                 //         color: AppColors.white),
                                 //     child: Row(
                                 //       children: [
                                 //         SvgPicture.asset(
                                 //           Assets.iconsStar,
                                 //           height: 16,
                                 //           width: 16,
                                 //           fit: BoxFit.cover,
                                 //         ),
                                 //         SizedBox(
                                 //           width: 10,
                                 //         ),
                                 //         Text(
                                 //           "Железная мафия",
                                 //           style:
                                 //           AppTextStyles.body14GeologicaRegular,
                                 //         ),
                                 //       ],
                                 //     ),
                                 //   ),
                                 // ),
                               ],
                             ),
                             Text(
                               state.name,
                               textAlign: TextAlign.center,
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
                                 Flexible(
                                   child: Text(
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     state.phoneNumber,
                                     style: AppTextStyles.body16GeologicaLight,
                                   ),
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
                                 Flexible(
                                   child: Text(
                                     maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    state.email,
                                     style: AppTextStyles.body16GeologicaLight,
                                   ),
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
                                 Flexible(
                                   child: Text(
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                    state.city,
                                     style: AppTextStyles.body16GeologicaLight,
                                   ),
                                 )
                               ],
                             ),
                             SizedBox(
                               height: 20,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Flexible(
                                   child: Text(
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     "Дата рождения",
                                     style: AppTextStyles.body16GeologicaExtraLight
                                         .copyWith(color: AppColors.shade3),
                                   ),
                                 ),
                                 Text(
                                   context.read<ProfileCubit>().convertDate(state.dateOfBirth),
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
                                 Flexible(
                                   child: Text(
                                     maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     state.gender,
                                     style: AppTextStyles.body16GeologicaLight,
                                   ),
                                 )
                               ],
                             ),
                           ],
                         );
                       }
                     ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed('privacy_policy');
                          },
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
                          textColor: AppColors.black,
                          text: "Выйти из профиля",
                          openPath: () {
                            showDialog(
                                context: context,
                                barrierColor: AppColors.black.withOpacity(0.3),
                                builder: (context) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      dialogBackgroundColor: Colors.white,
                                    ),
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.center,
                                      actionsAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      actionsOverflowAlignment:
                                          OverflowBarAlignment.start,
                                      content: Text(
                                        'ХОТИТЕ ВЫЙТИ ИЗ ПРОФИЛЯ?',
                                        textAlign: TextAlign.center,
                                        style:
                                            AppTextStyles.body16UnboundedMedium,
                                      ),
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context,rootNavigator: true).pop();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: AppColors.shade1,
                                                ),
                                                alignment: Alignment.center,
                                                height: 44,
                                                child: Text(
                                                  "Остаться",
                                                  style: AppTextStyles
                                                      .body16GeologicaSemiBold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ///custom
                                                context.pushReplacementNamed("/onboarding");
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: AppColors.shade1,
                                                ),
                                                alignment: Alignment.center,
                                                height: 44,
                                                child: Text(
                                                  "Выйти ",
                                                  style: AppTextStyles
                                                      .body16GeologicaLight
                                                      .copyWith(
                                                          color: AppColors.red),
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    content: Text(
                                      'НАВСЕГДА УДАЛИТЬ ВАШ ПРОФИЛЬ?',
                                      textAlign: TextAlign.center,
                                      style:
                                          AppTextStyles.body16UnboundedMedium,
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context,rootNavigator: true).pop();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: AppColors.shade1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 44,
                                              child: Text(
                                                "Отменить",
                                                style: AppTextStyles
                                                    .body16GeologicaSemiBold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // context.pop();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: AppColors.shade1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 44,
                                              child: Text(
                                                "Удалить ",
                                                style: AppTextStyles
                                                    .body16GeologicaLight
                                                    .copyWith(
                                                        color: AppColors.red),
                                              ),
                                            ),
                                          ),
                                        ],
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
