import 'package:flutter/material.dart';

class BaseElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final Color? color;
  final Color? textColor;
  final double? elevation;

  const BaseElevatedButton({Key? key, required this.onPressed, this.padding, this.color, this.textColor, this.elevation = 0, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(padding),
        backgroundColor: MaterialStateProperty.all<Color?>(color),
        foregroundColor: MaterialStateProperty.all<Color?>(textColor),
        elevation: MaterialStateProperty.all<double?>(elevation),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
