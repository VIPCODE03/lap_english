
import 'package:flutter/cupertino.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_choose_one_word.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_sound.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_speak_word.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_write.dart';

import '../../../../data/model/quizz.dart';
import '../../../../data/model/quizz_vocabulary.dart';
import 'quizz_widget.dart';

class QuizzItems {
  ///CREATE widget quizz  --------------------------------------------------------
  static List<QuizzWidget> create<T extends Quizz>(BuildContext context, List<T> quizzes) {
    List<QuizzWidget> quizzWidgets = [];
    for (var quizz in quizzes) {
      if(quizz is QuizzChooseOneWord) {quizzWidgets.add(ChooseOneWord(quizz: quizz));}
      else if(quizz is QuizzSoundOfWord) {quizzWidgets.add(SoundOfWord(quizz: quizz));}
      else if(quizz is QuizzSpeakWord) {quizzWidgets.add(QuizzSpeakWordWidget(quizz: quizz));}
      else if(quizz is QuizzWriteWord) {quizzWidgets.add(QuizzWritingW(quizz: quizz));}
    }
    return quizzWidgets;
  }
}