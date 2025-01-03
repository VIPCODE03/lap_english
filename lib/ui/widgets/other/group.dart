import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';

/// Tạo hộp bao quanh -----------------------------------------
class WdgGroup extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final double? opacity;
  final double? height;
  final String? title;
  final TextStyle? titleStyle;
  final Widget child;
  final Widget? action;

  const WdgGroup({
    super.key,
    this.title,
    this.alignment,
    this.opacity,
    this.height,
    required this.child,
    this.titleStyle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// Thanh ngăn cách --------------------------------------------------
        Opacity(
          opacity: opacity ?? 0,
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            color: VipColors.onPrimary(context),
          ),
        ),

        /// Text tiêu đề  ----------------------------------------------------
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(title ?? '',
                style: titleStyle ?? GoogleFonts.pangolin(
                    fontSize: textSize.title,
                    color: VipColors.text(context)),
              ),
            ),

            Expanded(child: Align(
              alignment: Alignment.centerRight,
              child: action,
            )),

            const SizedBox(width: 6)
          ],
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