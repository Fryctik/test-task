
import 'dart:developer';
import 'dart:math' as math;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class ChatBottomRowWidget extends StatefulWidget {
  const ChatBottomRowWidget({
    super.key,
    required this.controller,
    required this.onTap,
  });
  final TextEditingController controller;
  final Function() onTap;

  @override
  State<ChatBottomRowWidget> createState() => _ChatBottomRowWidgetState();
}

class _ChatBottomRowWidgetState extends State<ChatBottomRowWidget> {
  @override
  Widget build(BuildContext context) {
    double getTextFieldHeight() {
      final textPainter = TextPainter(
        text: TextSpan(
          text: widget.controller.text,
          style: AppTextStyles.body16GeologicaLight.copyWith(height: 1),
        ),
        textDirection: TextDirection.ltr,
        maxLines: null,
      );
      textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 100);
      return textPainter.size.height + 20; // Add some padding
    }

    final textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      hintText: 'Написать',
      hintStyle: AppTextStyles.body16GeologicaLight
          .copyWith(color: AppColors.shade3, height: 1),
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
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(bottom: MediaQuery.paddingOf(context).bottom + 15),
      child: SizedBox(
        width: double.maxFinite,
        // height: 38,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: AppColors.shade1,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles();
                  if (result == null) {
                    log("No file selected");
                  } else {
                    // setState(() {});
                    for (var element in result.files) {
                      log(element.name);
                    }
                  }
                },
                child: SizedBox(
                  height: 38,
                  width: 38,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      Assets.iconsAttachmentsGreen,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: getTextFieldHeight(),
                  child: TextField(
                    controller: widget.controller,
                    style:
                    AppTextStyles.body16GeologicaLight.copyWith(height: 1),
                    decoration: textFieldDecoration,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ),
            Material(
              color: AppColors.shade1,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: widget.onTap,
                child: SizedBox(
                  height: 38,
                  width: 38,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: SvgPicture.asset(
                        Assets.iconsBackButtonAccent,
                        // height: 24,
                        colorFilter: ColorFilter.mode(
                          widget.controller.text.isEmpty
                              ? AppColors.shade2
                              : AppColors.main,
                          BlendMode.srcIn,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
