
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_choose_one_word.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_sound.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_speak_word.dart';

import '../../../../../data/model/quizz.dart';
import '../../../../../data/model/quizz_vocabulary.dart';
import '../quizz_widget.dart';

class QuizzVocabularys {
  ///CREATE widget quizz  --------------------------------------------------------
  static List<QuizzWidget> create(BuildContext context, List<Quizz> quizzesVocabulary) {
    List<QuizzWidget> quizzWidgets = [];
    for (var quizz in quizzesVocabulary) {
      if(quizz is QuizzChooseOneWord) {quizzWidgets.add(ChooseOneWord(quizz: quizz));}
      else if(quizz is QuizzSoundOfWord) {quizzWidgets.add(SoundOfWord(quizz: quizz));}
      else if(quizz is QuizzSpeakWord) {quizzWidgets.add(QuizzSpeakWordWidget(quizz: quizz));}
    }
    return quizzWidgets;
  }
}