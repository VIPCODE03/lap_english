import 'package:flutter/material.dart';

/// Tạo hộp bao quanh -----------------------------------------
class WdgGroup extends StatelessWidget {
  final double opacity;
  final double height;
  final String? title;

  const WdgGroup({
    super.key,
    this.title,
    required this.opacity,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Thanh ngăn cách --------------------------------------------------
          Opacity(
            opacity: opacity,
            child: Container(
              height: height,
              color: Theme.of(context).primaryColor,
            ),
          ),

          /// Text tiêu đề  ----------------------------------------------------
          if(title != null)
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(left: 15),
            child: Text(title ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      )
    );
  }
}