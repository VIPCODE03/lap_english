
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_speak.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import '../../../../utils/speech_to_text.dart';

class WdgQuizzSpeak extends WdgQuizz<QuizzSpeak> {
  WdgQuizzSpeak({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizzSpeak, WdgQuizz<QuizzSpeak>> createState() => _WdgQuizzSpeakState();

}

class _WdgQuizzSpeakState extends WdgQuizzState<QuizzSpeak, WdgQuizzSpeak> {
  final SpeechToTextUtil _speechUtil = SpeechToTextUtil();

  @override
  void initState() {
    super.initState();
    _initSpeech();
    widget.status.isChecked.addListener(() {
      _stopListening();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _speechUtil.dispose();
  }

  void _initSpeech() async {
    await _speechUtil.init();
    setState(() {});
  }

  void _startListening() async {
    await _speechUtil.startListening(_onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechUtil.stopListening();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _speechUtil.updateLastWords(result);
      if (_speechUtil.lastWords != "") {
        _stopListening();
        widget.status.isCorrect = widget.quizz.answerCorrect.trim().toLowerCase() == _speechUtil.lastWords.trim().toLowerCase();
        widget.status.isAnswered.value = true;
        widget.status.correctAnswer = _speechUtil.lastWords;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WdgSpecialText(text: widget.quizz.pronounce),

          Expanded(
            child: Center(
              child: Text(
                _speechUtil.lastWords != ""
                    ? _speechUtil.lastWords
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
              onTap: _speechUtil.isNotListening ? _startListening : _stopListening,
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: _speechUtil.isNotListening ? Colors.grey : Colors.red,
                child: Icon(
                  _speechUtil.isNotListening ? Icons.mic_none : Icons.mic,
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
