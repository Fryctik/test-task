import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';

class ProcessDeliveryView extends StatefulWidget {
  const ProcessDeliveryView({super.key});

  @override
  State<ProcessDeliveryView> createState() => _ProcessDeliveryViewState();
}

class _ProcessDeliveryViewState extends State<ProcessDeliveryView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
            child: CustomBackButton(onBack: (){
              context.pop();
            },),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Оформление доставки",style: AppTextStyles.body32UnboundedSemiBold,),
          )
        ],
      ),
    );
  }
}
