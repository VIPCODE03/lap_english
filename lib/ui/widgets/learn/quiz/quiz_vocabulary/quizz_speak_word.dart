
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/rich_text.dart';
import 'package:lap_english/utils/text_to_maptext.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../../data/model/quizz/quizz_vocabulary.dart';

class WdgQuizzSpeakWord extends WdgQuizz<QuizzSpeakWord> {
  WdgQuizzSpeakWord({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzSpeakWord, WdgQuizz<QuizzSpeakWord>> createState() => _WdgQuizzSpeakWordState();

}

class _WdgQuizzSpeakWordState extends WdgQuizzState<QuizzSpeakWord, WdgQuizzSpeakWord> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
    widget.status.isChecked.addListener(() {
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
        _stopListening();
        widget.status.isCorrect = widget.quizz.answer.trim().toLowerCase() == _lastWords.trim().toLowerCase();
        widget.status.isAnswered.value = true;
        widget.status.correctAnswer = widget.quizz.answer.trim().toLowerCase();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WdgAdaptiveText(
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
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: _speechToText.isNotListening
                    ? _startListening
                    : _stopListening,
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor:
                      _speechToText.isNotListening ? Colors.grey : Colors.red,
                  child: Icon(
                    _speechToText.isNotListening ? Icons.mic_none : Icons.mic,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
            ),
          ),
          ],
        ),
    );
  }
}