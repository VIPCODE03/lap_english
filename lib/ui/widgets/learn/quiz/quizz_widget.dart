
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz.dart';

class QuizzStatus {
  ValueNotifier<bool> isAnswered = ValueNotifier<bool>(false);
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  bool? isCorrect;
  String? correctAnswer;
}

abstract class WdgQuizz<T extends Quizz> extends StatefulWidget {
  final T quizz;
  final QuizzStatus status = QuizzStatus();

  WdgQuizz({super.key, required this.quizz});

  @override
  WdgQuizzState<T, WdgQuizz<T>> createState();
}

abstract class WdgQuizzState<T extends Quizz, W extends WdgQuizz<T>> extends State<W> {}
