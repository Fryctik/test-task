import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';

class CustomDropdownGender extends StatefulWidget {
  const CustomDropdownGender({super.key, required this.isError, required this.selectedItem, required this.onTap});

  final bool isError;

  final String selectedItem ;
  final void Function(String item) onTap;

  @override
  _CustomDropdownGenderState createState() => _CustomDropdownGenderState();
}

class _CustomDropdownGenderState extends State<CustomDropdownGender>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _heightFactor;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayItems = [
      widget.selectedItem,
      ...gendersList.where((item) => item != widget.selectedItem)
    ];
    return Stack(
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: AnimatedContainer(
            duration: const Duration(seconds: 300),
            height: 54,
            width: 350.w,
            decoration: BoxDecoration(
                color: widget.isError? AppColors.softRed: AppColors.shade1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.shade1, width: 1)),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    widget.selectedItem,
                    style: AppTextStyles.body16GeologicaLight.copyWith(
                        color: widget.isError? AppColors.red: widget.selectedItem == 'Выбрать'
                            ? AppColors.shade3
                            : AppColors.black),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    Assets.iconsArrowDown,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(AppColors.shade3, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _heightFactor,
          axisAlignment: -1.0,
          child: Container(
            width: 350.w,
            height: gendersList.any((element) => element == widget.selectedItem)
                ? (52 * 2) + 2
                : (52 * 3) + 2,
            decoration: BoxDecoration(
                color: widget.isError? AppColors.softRed: AppColors.shade1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.main, width: 1)),
            child: Column(
              children: [
                ...List.generate(displayItems.length, (index) {
                  if (index == 0 && widget.selectedItem == displayItems[index]) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onTap(displayItems[index]);
                          toggleDropdown();
                        });
                      },
                      child: Container(
                        height: 52.0,
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: AppColors.shade1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              displayItems[index],
                              style: AppTextStyles.body16GeologicaLight.copyWith(color: widget.isError? AppColors.red: AppColors.black),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              Assets.iconsArrowUp,
                              height: 24,
                              width: 24,

                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    );
                  } else if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onTap(displayItems[index]);
                          toggleDropdown();
                        });
                      },
                      child: Container(
                        height: 52.0,
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: AppColors.shade1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              displayItems[index],
                              style: AppTextStyles.body16GeologicaLight.copyWith(
                                color: widget.isError? AppColors.red: AppColors.black,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              Assets.iconsArrowUp,
                              height: 24,
                              width: 24,
                              colorFilter: ColorFilter.mode(AppColors.shade3, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onTap(displayItems[index]);
                          toggleDropdown();
                        });
                      },
                      child: Container(
                        height: 52.0,
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: AppColors.shade1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              displayItems[index],
                              style: AppTextStyles.body16GeologicaLight.copyWith(
                                color: widget.isError? AppColors.red: AppColors.shade3,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
