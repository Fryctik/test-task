import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class ChatEmptyBodyWidget extends StatelessWidget {
  const ChatEmptyBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        Image(
            width: 120.sp,
            height: 120.sp,
            image: const AssetImage(Assets.imageMessages)),
        SizedBox(height: 12.sp),
        Text(
          'ЗАДАЙТЕ ВАШ ВОПРОС',
          style: AppTextStyles.body16UnboundedMedium.copyWith(
            color: AppColors.shade3,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}