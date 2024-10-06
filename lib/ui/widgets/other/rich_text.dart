import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final Map<String, bool> texts;

  const AdaptiveText({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    var parts = texts.keys.toList();

    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          // Kiểm tra nếu phần là từ cần phân biệt
          if (texts[part] == true) {
            return TextSpan(
              text: part,
              style: Theme.of(context).textTheme.titleLarge,
            );
          } else {
            return TextSpan(
              text: part,
              style: const TextStyle(
                color: Colors.brown,
                fontSize: 20,
              ), // Định dạng mặc định
            );
          }
        }).toList(),
      ),
    );
  }
}
