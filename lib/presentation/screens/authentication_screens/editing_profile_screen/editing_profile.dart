import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/authentication_screens/common_widgets/common_button.dart';
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
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/image/human.png'),
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
                    Column(
                      children: [
                        InputNameWidget(theme: theme),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: InputEmailWidget(theme: theme),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: SelectionCityWidget(theme: theme),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: CommonWidgetButton(
                        text: 'СОХРАНИТЬ',
                        colorButton: AppColors.main,
                        textColor: AppColors.white,
                      ),
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









