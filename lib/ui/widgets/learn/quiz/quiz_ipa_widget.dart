import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz/quiz_ipa.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizzes_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import '../../../../utils/player_audio.dart';
import '../../../themes/size.dart';

class WdgQuizIPA extends WdgQuizz<QuizIPA> {

  WdgQuizIPA({super.key, required super.quizz});

  @override
  WdgQuizzState<QuizIPA, WdgQuizz<QuizIPA>> createState()
  => _WdgQuizGrammarState();
}

class _WdgQuizGrammarState extends WdgQuizzState<QuizIPA, WdgQuizIPA>  {
  late AudioPlayerUtil audio;
  late WdgQuizz wdgQuiz;
  late List<Widget> quizGrammar;

  @override
  void initState() {
    super.initState();
    initQuiz();
    audio = AudioPlayerUtil();
    hasChanged.addListener(updateScreen);
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(updateScreen);
  }

  void updateScreen() {
    setState(() {});
  }

  void initQuiz() {
    wdgQuiz = WdgQuizzes.generate(widget.quizz.quiz);
    wdgQuiz.status.isAnswered.addListener(() {
      widget.status.isAnswered.value = wdgQuiz.status.isAnswered.value;
    });

    widget.status.isChecked.addListener(() {
      widget.status.isCorrect = wdgQuiz.status.isCorrect;
      widget.status.correctAnswer = wdgQuiz.status.correctAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child:
          Align(alignment: Alignment.center, child: wdgQuiz),
        ),

        WdgButton(
            onTap: () => audio.playFromAsset(widget.quizz.ipa.soundUrl),
            alpha: 10,
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Stack(children: [
                    Center(
                      child: Text(
                        widget.quizz.ipa.text,
                        style: TextStyle(
                            fontSize: 33,
                            fontFamily: 'DroidSans',
                            fontWeight: FontWeight.bold,
                            color: VipColors.text(context)
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const Center(
                      child: Opacity(
                          opacity: 0.06,
                          child: Icon(Icons.volume_up_outlined, size: 33)),
                    )
                ])
            )
        )
      ],
    );
  }
}
