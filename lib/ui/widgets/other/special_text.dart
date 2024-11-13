import 'package:flutter/material.dart';
import 'package:lap_english/main.dart';

class WdgSpecialText extends StatelessWidget {
  final String text;

  const WdgSpecialText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var texts = _parseStringToMap(text);
    var parts = texts.keys.toList();

    return RichText(
      text: TextSpan(
        children: parts.map((part) {

          //--- Dạng đặc biệt  ---
          if (texts[part] == true) {
            return TextSpan(
              text: part,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: isTablet ? 30 : 20,
                  fontWeight: FontWeight.bold),
            );
          }

          //--- Dạng bình thường  ---
          else {
            return TextSpan(
              text: part,
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: isTablet ? 30 : 20,
                  fontWeight: FontWeight.bold),
            );
          }
        }).toList(),
      ),
    );
  }

  //=== Chuyển đổi text thành map ===
  Map<String, bool> _parseStringToMap(String input) {
    Map<String, bool> result = {};

    final regex = RegExp(r'<(.*?)>|(\S+)');
    Iterable<Match> matches = regex.allMatches(input);

    for (var match in matches) {
      String? matchedString = match.group(0);
      if (matchedString != null) {
        if (matchedString.startsWith('<') && matchedString.endsWith('>')) {
          result["${matchedString.substring(1, matchedString.length - 1)} "] =
          true;
        } else {
          result["$matchedString "] = false;
        }
      }
    }
    return result;
  }
}
