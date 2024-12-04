import 'package:flutter/material.dart';

class WdgDashedBorder extends StatelessWidget {
  final Color? color;
  final double? dashWidth;
  final double? dashSpace;
  final double? strokeWidth;
  final Widget child;

  const WdgDashedBorder({
    super.key,
    this.color,
    this.dashWidth,
    this.dashSpace,
    this.strokeWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: color,
        dashWidth: dashWidth ?? 5,
        dashSpace: dashSpace ?? 5,
        strokeWidth: strokeWidth ?? 1,
      ),
      child: child,
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color? color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;

  _DashedBorderPainter({
    this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    //--- Vẽ đường kẻ ---
    void drawDashedLine(Offset start, Offset end, bool isHorizontal) {
      double dashStart = isHorizontal ? start.dx : start.dy;
      final double max = isHorizontal ? end.dx : end.dy;

      while (dashStart < max) {
        final double dashEnd = (dashStart + dashWidth).clamp(0.0, max);
        if (isHorizontal) {
          canvas.drawLine(
            Offset(dashStart, start.dy),
            Offset(dashEnd, start.dy),
            paint,
          );
        } else {
          canvas.drawLine(
            Offset(start.dx, dashStart),
            Offset(start.dx, dashEnd),
            paint,
          );
        }
        dashStart = dashEnd + dashSpace;
      }
    }

    //--- Top ---
    drawDashedLine(const Offset(0, 0), Offset(size.width, 0), true);

    //--- Bottom ---
    drawDashedLine(Offset(0, size.height), Offset(size.width, size.height), true);

    //--- Left ---
    drawDashedLine(const Offset(0, 0), Offset(0, size.height), false);

    //--- Right ---
    drawDashedLine(Offset(size.width, 0), Offset(size.width, size.height), false);
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
}
