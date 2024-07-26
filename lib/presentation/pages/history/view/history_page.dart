import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/history/components/custom_card_process.dart';
import 'package:test/presentation/pages/history/components/custom_card_v_rabote.dart';
import 'package:test/presentation/pages/history/components/custom_card_otmeneno.dart';
import 'package:test/presentation/pages/history/components/custom_card_vipolnen.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {

  bool moreVisible1 = false;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                child: Text(
                  "ИСТОРИЯ ЗАКАЗОВ",
                  style: AppTextStyles.body16UnboundedMedium,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(height: 36,),
                    CustomCard1(),
                    SizedBox(
                      height: 16,
                    ),
                    CustomCard2(),
                    SizedBox(
                      height: 16,
                    ),
                    CustomCard3(),
                    SizedBox(
                      height: 16,
                    ),
                    CustomCardProcess(),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
