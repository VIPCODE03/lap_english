import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';

class WdgItemLoading extends StatefulWidget {
  final Widget? child;

  const WdgItemLoading({super.key, this.child});

  @override
  State createState() => _WdgItemLoadingState();
}

class _WdgItemLoadingState extends State<WdgItemLoading> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 666),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey.shade500,
                Colors.grey.shade300,
                Colors.grey.shade500,
              ],
              stops: [
                _animation.value - 0.2,
                _animation.value,
                _animation.value + 0.6,
              ],
            ).createShader(bounds);
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: VipColors.onPrimary(context).withAlpha(30),
                borderRadius: BorderRadius.circular(6.6)),
            child: Opacity(
              opacity: 0,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}