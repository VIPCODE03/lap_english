import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeakUtil {
  static const double rateNormal = 0.35;
  static const double rateSlow = 0.25;

  static const String languageUS = "en-US";
  static const String languageUK = "en-UK";
  static const String languageAU = "en-AU";

  final FlutterTts _flutterTts = FlutterTts();

  TextToSpeakUtil() {
     _flutterTts.setLanguage(languageUS);
    _initialize();
  }

  //===   Khởi tạo  ===
  Future<void> _initialize() async {
    await _flutterTts.setPitch(1.0); //-> Thiết lập cao độ
  }

  //===   Đọc văn bản   ===
  Future<void> speak(String text, String language, double rate) async {
    await _flutterTts.setSpeechRate(rate);

    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  //===   Dừng đọc   ===
  Future<void> stop() async {
    await _flutterTts.stop();
  }

}
