import 'package:flutter/material.dart';

class CircleDecoration extends Decoration {
  final BoxPainter _painter;

  CircleDecoration({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset + Offset(configuration.size!.width / 2, configuration.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
