
import 'package:flutter/material.dart';

import '../../../../data/model/quizz/quizz.dart';

class QuizzStatus {
  ValueNotifier<bool> isEnd = ValueNotifier<bool>(false);
  ValueNotifier<bool> isStarted = ValueNotifier<bool>(false);
  ValueNotifier<bool> isAnswered = ValueNotifier<bool>(false);
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  bool? isCorrect;
  String? correctAnswer;
}

abstract class WdgQuizz<T extends Quizz> extends StatefulWidget {
  final T quizz;
  final QuizzStatus status = QuizzStatus();
  final keyID = UniqueKey();

  WdgQuizz({super.key, required this.quizz});

  @override
  WdgQuizzState<T, WdgQuizz<T>> createState();
}

abstract class WdgQuizzState<T extends Quizz, W extends WdgQuizz<T>> extends State<W> {}