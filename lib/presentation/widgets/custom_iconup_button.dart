import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/generated/assets.dart';


enum IconStatus{
  active,
  inactive,
  disabled,

}

class CustomIconupButton extends StatefulWidget {
  const CustomIconupButton({super.key, required this.iconStatus});
  final IconStatus iconStatus;

  @override
  State<CustomIconupButton> createState() => _CustomIconupButtonState();
}

class _CustomIconupButtonState extends State<CustomIconupButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.iconStatus == IconStatus.active ? AppColors.main: AppColors.shade1),
      child: Center(
        child: SvgPicture.asset(Assets.assetsIconsArrowUp,colorFilter:widget.iconStatus == IconStatus.active || widget.iconStatus == IconStatus.inactive  ? ColorFilter.mode(widget.iconStatus == IconStatus.active ?  AppColors.white : AppColors.main, BlendMode.srcIn) :ColorFilter.mode( AppColors.shade2,BlendMode.srcIn),),
      ),
    );
  }
}
