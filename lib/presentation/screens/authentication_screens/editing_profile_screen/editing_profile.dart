import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:test/presentation/screens/authentication_screens/common_widgets/common_button.dart';
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
                                  style: theme.textTheme.displayMedium?.copyWith(
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
                              image: AssetImage('assets/image/photo.png'),
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
                        text: 'сохранить',
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

class InputNameWidget extends StatelessWidget {
  const InputNameWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Row(
            children: [
              Text(
                'ВАШЕ ИМЯ ',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '*',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.red,
                ),
              )
            ],
          ),
        ),
        TextField(
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[а-я]')),
          ],
          textCapitalization: TextCapitalization.sentences,
          cursorColor: AppColors.main,
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.black),
          onChanged: (value) {},
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            fillColor: AppColors.shade1,
            filled: true,
          ),
        )
      ],
    );
  }
}

class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<InputEmailWidget> createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    setState(() {
      _isValid = pattern.hasMatch(_emailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Row(
            children: [
              Text(
                'E-MAIL',
                style: widget.theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                '*',
                style: widget.theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.red,
                ),
              )
            ],
          ),
        ),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.main,
          style: widget.theme.textTheme.bodyMedium
              ?.copyWith(color: AppColors.black),
          onChanged: (value) {},
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            fillColor: AppColors.shade1,
            filled: true,
          ),
        )
      ],
    );
  }
}

class SelectionCityWidget extends StatefulWidget {
  const SelectionCityWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<SelectionCityWidget> createState() => _SelectionCityWidgetState();
}

class _SelectionCityWidgetState extends State<SelectionCityWidget> {
  String _selectedItem = 'Выбрать';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Row(
            children: [
              Text(
                'ГОРОД ',
                style: widget.theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                '*',
                style: widget.theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 52,
          padding: const EdgeInsets.only(left: 16).copyWith(right: 14),
          decoration: BoxDecoration(
            color: AppColors.shade1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            focusColor: AppColors.shade1,
            // elevation: 0,
            // itemHeight: 52,

            items: <String>['Выбрать', 'Город', 'Город 2', 'Город 3', 'Город 4']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  child: Text(value),
                ),
              );
            }).toList(),
            value: _selectedItem,
            onChanged: (newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
            },
            isExpanded: true,
            dropdownColor: AppColors.shade1,
            borderRadius: const BorderRadius.all(const Radius.circular(20)),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              weight: 2,
            ),
            iconDisabledColor: AppColors.shade3,
            underline: Container(),
          ),
        )
      ],
    );
  }
}

class InputBirthdayWidget extends StatelessWidget {
  const InputBirthdayWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            'ДАТА РОЖДЕНИЯ',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          textCapitalization: TextCapitalization.sentences,
          cursorColor: AppColors.main,
          style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.black),
          onChanged: (value) {},
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: AppColors.main,
                width: 1,
              ),
            ),
            fillColor: AppColors.shade1,
            filled: true,
          ),
        )
      ],
    );
  }
}

class SelectionGenderWidget extends StatefulWidget {
  const SelectionGenderWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<SelectionGenderWidget> createState() => _SelectionGenderWidgetState();
}

class _SelectionGenderWidgetState extends State<SelectionGenderWidget> {
  String _selectedItem = 'Выбрать';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Text(
            'ПОЛ',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 52,
          padding: const EdgeInsets.only(left: 16).copyWith(right: 14),
          decoration: BoxDecoration(
            color: AppColors.shade1,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            focusColor: AppColors.shade1,
            items:
                <String>['Выбрать', 'Мужской', 'Женский'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  child: Text(value),
                ),
              );
            }).toList(),
            value: _selectedItem,
            onChanged: (newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
            },
            isExpanded: true,
            dropdownColor: AppColors.shade1,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              weight: 2,
            ),
            iconDisabledColor: AppColors.shade3,
            underline: Container(),
          ),
        )
      ],
    );
  }
}
