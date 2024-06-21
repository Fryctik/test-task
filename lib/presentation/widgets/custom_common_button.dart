import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CommonWidgetButton extends StatelessWidget {
  const CommonWidgetButton({
    this.margin,
    super.key,
    required this.text,
    this.colorButton,
    this.textColor,
    this.ignorePoint,
    required this.openPath,

  });

  final String text;
  final Color? colorButton;
  final Color? textColor;
  final bool? ignorePoint;
  final Function() openPath;
  final double ? margin;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePoint == null? false: ignorePoint!,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: margin?? 20.w),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: openPath,
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.w)),
          child: Text(
            text,
            style: AppTextStyles.body16UnboundedMedium.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
