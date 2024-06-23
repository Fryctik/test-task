import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final String whoIs = isMe ? 'Вы' : 'Администратор';
    var dropdownStyleData = DropdownStyleData(
      width: 246.sp,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.shade1,
      ),
      offset: const Offset(40, -4),
    );
    final menuItemStyleData = MenuItemStyleData(
      customHeights: _getCustomItemsHeights(),
      padding: EdgeInsets.zero,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                openWithLongPress: kReleaseMode,
                onChanged: (value) {
                  // MenuItems.onChanged(context, value! as MenuItem);
                },
                buttonStyleData: ButtonStyleData(
                  // This is necessary for the ink response to match our customButton radius.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                dropdownStyleData: dropdownStyleData,
                menuItemStyleData: menuItemStyleData,
                customButton: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.main : AppColors.shade1,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: SizedBox(
                    width: isMe ? 258.sp : 275.sp,
                    child: Text(
                      text,
                      style: AppTextStyles.body16GeologicaLight.copyWith(
                          color: isMe ? Colors.white : AppColors.black),
                    ),
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'Copy',
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'Копировать текст',
                        style: AppTextStyles.body14GeologicaLight,
                      ),
                    ),
                  ),
                  const DropdownMenuItem<String>(
                    enabled: false,
                    child: Divider(),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Delete',
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'Удалить',
                        style: AppTextStyles.body14GeologicaLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: whoIs,
                      style: AppTextStyles.body14GeologicaLight
                          .copyWith(color: AppColors.shade3),
                      children: [
                        TextSpan(
                          text: ' в $time',
                          style: AppTextStyles.body14GeologicaLight
                              .copyWith(color: AppColors.shade2),
                        ),
                      ],
                    ),
                  ),
                  if (isMe)
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: SvgPicture.asset(Assets.assetsIconsDoubleCheck),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < 3; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }
}
