import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class RandomColorContainer extends StatelessWidget {
  final Widget? child;

  const RandomColorContainer({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.randomColor,
      child: child,
    );
  }
}
