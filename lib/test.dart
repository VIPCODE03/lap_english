
void main() {
  RegExp reg = RegExp(r'<suggest>(.*?)<->(.*?)>>');

  String mess = "<suggest>My name is...<->Tên tôi là...>>";
  reg.allMatches(mess).forEach((match) {
    if (match.groupCount >= 2) {
      print(match.group(1));
    }
  });
}

