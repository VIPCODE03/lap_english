import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quizz_speak.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import '../../../../utils/speech_to_text.dart';
import '../../../themes/size.dart';

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
    widget.status.isChecked.addListener(_stopListening);
  }

  @override
  void dispose() {
    super.dispose();
    _speechUtil.cancel();
    widget.status.isChecked.removeListener(_stopListening);
    SpeechToTextUtil.status.removeListener(onStatusListening);
  }

  void _initSpeech() async {
    await _speechUtil.init();
    SpeechToTextUtil.status.addListener(onStatusListening);
    setState(() {});
  }

  void onStatusListening() {
    if(SpeechToTextUtil.status.value == 'notListening') {
      if(_speechUtil.lastWords.isEmpty) {
        _startListening();
      }
      else {
        _stopListening();
      }
    }
  }

  void _startListening() async {
    await _speechUtil.startListening(_onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechUtil.stopListening();
    setState(() {});
  }

  //=== Kết quả nói ===
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _speechUtil.updateLastWords(result);
      if (_speechUtil.lastWords != "") {
        widget.status.isCorrect = widget.quizz.answerCorrect.trim().toLowerCase() == _speechUtil.lastWords.trim().toLowerCase();
        widget.status.isAnswered.value = true;
        widget.status.correctAnswer = _speechUtil.lastWords;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isPortrait ? maxHeight : maxHeight - 10,
      width: maxWidth,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          WdgSpecialText(text: widget.quizz.pronounce),

          Expanded(child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: Axis.vertical,
              children: [
                Text(
                  _speechUtil.lastWords.isNotEmpty
                      ? _speechUtil.lastWords
                      : _speechUtil.isNotListening
                      ? 'Nhấn vào mic để nói'
                      : 'Đang nghe...',
                  style: const TextStyle(fontSize: 20),
                ),

                AvatarGlow(
                  glowColor: VipColors.primary(context),
                  repeat: true,
                  showTwoGlows: true,
                  duration: const Duration(seconds: 3),
                  endRadius: maxHeight/15,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: _speechUtil.isNotListening ? _startListening : _stopListening,
                    child: CircleAvatar(
                      radius: orientation == Orientation.portrait
                          ? maxHeight / 20
                          : maxHeight / 15,
                      backgroundColor: _speechUtil.isNotListening ? Colors.grey : Colors.red,
                      child: Icon(
                        _speechUtil.isNotListening ? Icons.mic_none : Icons.mic,
                        color: Colors.white,
                        size: orientation == Orientation.portrait
                            ? maxHeight / 25
                            : maxHeight / 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

}
