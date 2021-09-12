import 'package:flutter/material.dart';

import 'normal_button.dart';

class MavTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const MavTextButton({Key? key, this.onPressed, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Text(text!),
      ),
    );
  }
}
