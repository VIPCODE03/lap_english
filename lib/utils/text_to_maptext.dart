class TextToMapText {
  static Map<String, bool> parseStringToMap(String input) {
    Map<String, bool> result = {};

    // Tách chuỗi bằng cách sử dụng biểu thức chính quy
    final regex = RegExp(r'<(.*?)>|(\S+)');
    Iterable<Match> matches = regex.allMatches(input);

    for (var match in matches) {
      // Kiểm tra xem match có nằm trong dấu < >
      String? matchedString = match.group(0);
      if (matchedString != null) {
        // Nếu có dấu < >, thì true
        if (matchedString.startsWith('<') && matchedString.endsWith('>')) {
          result["${matchedString.substring(1, matchedString.length - 1)} "] = true;
        } else {
          // Nếu không, thì false
          result["$matchedString "] = false;
        }
      }
    }
    return result;
  }
}
