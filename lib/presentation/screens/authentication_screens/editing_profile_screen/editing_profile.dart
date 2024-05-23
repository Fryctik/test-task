import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_birthday.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_email.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_name.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/selection_city.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/selection_gender.dart';
import 'package:test/presentation/theme/theme.dart';

@RoutePage()
class EditingProfileScreen extends StatefulWidget {
  const EditingProfileScreen({super.key});

  @override
  State<EditingProfileScreen> createState() => _EditingProfileScreenState();
}

class _EditingProfileScreenState extends State<EditingProfileScreen> {
  final _nameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 38),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.router.back(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: AppColors.accent,
                                weight: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  'Назад',
                                  style:
                                      theme.textTheme.displayMedium?.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'ПРОФИЛЬ',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 33, 0, 32),
                      child: SizedBox(
                        width: 158,
                        height: 158,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 37),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppColors.shade2,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 15,
                                              ),
                                              child: GestureDetector(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  'Выбрать фото из галереи',
                                                  style: theme
                                                      .textTheme.bodyMedium
                                                      ?.copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 21, 117, 214),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Color.fromRGBO(116, 116, 130, 0.357),
                                              height: 0,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 15,
                                              ),
                                              child: GestureDetector(
                                                child: Text(
                                                  'Сделать фото',
                                                  textAlign: TextAlign.center,
                                                  style: theme
                                                      .textTheme.bodyMedium
                                                      ?.copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 21, 117, 214),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Color.fromRGBO(116, 116, 130, 0.357),
                                              height: 0,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 15,
                                              ),
                                              child: GestureDetector(
                                                child: Text(
                                                  'Удалить фото',
                                                  textAlign: TextAlign.center,
                                                  style: theme
                                                      .textTheme.bodyMedium
                                                      ?.copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 21, 117, 214),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/image/human.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                'assets/icons/camera.png',
                                width: 36,
                                height: 36,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        InputNameWidget(
                          theme: theme,
                          formKey: _nameKey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: InputEmailWidget(
                            theme: theme,
                            formKey: _emailKey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: SelectionCityWidget(
                            theme: theme,
                            onSelectionChanged: (isSelected) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: InputBirthdayWidget(theme: theme),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: SelectionGenderWidget(theme: theme),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_nameKey.currentState!.validate()) {}
                              if (_emailKey.currentState!.validate()) {}
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.main,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20)),
                            child: Text(
                              'СОХРАНИТЬ',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
