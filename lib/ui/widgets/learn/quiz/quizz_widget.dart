
import 'package:flutter/material.dart';
import 'package:lap_english/data/model/quizz.dart';

class QuizzStateA {
  ValueNotifier<bool> isAnswered = ValueNotifier<bool>(false);
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  bool? isCorrect;
  String? correctAnswer;
}

abstract class QuizzWidget<T extends Quizz> extends StatefulWidget {
  final T quizz;
  final QuizzStateA state = QuizzStateA();

  QuizzWidget({super.key, required this.quizz});

  @override
  QuizzWidgetState<T, QuizzWidget<T>> createState();
}

abstract class QuizzWidgetState<T extends Quizz, W extends QuizzWidget<T>> extends State<W> {}
