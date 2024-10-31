import 'package:flutter/material.dart';

class WdgAnimatedProgressBar extends StatelessWidget {
  final double value; //->  Giá trị phần trăm
  final String label; //->  Chuỗi hiển thị bên trong
  final Duration duration; //-> Thời gian cho hiệu ứng

  const WdgAnimatedProgressBar({
    super.key,
    required this.value,
    required this.label,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
        child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: duration,
                  builder: (context, double animatedValue, child) {
                    return Container(
                      height: double.infinity,
                      width: animatedValue * constraints.maxWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor.withAlpha(70)
                      ),
                    );
                  },
                ),

                Center(
                  child: Text(label),
                ),
              ],
          );
        }),
    );
  }
}