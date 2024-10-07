
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lap_english/a_data_test/ai_tets.dart';
import 'package:lap_english/a_data_test/data_sentence.dart';

class GeminiAI {
  static const String flash = 'gemini-1.5-flash';

  String model;
  String apiKey = 'AIzaSyD386QeiUTotjEz3KJETtFFuWFc1K3m78o';
  GenerativeModel gemini;

  GeminiAI({required this.model})
      :
        gemini = GenerativeModel(
          model: model,
          apiKey: 'AIzaSyBMoYs4Va_gfeRkLYosnJAdA7OYqM6HeL0',
      );

  Future<String?> ask(String question) async {
    final response = await gemini.generateContent([Content.text(question)]);
    return response.text;
  }
}

void main() async {
  var gemini = GeminiAI(model: GeminiAI.flash);
  String jsonString = await gemini.ask(createWord()) ?? 'a';
  print(jsonString);

}

String createWord() {
  return 'Bạn hãy tạo dữ liệu json cho từ vựng hoặc cụm từ (không phải câu).'
      'Dữ liệu mẫu:\n ${Example.getExampleVocabulary()}'
      '\n-> Tạo dữ liệu với các chủ đề phổ biến'
      'Lưu ý: '
      '-> Không giải thích gì thêm '
      '-> không có chữ json đầu câu trả lời!'
      '-> imageUrl lấy nguyên của dữ liệu mẫu';
}

String createW() {
  String dataa = DataSentence.sentenceJsonString;
  return 'Tạo dữ liệu mới dạng json , '
      'không giải thích và không kí hiệu json ở đầu kết quả'
      'Hãy trả về chuỗi String tương tự giống định dạng json sau:\n '
      '$dataa'
      'Lưu ý: Tạo dữ liệu mới liên quan đến giao tiếp '
      'hàng ngày';
}

