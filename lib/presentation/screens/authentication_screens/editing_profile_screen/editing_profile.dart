import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_birthday.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_email.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_name.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/photo_mobal_bottom_sheet.dart';
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
                        child: PhotoModalBottomSheet(theme: theme),
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
