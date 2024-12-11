import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextUtil {
  final SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';
  static final ValueNotifier<String> status = ValueNotifier('');

  Future<void> init() async {
    await _speechToText.initialize(
      onStatus: (newStatus) => status.value = newStatus,
    );
  }

  Future<void> startListening(Function(SpeechRecognitionResult) onResult) async {
    _lastWords = '';
    await _speechToText.listen(
      onResult: onResult,
      localeId: 'en',
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

  Future<void> cancel() async {
    await _speechToText.cancel();
  }

}
