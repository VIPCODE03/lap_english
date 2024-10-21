import 'package:flutter/material.dart';

class WdgAdaptiveText extends StatelessWidget {
  final Map<String, bool> texts;

  const WdgAdaptiveText({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    var parts = texts.keys.toList();

    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          //--- Dạng đặc biệt  ---
          if (texts[part] == true) {
            return TextSpan(
              text: part,
              style: Theme.of(context).textTheme.titleLarge,
            );
          }
          //--- Dạng bình thường  ---
          else {
            return TextSpan(
              text: part,
              style: const TextStyle(
                color: Colors.brown,
                fontSize: 20,
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}
