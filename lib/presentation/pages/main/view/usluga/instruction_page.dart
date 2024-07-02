import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/pages/main/components/custom_instraction_view.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomBackButton(onBack: () {
                  context.pop();
                }),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "ИНСТРУКТИЦИЯ",
                style: AppTextStyles.body16UnboundedMedium,
              ),
            ],
          ),
          Expanded(child: CustomTabBarInstractionView()),
        ],
      ),
    );
  }
}
