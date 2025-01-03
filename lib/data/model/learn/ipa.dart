
import 'package:lap_english/data/model/quizz/quizz.dart';

class IPA {
  int id;
  final String text;
  final String example;
  final String soundUrl;
  double maxPronunciationScore;

  IPA(this.id, this.text, this.example, this.soundUrl, {this.maxPronunciationScore = 0});
}

class ExerciseIPA {
  int idIPA;
  CustomQuiz quiz;

  ExerciseIPA(this.idIPA, this.quiz);
}

List<ExerciseIPA> providerExerciseIPA() {
  return [
    ExerciseIPA(1, CustomQuiz(
        'Chọn từ đúng nhất',
        ['sit', 'seat'], // Từ gần giống: "seat"
        'sit', // Đáp án đúng
        TypeQuiz.sound,
        isShowBoxSound: false
    )),
    ExerciseIPA(1, CustomQuiz(
        'Chọn từ đúng nhất',
        ['hit', 'heat'], // Từ gần giống: "heat"
        'hit', // Đáp án đúng
        TypeQuiz.sound,
        isShowBoxSound: false    )),
    ExerciseIPA(1, CustomQuiz(
        'Chọn từ đúng nhất',
        ['kit', 'kite'], // Từ gần giống: "kite"
        'kit', // Đáp án đúng
        TypeQuiz.sound,
        isShowBoxSound: false    )),
    ExerciseIPA(1, CustomQuiz(
        'Chọn từ đúng nhất',
        ['fit', 'feet'], // Từ gần giống: "feet"
        'fit', // Đáp án đúng
        TypeQuiz.sound,
        isShowBoxSound: false    )),
    ExerciseIPA(1, CustomQuiz(
        'Chọn từ đúng nhất',
        ['lip', 'leap'], // Từ gần giống: "leap"
        'lip', // Đáp án đúng
        TypeQuiz.sound,
        isShowBoxSound: false
    )),
  ];
}
