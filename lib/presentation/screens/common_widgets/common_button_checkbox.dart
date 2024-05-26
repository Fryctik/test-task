import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class CommonButtonCheckbox extends StatefulWidget {
  const CommonButtonCheckbox({
    required this.title,
    required this.isCheck,
    this.isEnabled = true,
    required this.onTap,
    super.key,
  });

  final String title;
  final bool isCheck;
  final bool isEnabled;
  final void Function()? onTap;

  @override
  State<CommonButtonCheckbox> createState() => _CommonButtonCheckboxState();
}

class _CommonButtonCheckboxState extends State<CommonButtonCheckbox> {
  bool _isPressed = false;

  void _onTap() async {
    if (widget.onTap != null) {
      setState(() {
        _isPressed = true;
      });
      setState(() {
        _isPressed = false;
      });

      if (!_isPressed) widget.onTap!();
    }
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  Color get _backgroundColor =>
      widget.isCheck ? AppColors.main : AppColors.white;

  Color get _borderColor => widget.isEnabled
      ? _isPressed || widget.isCheck
          ? AppColors.mainDark
          : AppColors.main
      : AppColors.shade2;

  Color get _getTextColor => widget.isEnabled
      ? widget.isCheck
          ? AppColors.white
          : _isPressed
              ? AppColors.mainDark
              : AppColors.main
      : AppColors.shade2;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: GestureDetector(
        onTap: _onTap,
        onTapCancel: _onTapCancel,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
            border: Border.all(
              color: _borderColor,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 36,
                width: 36,
                color: AppColors.shade2,
              ),
              const SizedBox(width: 8),
              Text(
                widget.title,
                style: textTheme.headlineMedium?.copyWith(
                  color: _getTextColor,
                ),
              ),
              const Spacer(),
              widget.isCheck
                  ? const Icon(
                      Icons.check_outlined,
                      color: AppColors.white,
                      size: 24,
                    )
                  : widget.isEnabled
                      ? const SizedBox()
                      : Text(
                          'Скоро появится',
                          style: textTheme.bodyLarge?.copyWith(
                            color: AppColors.shade2,
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
