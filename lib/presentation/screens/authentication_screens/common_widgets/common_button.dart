import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CommonWidgetButton extends StatelessWidget {
  const CommonWidgetButton({
    super.key,
    required this.text,
    this.colorButton,
    this.textColor,
    this.pathRoute,
  });

  final String text;
  final Color? colorButton;
  final Color? textColor;
  final dynamic pathRoute;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          
          context.router.push(pathRoute);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20)),
        child: Text(
          text,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
