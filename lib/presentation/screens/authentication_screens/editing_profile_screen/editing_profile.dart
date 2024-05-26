import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/routes/routes.dart';
import 'package:test/presentation/screens/common_widgets/common_back_button.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_birthday.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_email.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/input_name.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/photo_mobal_bottom_sheet.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/selection_city.dart';
import 'package:test/presentation/screens/authentication_screens/editing_profile_screen/widget/selection_gender.dart';
import 'package:test/presentation/screens/common_widgets/common_button.dart';
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
              padding: const EdgeInsets.fromLTRB(20, 74, 20, 38),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.router.push(const IdentificationRoute()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonBackButton(theme: theme),
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
                        child: CommonWidgetButton(text: 'СОХРАНИТЬ', onTap: () {
                          if (_nameKey.currentState!.validate()) {}
                              if (_emailKey.currentState!.validate()) {}
                        },colorButton: AppColors.main, textColor: AppColors.white,)
                        )
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

