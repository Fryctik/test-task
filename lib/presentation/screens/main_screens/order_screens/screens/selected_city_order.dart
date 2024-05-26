import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/presentation/screens/common_widgets/common_back_button.dart';
import 'package:test/presentation/screens/common_widgets/common_button.dart';
import 'package:test/presentation/theme/theme.dart';

@RoutePage()
class SelectedCityOrderScreen extends StatefulWidget {
  const SelectedCityOrderScreen({super.key, });


  @override
  State<SelectedCityOrderScreen> createState() =>
      _SelectedCityOrderScreenState();
}

class _SelectedCityOrderScreenState extends State<SelectedCityOrderScreen> {
  bool _isKorolevSelected = false;
  bool _isMitishiSelected = false;

  void onPressed(){
    final tabsOrderRoute = AutoTabsRouter.of(context);
    tabsOrderRoute.setActiveIndex(1);
  }

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
                    onTap: () {},
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
                  'Выберите\nваш город',
                  style: theme.textTheme.headlineLarge
                      ?.copyWith(color: AppColors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isMitishiSelected = false;
                    _isKorolevSelected = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isKorolevSelected
                            ? AppColors.mainDark
                            : AppColors.main,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      color:
                          _isKorolevSelected ? AppColors.main : AppColors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'КОРОЛЕВ',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            height: 24 / 16,
                            color: _isKorolevSelected
                                ? AppColors.white
                                : AppColors.main,
                          ),
                        ),
                        _isKorolevSelected
                            ? Image.asset(
                                'assets/icons/check.png',
                                height: 24,
                                width: 24,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isKorolevSelected = false;
                    _isMitishiSelected = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: BoxDecoration(
                      color:
                          _isMitishiSelected ? AppColors.main : AppColors.white,
                      border: Border.all(
                          color: _isMitishiSelected
                              ? AppColors.mainDark
                              : AppColors.main,
                          width: 2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'МЫТИЩИ',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            height: 24 / 16,
                            color: _isMitishiSelected
                                ? AppColors.white
                                : AppColors.main,
                          ),
                        ),
                        _isMitishiSelected
                            ? Image.asset(
                                'assets/icons/check.png',
                                height: 24,
                                width: 24,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.shade3, width: 2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'МОСКВА',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppColors.shade2,
                        ),
                      ),
                      Text(
                        'Скоро появится',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.shade2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          CommonWidgetButton(
            text: 'ДАЛЕЕ',
            colorButton: AppColors.main,
            textColor: AppColors.white,
            onTap: onPressed,
          )
        ],
      ),
    );
  }
}
