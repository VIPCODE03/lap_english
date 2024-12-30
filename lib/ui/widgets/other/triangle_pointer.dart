import 'package:flutter/material.dart';

class TrianglePointerView extends StatelessWidget {
  final double triangleSize;
  final double angle;
  final Color color;

  const TrianglePointerView({
    super.key,
    this.triangleSize = 20,
    this.angle = 0.5,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(triangleSize, triangleSize),
      painter: TrianglePointerPainter(color: color, angle: angle),
    );
  }
}

class TrianglePointerPainter extends CustomPainter {
  final Color color;
  final double angle;

  TrianglePointerPainter({required this.color, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    //--- Tính toán điểm ---
    final double halfWidth = size.width / 2;
    final double baseWidth = size.width / 2 * angle;
    final double height = size.height / 2;

    //--- Vẽ tam giác ---
    final Path path = Path()
      ..moveTo(halfWidth, 0) /// Đỉnh
      ..lineTo(baseWidth, height) /// Góc dưới trái
      ..lineTo(size.width - baseWidth, height) /// Góc dưới phải
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}