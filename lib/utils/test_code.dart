import 'dart:math';

List<String> generateRandomWords(String word) {

  int indexAdd = Random().nextInt(word.length -1);
  int indexDelete = Random().nextInt(word.length -1) + 1;
  String charAtIndex = word[indexAdd];

  List<String> similarWords = [];

  String newWord = word.substring(0, indexAdd) + charAtIndex + word.substring(indexAdd);
  similarWords.add(newWord);

  // Xóa ký tự tại vị trí ngẫu nhiên
  String newWord1 = word.substring(0, indexDelete) + word.substring(indexDelete + 1);
  similarWords.add(newWord1);

  return similarWords.toSet().toList();
}

void main() {
  String word = 'apple';
  List<String> results = generateRandomWords(word);
  print(results);
}
