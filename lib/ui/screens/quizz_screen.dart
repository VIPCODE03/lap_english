
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/widgets/learn/quiz/quizzes.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/utils/player_audio.dart';
import '../../data/bloc/quizz_bloc.dart';
import '../../data/model/quizz/quizz.dart';
import '../../data/model/user/skill.dart';
import '../../data/model/learn/vocabulary.dart';
import '../widgets/learn/quiz/quizz_widget.dart';
import '../widgets/other/button.dart';

class QuizzScreen extends StatelessWidget {
  late final List<WdgQuizz> _children;
  final String _title;
  final List<Quizz> _quizzes;
  final AudioPlayerUtil _audio = AudioPlayerUtil();

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
    _children = QuizzItems.generate(_quizzes)
        .where((quizz) => quizz.quizz.skillType == SkillType.reading).toList();
  }

  @override
  Widget build(BuildContext context) {
    bool next = false;

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
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            var right = const Offset(1.0, 0.0);
                            var left = const Offset(0.0, 5.0);
                            const center = Offset.zero;
                            next = !next;

                            var tween = Tween(
                                begin: next ? right : left,
                                end: center)
                                .chain(CurveTween(curve: Curves.easeInOutCubic));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                          child: currentQuizz.key != ValueKey(state.currentIndex)
                              ? Container(key: ValueKey(state.currentIndex),
                                child: currentQuizz)
                              : const SizedBox(),
                        ),
                      ),

                      ///Button kiểm tra  ------------------------------------------
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(right: 50, left: 50, bottom: 30),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: currentQuizz.status.isAnswered,
                          builder: (context, value, child) {
                            return WdgButton(
                              onTap: () {
                                if (value) {
                                  currentQuizz.status.isChecked.value = true;
                                  var isCorrect = currentQuizz.status.isCorrect!;
                                  String title = isCorrect
                                      ? state.accolades[state.accoladesIndex]
                                      : state.encouragements[state.encouragementsIndex];

                                  _buildBottomDialogResult(
                                      context,
                                      title,
                                      currentQuizz.status.correctAnswer,
                                      isCorrect);

                                  //--- Âm thanh đúng/sai ---
                                  if(isCorrect) {
                                    _audio.play(Sound.correct);
                                  }
                                  else {
                                    _audio.play(Sound.wrong);
                                  }
                                }
                              },
                              borderRadius: BorderRadius.circular(12),
                              color: value
                                  ? Theme.of(context).primaryColor
                                  : Colors.white30,
                              child: const Text(
                                'Kiểm tra',
                                style: TextStyle(
                                  fontSize: 20,),
                              ),
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
  void _buildBottomDialogResult(BuildContext parentContext, String title, String? answerCorrect, bool isCorrect) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      context: parentContext,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
            color: isCorrect
                ? Colors.green.withAlpha(70)
                : Colors.red.withAlpha(70),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              /// Ảnh ------------------------------------------------------------
              Positioned(
                top: -66,
                right: 0,
                child: Image.asset(
                    isCorrect
                        ? Assets.images.dinosaur.dinosaurOk.path
                        : Assets.images.dinosaur.dinosaurQuestion.path,
                    height: 150,
                  ),
              ),

              /// Nội dung  --------------------------------------------------------
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      answerCorrect != null ? 'Đáp án đúng: $answerCorrect' : '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 400,
                      margin: const EdgeInsets.only(right: 50, left: 50, bottom: 30),
                      child:
                        WdgButton(
                          onTap: () {
                            parentContext.read<QuizzBloc>().add(QuizzCheck(isCorrect));  //-> Check
                            Navigator.pop(context); //->  Đóng BottomSheet
                          },
                          borderRadius: BorderRadius.circular(12),
                          color: isCorrect ? Colors.green : Colors.red,
                          child: const Text(
                            'Tiếp tục',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
