
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_choose_one_word.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_sound.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_speak_word.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_vocabulary/quizz_write.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_sentence/quizz_sentence_choose_one.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_sentence/quizz_sentence_select.dart';

import '../../../../data/model/quizz/quizz.dart';
import '../../../../data/model/quizz/quizz_sentence.dart';
import '../../../../data/model/quizz/quizz_vocabulary.dart';
import 'quizz_widget.dart';

class QuizzItems {
  ///GENERATE widget quizz  --------------------------------------------------------
  static List<WdgQuizz> generate<T extends Quizz>(List<T> quizzes) {
    List<WdgQuizz> quizzWidgets = [];
    for (var quizz in quizzes) {
      //---   dạng quizz từ vựng ---
      if(quizz is QuizzVocabulary) {
        if (quizz is QuizzChooseOneWord) {
          quizzWidgets.add(WdgQuizzChooseOneWord(quizz: quizz));
        }
        else if (quizz is QuizzSoundOfWord) {
          quizzWidgets.add(WdgQuizzSoundOfWord(quizz: quizz));
        }
        else if (quizz is QuizzSpeakWord) {
          quizzWidgets.add(WdgQuizzSpeakWord(quizz: quizz));
        }
        else if (quizz is QuizzWriteWord) {
          quizzWidgets.add(WdgQuizzWriteWord(quizz: quizz));
        }
      }
      
      //--- dạng quizz câu ---
      else if(quizz is QuizzSentence) {
        if(quizz is QuizzSentenceChoose) {
          quizzWidgets.add(WdgQuizzSentenceChoose(quizz: quizz));
        }
        else if(quizz is QuizzSentenceSelected) {
          quizzWidgets.add(WdgQuizzSentenceSelect(quizz: quizz));
        }
      }
    }
    return quizzWidgets;
  }

  static WdgQuizz generateA<T extends Quizz>(T quizz) {
    late WdgQuizz quizzWidget;
      //---   dạng quizz từ vựng ---
      if(quizz is QuizzVocabulary) {
        if (quizz is QuizzChooseOneWord) {
          quizzWidget = (WdgQuizzChooseOneWord(quizz: quizz));
        }
        else if (quizz is QuizzSoundOfWord) {
          quizzWidget = (WdgQuizzSoundOfWord(quizz: quizz));
        }
        else if (quizz is QuizzSpeakWord) {
          quizzWidget = (WdgQuizzSpeakWord(quizz: quizz));
        }
        else if (quizz is QuizzWriteWord) {
          quizzWidget = (WdgQuizzWriteWord(quizz: quizz));
        }
        }


      //--- dạng quizz câu ---
      else if(quizz is QuizzSentence) {
        if(quizz is QuizzSentenceChoose) {
          quizzWidget = (WdgQuizzSentenceChoose(quizz: quizz));
        }
        else if(quizz is QuizzSentenceSelected) {
          quizzWidget = (WdgQuizzSentenceSelect(quizz: quizz));
        }
      }

    return quizzWidget;
  }
}