import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/pages/main/view/usluga/components/custom_instraction_view.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0),
              child: Container(
                alignment: Alignment.topCenter,
                height: 30,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(color: AppColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20,),
                    CustomBackButton(onBack: () {
                      context.pop();
                    }),
                    SizedBox(width: 40,),
                    Text(
                      "ИНСТРУКЦИЯ",
                      style: AppTextStyles.body16UnboundedMedium,
                    ),
                    Expanded(child: SizedBox()),

                  ],
                ),
              ),
            ),
            Expanded(child: CustomTabBarInstractionView()),
          ],
        ),
      ),
    );
  }
}
