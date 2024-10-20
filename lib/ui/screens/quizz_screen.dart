import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/sentence.dart';
import 'package:lap_english/data/model/skill.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizzes.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import '../../data/bloc/quizz_bloc.dart';
import '../../data/model/quizz.dart';
import '../../data/model/vocabulary.dart';
import '../widgets/learn/quiz/quizz_widget.dart';

class QuizzScreen extends StatelessWidget {
  late final List<WdgQuizz> _children;
  final String _title;
  final List<Quizz> _quizzes;

  QuizzScreen.vocabulary({super.key, required List<Word> words})
    :
      _title = "Quizz từ vựng",
      _quizzes = Quizzes.generateQuizzVocabulary(mode: QuizzMode.basic, words: words)
  {_init();}

  QuizzScreen.sentence({super.key, required List<Sentence> sentences})
      :
        _title = "Quizz câu",
        _quizzes = Quizzes.generateQuizzSentence(mode: QuizzMode.basic, sentences: sentences)
  {_init();}

  void _init() {
    _quizzes.shuffle();
    _children = QuizzItems.generate(_quizzes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(_title)),
        body: Center(
          child: BlocProvider(
            create: (context) => QuizzBloc(_children.length)..add(QuizzInit()),
            child: BlocBuilder<QuizzBloc, QuizzState>(
              builder: (context, state) {
                if (state is QuizzInProgress) {
                  final currentQuizz = _children[state.currentIndex];

                  return Column(
                    children: [
                      ///Progressbar  ----------------------------------------------
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: WdgAnimatedProgressBar(
                            value: state.progress, label: ''),
                      ),

                      ///Text kĩ năng -------------------------------------------
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Skill.skillName(currentQuizz.quizz.skillType),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),

                      ///Slide quizz  ----------------------------------------------
                      const SizedBox(height: 16),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            var begin = Random().nextBool()
                                ? const Offset(0.5, 1.0)
                                : const Offset(1.0, -0.5);
                            const end = Offset.zero;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: Curves.easeOutBack));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                          child:
                              currentQuizz.key != ValueKey(state.currentIndex)
                                  ? Container(
                                      key: ValueKey(state.currentIndex),
                                      child: currentQuizz)
                                  : currentQuizz,
                        ),
                      ),

                      ///Button kiểm tra  ------------------------------------------
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.all(50),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: currentQuizz.status.isAnswered,
                          builder: (context, value, child) {
                            return ElevatedButton(
                              onPressed: value
                                  ? () {
                                      currentQuizz.status.isChecked.value =
                                          true;
                                      _buildBottomDialogResult(
                                          context,
                                          currentQuizz.status.correctAnswer,
                                          currentQuizz.status.isCorrect!);
                                    }
                                  : null,
                              child: const Text('Kiểm tra'),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is QuizzCompleted) {
                  return const Center(child: Text('Quiz Completed!'));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ));
  }

  ///Dialog kết quả ------------------------------------------------------------
  void _buildBottomDialogResult(BuildContext parentContext, String? answerCorrect, bool isCorrect) {
      showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: parentContext,
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                ///Icon trạng thái (đúng/sai) ------------------------------------
                Icon(
                  isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined,
                  color: isCorrect ? Colors.green : Colors.red,
                  size: 50,
                ),
                const SizedBox(height: 16),

                ///Text hiển thị kết quả (đúng/sai) -------------------------------
                Text(
                  isCorrect ? 'Chính xác!' : 'Chưa chính xác!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 10),

                ///Text hiển thị đáp án đúng  -------------------------------------
                Text(
                  answerCorrect != null ? 'Đáp án đúng: $answerCorrect' : '',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),

                ///Button tiếp tục  -----------------------------------------------
                Container(
                  height: 50,
                  width: 400,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      parentContext.read<QuizzBloc>().add(QuizzCheck());
                      Navigator.pop(context); //->  Đóng BottomSheet
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCorrect ? Colors.green : Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Tiếp tục'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
}
