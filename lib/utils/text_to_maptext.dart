
//=== Chuyển đổi text thành map ===
Map<String, bool> parseStringToMap(String input) {
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
