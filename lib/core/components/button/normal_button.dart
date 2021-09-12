import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class NormalButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;

  const NormalButton({
    Key? key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(context.paddingNormal),
        elevation: MaterialStateProperty.all<double>(10),
        foregroundColor: MaterialStateProperty.all<Color>(context.buttonColors.onPrimary),
        backgroundColor: MaterialStateProperty.all<Color>(context.colors.primary),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
