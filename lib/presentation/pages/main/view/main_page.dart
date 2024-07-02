import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/chat/view/chat.dart';
import 'package:test/presentation/pages/main/manager/main/main_cubit.dart';
import 'package:test/presentation/pages/main/view/market/custom_market_view.dart';
import 'package:test/presentation/pages/main/view/home_page.dart';
import 'package:test/presentation/pages/main/view/usluga/order_registered.dart';
import '../../../../config/contstants/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: context.read<MainCubit>().pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomePage(),
                ChatPage(),
                ChatPage(),
                ChatPage(),
                ChatPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

//
//
//   Widget _buildDrawerItem(BuildContext context, {required String asset, required String text, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         children: [
//           SvgPicture.asset(asset),
//           const SizedBox(width: 10),
//           Text(
//             text,
//             style: AppTextStyles.body16GeologicaLight.copyWith(color: AppColors.shade3),
//           ),
//         ],
//       ),
//     );
//   }
}
