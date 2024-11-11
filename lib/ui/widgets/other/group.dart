import 'package:flutter/material.dart';

/// Tạo hộp bao quanh -----------------------------------------
class WdgGroup extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final double? opacity;
  final double? height;
  final String? title;
  final TextStyle? titleStyle;
  final Widget child;

  const WdgGroup({
    super.key,
    this.title,
    this.alignment,
    this.opacity,
    this.height,
    required this.child,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    return Wrap(
      direction: Axis.horizontal,
      children: [

        /// Thanh ngăn cách --------------------------------------------------
        Opacity(
          opacity: opacity ?? 0,
          child: Container(
            height: height,
            width: maxWidth,
            color: Theme.of(context).primaryColor,
          ),
        ),

        /// Text tiêu đề  ----------------------------------------------------
        Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
          child: Text(title ?? '',
            style: titleStyle ?? const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),

        /// Child -------------------------------------------------------------
        const SizedBox(height: 10),
        Align(
          alignment: alignment ?? Alignment.topLeft,
          child: child,
        )
      ],
    );
  }
}