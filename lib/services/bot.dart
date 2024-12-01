
import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../data/model/learn/vocabulary.dart';

class GeminiAI {
  static const String flash = 'gemini-1.5-flash';

  String model;
  String apiKey = 'AIzaSyBwQDMZO8sx4dYcEXMWuQad-eqf1CnEFQ8';
  GenerativeModel gemini;

  GeminiAI({required this.model})
      :
        gemini = GenerativeModel(
          model: model,
          apiKey: 'AIzaSyBwQDMZO8sx4dYcEXMWuQad-eqf1CnEFQ8',
      );

  Future<String?> ask(String question) async {
    final response = await gemini.generateContent([Content.text(question)]);
    return response.text;
  }
}

void main() async {
  var gemini = GeminiAI(model: GeminiAI.flash);
  String jsonString = await gemini.ask(botGenerateMain()) ?? 'a';
  String jsonSub = await gemini.ask(botGenerateSub(jsonString)) ?? 'a';
  String word = await gemini.ask(botGenerateWord(jsonSub)) ?? 'a';

  print(word);
  List<dynamic> jsonList = jsonDecode(word);
  List<MdlWord> topics = jsonList
      .map((item) => MdlWord.fromJson(item))
      .toList();

  // In ra các đối tượng
  for (var topic in topics) {
    print('ID: ${topic.id}, Name: ${topic.word}');
  }
}

String botGenerateMain() {
  return "Bạn hãy trả về dữ liệu json (không có kí tự ''' và chữ"
      " json trong kết quả trả về)"
      "các chủ đề từ "
      "vựng chính với id 1-5 và không giải thích gì thêm."
      "final int id; String name;"
      "\n Tạo 5 chủ đề chính";
}

String botGenerateSub(String main) {
  return "Bạn hãy trả về dữ liệu json (không có kí tự ''' và chữ"
      " json trong kết quả trả về)"
      "các chủ đề từ "
      "vựng con với id  từ 1-10 và không giải thích gì thêm."
      "final int id;String name;String imageUrl;bool isLearned;int idMainTopic;"
      "\nDanh sách dữ liệu mainTopic (Tạo mỗi chủ đề chính 2 chủ đề con): \n$main";
}

String botGenerateWord(String sub) {
  return "Bạn hãy trả về dữ liệu json (không có kí tự ''' và chữ"
      " json trong kết quả trả về)"
      "các từ "
      "vựng với id từ 1-50 và không giải thích gì thêm."
      "  final int id;String word;String meaning;String pronounceUK;String pronounceUS;String type;String level;String example;String imageUrl; int idSubTopic;"
      "id: 1001,word: apple,meaning: quả táo, pronounceUK: ˈɪɡ.zæm.pl̩,pronounceUS: ɪɡˈzæm.pəl,type: noun,level: beginner,example: This is an example., imageUrl: (để rỗng),idSubTopic: 101"
      "\nDanh sách dữ liệu subTopic (Tạo mỗi chủ đề con 5 từ vựng): \n$sub";
}

