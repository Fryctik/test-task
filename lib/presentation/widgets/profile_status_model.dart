import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:glowy_borders/glowy_borders.dart';
import 'package:test/config/contstants/app_colors.dart';

import 'package:test/config/contstants/app_text_styles.dart';


class BadgeItem {
  final String img;
  final String text;
  final Color color;
  final List<Color> gradient;
  BadgeItem(this.gradient,
      {required this.img, required this.text, required this.color});
}

class BadgeWidget extends StatelessWidget {
  final BadgeItem badge;

  BadgeWidget({required this.badge});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: AnimatedGradientBorder(
        borderSize: 1,
        gradientColors: badge.gradient,
        borderRadius: BorderRadius.circular(40),
        child: Container(

          padding: const EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: AppColors.white),
          height: 30,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: AppColors.white),

            child: Row(
              children: [
                SvgPicture.asset(badge.img,colorFilter: ColorFilter.mode(badge.color, BlendMode.srcIn),),
                SizedBox(width: 10),
                Text(badge.text, style: AppTextStyles.body14GeologicaLight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// class AnimatedGradientBadge extends StatefulWidget {
//   final BadgeItem badge;
//
//   const AnimatedGradientBadge({Key? key, required this.badge}) : super(key: key);
//
//   @override
//   _AnimatedGradientBadgeState createState() => _AnimatedGradientBadgeState();
// }
//
// class _AnimatedGradientBadgeState extends State<AnimatedGradientBadge> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _animation1;
//   late Animation<Color?> _animation2;
//   late Animation<Color?> _animation3;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     _animation1 = ColorTween(
//       begin: widget.badge.gradient[0],
//       end: widget.badge.gradient[1],
//     ).animate(_controller);
//
//     _animation2 = ColorTween(
//       begin: widget.badge.gradient[1],
//       end: widget.badge.gradient[2],
//     ).animate(_controller);
//
//     _animation3 = ColorTween(
//       begin: widget.badge.gradient[2],
//       end: widget.badge.gradient[0],
//     ).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return UnconstrainedBox(
//           child: Container(
//             height: 30,
//             padding: const EdgeInsets.symmetric(horizontal: 13),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(40),
//               border: GradientBoxBorder(
//                 gradient: LinearGradient(
//                   colors: [
//                     _animation1.value!,
//                     _animation2.value!,
//                     _animation3.value!,
//                   ],
//                 ),
//               ),
//             ),
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   widget.badge.img,
//                   colorFilter: ColorFilter.mode(widget.badge.color, BlendMode.srcIn),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   widget.badge.text,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(color: widget.badge.color, fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
