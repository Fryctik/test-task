import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_text_styles.dart';

class CustomQuitButton extends StatefulWidget {
  const CustomQuitButton({super.key, required this.backgroundColor, required this.textColor, required this.textStyle});
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle textStyle;

  @override
  State<CustomQuitButton> createState() => _CustomQuitButtonState();
}

class _CustomQuitButtonState extends State<CustomQuitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44,
        width: 350.w,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),),
      child: Center(
        child: Text("Выйти из профиля",style: widget.textStyle.copyWith(color: widget.textColor),),
      ),
    );
  }
}
