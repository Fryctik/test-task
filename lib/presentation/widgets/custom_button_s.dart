import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/generated/assets.dart';



class CustomButtonS extends StatefulWidget {
  const CustomButtonS({super.key, required this.active});
  final  bool active;

  @override
  State<CustomButtonS> createState() => _CustomButtonSState();
}

class _CustomButtonSState extends State<CustomButtonS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(color:widget.active == true ?AppColors.accent : AppColors.shade1,borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: SvgPicture.asset(widget.active == true ?Assets.iconsAttachmentsWhite : Assets.iconsAttachmentsGreen,height: 24,width: 24,fit: BoxFit.cover,),
      ),
    );
  }
}
