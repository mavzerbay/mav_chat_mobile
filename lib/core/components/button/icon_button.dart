import 'package:flutter/material.dart';

import 'normal_button.dart';

class MavIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;

  const MavIconButton({Key? key, this.onPressed, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
