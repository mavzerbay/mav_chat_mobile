import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  final int? itemCount;
  final int? currentIndex;
  final Widget Function(int index)? onListItem;

  const IndicatorListView({Key? key, this.itemCount, this.onListItem, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) => buildPadding(context, index),
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    bool isCurrentIndex = currentIndex == index;
    return CircleAvatar(
      backgroundColor: isCurrentIndex ? Colors.black12 : Colors.blue,
      radius: isCurrentIndex ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: isCurrentIndex ? 1 : 0,
        duration: context.durationMS500,
        child: onListItem!(index),
      ),
    );
  }
}
