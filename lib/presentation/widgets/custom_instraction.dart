import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/contstants/app_colors.dart';
import '../../config/contstants/app_text_styles.dart';
import '../../generated/assets.dart';

class CustomInstraction extends StatefulWidget {
  const CustomInstraction({super.key, required this.title, required this.desc, required this.img});
  final String title;
  final String desc;
  final String img;

  @override
  State<CustomInstraction> createState() => _CustomInstractionState();
}

class _CustomInstractionState extends State<CustomInstraction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.img,
                height: 43,
                width: 43,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextStyles
                      .body16GeologicaLight,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(widget.desc,   style: AppTextStyles
              .body16GeologicaLight,),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: AppColors.shade1,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
