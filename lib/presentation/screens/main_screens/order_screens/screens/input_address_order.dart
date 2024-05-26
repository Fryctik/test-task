import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:test/presentation/screens/common_widgets/common_back_button.dart';
import 'package:test/presentation/screens/common_widgets/common_button.dart';
import 'package:test/presentation/screens/common_widgets/custom_text_field.dart';
import 'package:test/presentation/theme/theme.dart';

@RoutePage()
class InputAddressOrderScreen extends StatefulWidget {
  const InputAddressOrderScreen({
    super.key,
  });

  @override
  State<InputAddressOrderScreen> createState() =>
      _InputAddressOrderScreenState();
}

class _InputAddressOrderScreenState extends State<InputAddressOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 74, 20, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.back();
                    },
                    child: CommonBackButton(
                      theme: theme,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/cart.png',
                      width: 24,
                      height: 24,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'Введите\nваш адрес',
                  style: theme.textTheme.headlineLarge
                      ?.copyWith(color: AppColors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Адрес',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.shade3),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: CustomTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[а-яА-Я]'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: double.infinity,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Подъезд',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.shade3),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomTextField(
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Этаж',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.shade3),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomTextField(
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Квартира',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.shade3),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomTextField(
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Код домофона',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.shade3),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomTextField(
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          CommonWidgetButton(
            text: 'ДАЛЕЕ',
            colorButton: AppColors.main,
            textColor: AppColors.white,
            onTap: () {
              
            },
          )
        ],
      ),
    );
  }
}
