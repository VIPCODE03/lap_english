import 'data/model/learn/vocabulary.dart';

void main() {
  List<MdlWord> words = [
  // Đối tượng 1: Danh từ - "run" có nghĩa là cuộc đua
  MdlWord(
    1,
    'run',
    'cuộc đua',
    'rʌn',
    'rʌn',
    'Noun',
    'Intermediate',
    'He won the run.',
    101,
  ),

  // Đối tượng 2: Động từ - "run" có nghĩa là chạy
 MdlWord(
    2,
    'run',
    'chạy',
    'rʌn',
    'rʌn',
    'Verb',
    'Beginner',
    'I run every morning.',
    101,
  ),

    MdlWord(
      2,
      'ngu',
      'chạy',
      'rʌn',
      'rʌn',
      'Verb',
      'Beginner',
      'I run every morning.',
      101,
    )
];

  Map<String, String> wordss = {};

  for (var word in words) {
    // Sử dụng giá trị mặc định nếu chưa khởi tạo
    wordss[word.word] = '${wordss[word.word] ?? ''}\n${word.type} : ${word.meaning}';
  }

// Ánh xạ (mapping) qua wordss
  var mappedWordss = wordss.map((key, value) {
    // Tùy chỉnh logic ánh xạ
    return MapEntry(key, value.trim()); // Ví dụ: Loại bỏ khoảng trắng thừa
  });

// In kết quả (tuỳ ý)
  mappedWordss.forEach((key, value) {
    print('$key:\n $value');
  });

}