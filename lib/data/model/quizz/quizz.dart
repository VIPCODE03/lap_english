import 'package:json_annotation/json_annotation.dart';
import '../user/skill.dart';
part 'quizz.g.dart';

/*  Class quizz trừu tượng  */
abstract class Quizz<T> {
  String question = "";
  List<String> answers = [];
  String answerCorrect = "";

  SkillType get skillType;

  List<Quizz> generate(List<T> datas);
}

/*  Custom quiz */
@JsonSerializable()
class CustomQuiz {
  final TypeQuiz type;

  //--- Thuộc tính chính  ---
  final String question;
  final List<String> answers;
  final String answerCorrect;

  //--- Quiz ảnh  ---
  late final Map<String, String>? imgAnswers;
  late final String? imageQuestion;

  //--- Quiz âm thanh ---
  late final bool? isShowBoxSound;
  late final Map<String, String>? sounds;

  CustomQuiz(
      this.question,
      this.answers,
      this.answerCorrect,
      this.type,
      {
        this.imgAnswers,
        this.imageQuestion,

        this.isShowBoxSound,
        this.sounds,
      }
  );

  factory CustomQuiz.fromJson(Map<String, dynamic> json) => _$CustomQuizFromJson(json);

  Map<String, dynamic> toJson() => _$CustomQuizToJson(this);
}

enum TypeQuiz{
  chooseOne,
  select,
  sound,
  image,
  write,
}

enum TypeQuizz {
  quizzVocabulary,
  quizzSentence,
  quizGrammar,
  quizzCustom
}