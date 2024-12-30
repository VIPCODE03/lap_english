import 'package:lap_english/data/model/quizz/quiz_arrange.dart';
import 'package:lap_english/data/model/quizz/quiz_image.dart';
import 'package:lap_english/data/model/quizz/quiz_letter_count.dart';
import 'package:lap_english/data/model/quizz/quizz_choose_one.dart';
import 'package:lap_english/data/model/quizz/quizz_select_answers.dart';
import 'package:lap_english/data/model/quizz/quizz_speak.dart';
import 'package:lap_english/data/model/quizz/quizz_write.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_arrange_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_grammar_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_image_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quiz_letter_count_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_write.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_speak.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_choose_one_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_select_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizz_sound_choose_one_widget.dart';
import '../../../../data/model/quizz/quiz_grammar.dart';
import '../../../../data/model/quizz/quizz.dart';
import '../../../../data/model/quizz/quizz_sound_choose_one.dart';
import 'a_quizz_widget.dart';

class WdgQuizzes {
  ///GENERATE widget quizz  --------------------------------------------------------
  static WdgQuizz generate<T extends Quizz>(T quizz) {
    if (quizz is QuizzChooseOne) {
      return WdgQuizzChooseOne(quizz: quizz);

    } else if (quizz is QuizzSelect) {
      return WdgQuizzSelect(quizz: quizz);

    } else if (quizz is QuizzSoundChooseOne) {
      return WdgQuizzSoundChooseOne(quizz: quizz);

    } else if (quizz is QuizzSpeak) {
      return WdgQuizzSpeak(quizz: quizz);

    } else if (quizz is QuizzWrite) {
      return WdgQuizzWrite(quizz: quizz);

    } else if(quizz is MdlQuizImage) {
      return WdgQuizzImage(quizz: quizz);

    } else if(quizz is MdlQuizGrammar) {
      return WdgQuizGrammar(quizz: quizz);

    } else if(quizz is QuizLetterCount) {
      return WdgQuizLetterCount(quizz: quizz);

    } else if(quizz is QuizArrange) {
      return WdgQuizArrange(quizz: quizz);

    } else {
      throw ArgumentError('Unsupported quizz type');
    }
  }
}