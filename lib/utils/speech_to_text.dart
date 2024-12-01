import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextUtil {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  Future<void> init() async {
    _speechEnabled = await _speechToText.initialize();
  }

  Future<void> startListening(Function(SpeechRecognitionResult) onResult) async {
    await _speechToText.listen(
      onResult: onResult,
      localeId: 'en_UK',
    );
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
  }

  bool get isNotListening => _speechToText.isNotListening;

  String get lastWords => _lastWords;

  void updateLastWords(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
  }

  void dispose() {
    _speechToText.cancel();
  }

}
