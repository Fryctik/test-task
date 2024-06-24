import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/config/contstants/app_colors.dart';

final theme = ThemeData(

dialogBackgroundColor: AppColors.white,
  cupertinoOverrideTheme: CupertinoThemeData(
    barBackgroundColor:AppColors.white
  ),

  dialogTheme:const DialogTheme(backgroundColor: Colors.white),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white)

);
