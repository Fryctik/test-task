import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';


enum ContainerStatus{
  filled,
  border,
  disabled,
  def,

}

class CustomButtonS2 extends StatefulWidget {
  const CustomButtonS2({super.key, required this.containerStatus});
  final ContainerStatus containerStatus;

  @override
  State<CustomButtonS2> createState() => _CustomButtonS2State();
}

class _CustomButtonS2State extends State<CustomButtonS2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration:  widget.containerStatus == ContainerStatus.filled ||  widget.containerStatus == ContainerStatus.border? BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border:  widget.containerStatus == ContainerStatus.border ? Border.all(width: 2,color: AppColors.main) : null,
          color:  widget.containerStatus == ContainerStatus.filled ? AppColors.main: null) : null,
      child: Center(
        child: Text("30",style: widget.containerStatus == ContainerStatus.disabled || widget.containerStatus == ContainerStatus.def ?AppTextStyles.body16GeologicaLight.copyWith(color:widget.containerStatus == ContainerStatus.disabled ? AppColors.shade2 : AppColors.black ) :  AppTextStyles.body16GeologicaLight.copyWith(color: widget.containerStatus == ContainerStatus.filled? AppColors.white :AppColors.black ),),)
    );
  }
}
