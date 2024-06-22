import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class ChatBottomRowWidget extends StatelessWidget {
  const ChatBottomRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      hintText: 'Написать',
      hintStyle: AppTextStyles.body16GeologicaLight.copyWith(
        color: AppColors.shade3,
      ),
      // prefixText: "+7 ",
      // prefixStyle:
      // AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade1),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: AppColors.main,
          width: 1,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: AppColors.main,
          width: 1,
        ),
      ),
      fillColor: AppColors.shade1,
      filled: true,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton.filled(
              iconSize: 28,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.shade1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: SvgPicture.asset(
                Assets.iconsAttachmentsGreen,
                fit: BoxFit.cover,
              ),
              onPressed: () {},
            ),
            Flexible(
              child: TextField(
                decoration: textFieldDecoration,
              ),
            ),
            IconButton.filled(
              iconSize: 28,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.shade1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: Transform.rotate(
                angle: 90 * pi / 180,
                child: SvgPicture.asset(
                  Assets.iconsBackButtonAccent,
                  // height: 24,
                  // width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.shade2,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
