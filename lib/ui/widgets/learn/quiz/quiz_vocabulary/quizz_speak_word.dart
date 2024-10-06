
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/rich_text.dart';
import 'package:lap_english/utils/text_to_maptext.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../../data/model/quizz_vocabulary.dart';

class QuizzSpeakWordWidget extends QuizzWidget<QuizzSpeakWord> {
  QuizzSpeakWordWidget({super.key, required super.quizz});

  @override
  QuizzWidgetState<QuizzSpeakWord, QuizzWidget<QuizzSpeakWord>> createState() => _QuizzSpeakWordState();

}

class _QuizzSpeakWordState extends QuizzWidgetState<QuizzSpeakWord, QuizzSpeakWordWidget> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
    widget.state.isChecked.addListener(() {
      _stopListening();
    });
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult,
        localeId: 'en_UK'
    );
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      if(_lastWords != "") {
        widget.state.isCorrect = widget.quizz.answer.trim().toLowerCase() == _lastWords.trim().toLowerCase();
        widget.state.isAnswered.value = true;
        widget.state.correctAnswer = widget.quizz.answer.trim().toLowerCase();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdaptiveText(
              texts: parseStringToMap(widget.quizz.question),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _lastWords != ""
                      ? _lastWords
                      : 'Nhấn vào mic để nói',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),
            AvatarGlow(
              glowColor: Theme.of(context).primaryColor,
              repeat: true,
              showTwoGlows: true,
              duration: const Duration(seconds: 3),
              endRadius: 66.0,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: _speechToText.isNotListening ? _startListening : _stopListening,

                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: _speechToText.isNotListening ? Colors.grey : Colors.red,
                    child: Icon(
                      _speechToText.isNotListening ? Icons.mic : Icons.mic_none,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}