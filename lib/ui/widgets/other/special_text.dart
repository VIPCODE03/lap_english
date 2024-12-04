import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';

class WdgSpecialText extends StatelessWidget {
  final String text;

  const WdgSpecialText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var texts = _parseStringToMap(text);

    return RichText(
      text: TextSpan(
        children: texts.map((part) {

          //--- Dạng đặc biệt  ---
          if (part.isSpecial) {
            return TextSpan(
              text: part.text,
                style: GoogleFonts.pangolin(
                  color: VipColors.text(context),
                  fontSize: isTablet ? 30 : 20,
              )
            );
          }

          //--- Dạng bình thường  ---
          else {
            return TextSpan(
              text: part.text,
              style: GoogleFonts.pangolin(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: isTablet ? 30 : 20,
              )
            );
          }
        }).toList(),
      ),
    );
  }

  //=== Chuyển đổi text thành map ===
  List<_TextSpecial> _parseStringToMap(String input) {
    List<_TextSpecial> texts = [];

    final regex = RegExp(r'<(.*?)>|(\S+)|(\s+)');
    Iterable<Match> matches = regex.allMatches(input);

    for (var match in matches) {
      String? matchedString = match.group(0);
      if (matchedString != null) {
        if (matchedString.startsWith('<') && matchedString.endsWith('>')) {
          texts.add(_TextSpecial(matchedString.substring(1, matchedString.length - 1), true));
        }
        else {
          texts.add(_TextSpecial(matchedString, false));
        }
      }
    }
    return texts;
  }
}

class _TextSpecial {
  final String text;
  final bool isSpecial;

  _TextSpecial(this.text, this.isSpecial);
}