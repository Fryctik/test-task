import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required this.isError , required this.selectedItem, required this.customList, required this.onTap});

  final bool isError;
  final List<String> customList;
  final String selectedItem ;
  final void Function(String item) onTap;


  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  bool isShowError = true;
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
      FocusManager.instance.primaryFocus!.unfocus();
      isOpen = !isOpen;
      if (isOpen) {
          isShowError = false;
          print("done1");
        _controller.forward();
          print("done2");
      } else {
        _controller.reverse();
        print("done3");
        Future.delayed(Duration(milliseconds: 400), () {
          isShowError = true;
          print("done4");
          print(isShowError);
        });
        print("done5");
        print(isShowError);
      }
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayItems = [
     widget.selectedItem ,
      ...widget.customList.where((item) => item != widget.selectedItem)
    ];
    return Stack(
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            // duration: const Duration(seconds: 300),
            height: 54,
            width: 350.w,
            decoration: BoxDecoration(
                color: widget.isError? AppColors.softRed: AppColors.shade1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: widget.isError? AppColors.red : AppColors.shade1 , width: 1)),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    widget.selectedItem,
                    style: AppTextStyles.body16GeologicaLight.copyWith(
                        color: widget.isError? AppColors.red: widget.selectedItem == 'Выбрать' || widget.selectedItem == "Выберите пункт получения"
                            ? AppColors.shade3
                            : AppColors.black),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    Assets.iconsArrowDown,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(widget.isError? AppColors.red: AppColors.shade3, BlendMode.srcIn),
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

            height: widget.customList.any((element) => element == widget.selectedItem)

                ? ( 52 * widget.customList.length) + 2
                : (52 * (widget.customList.length + 1)) + 2,
            decoration: BoxDecoration(
                color: widget.isError? AppColors.softRed: AppColors.shade1,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color:widget.isError ? AppColors.red : AppColors.main, width: 1)),
            child: Column(
              children: [
                ...List.generate(displayItems.length, (index) {
                  if (index == 0 && widget.selectedItem == displayItems[index]) {
                    return GestureDetector(
                      onTap: () {
                        print(widget.customList);
                        setState(() {
                          toggleDropdown();
                        });
                        widget.onTap(displayItems[index]);
                      },
                      child: Container(
                        height: 52.0,
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: widget.isError? AppColors.softRed: AppColors.shade1,
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
                          color: widget.isError ? AppColors.softRed : AppColors.shade1,
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
                          color: widget.isError ? AppColors.softRed : AppColors.shade1,
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
                }),

              ],
            ),

          ),

        ),

        // isShowError == true? widget.isError  == false ?SizedBox.shrink() :Container(
        //   margin:  EdgeInsets.only(top: 60,),
        //   child: Align(
        //     alignment: Alignment.topLeft,
        //     child: Text(widget.customList.length == 2 ? 'Выберите пол' : "Выберите город", style: AppTextStyles.body14GeologicaLight.copyWith(
        //       color: AppColors.red,
        //     ),
        //     ),
        //   ),
        // ): SizedBox.shrink()

      ],

    );

  }

}

