
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizzes_widget.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';
import 'package:lap_english/utils/player_audio.dart';
import '../../data/bloc/quizz_bloc.dart';
import '../../data/model/quizz/quizz.dart';
import '../../data/model/user/skill.dart';
import '../../data/model/learn/vocabulary.dart';
import '../widgets/other/button.dart';

class QuizzScreen extends StatefulWidget {
  final String _title;
  final List<Quizz> _quizzes;

  QuizzScreen.vocabulary({super.key, required List<Word> words})
    :
      _title = "Quizz từ vựng",
      _quizzes = Quizzes.generateQuizzVocabulary(mode: QuizzMode.basic, words: words);

  QuizzScreen.sentence({super.key, required List<Sentence> sentences})
      :
        _title = "Quizz câu",
        _quizzes = Quizzes.generateQuizzSentence(mode: QuizzMode.basic, sentences: sentences);

  @override
  State<StatefulWidget> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  final AudioPlayerUtil _audio = AudioPlayerUtil();
  bool showQuizz = false;
  bool next = false;

  @override
  void initState() {
    super.initState();
    widget._quizzes.shuffle();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        showQuizz = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(widget._title)),
        body: Center(
          child: BlocProvider(
            create: (context) => QuizzBloc(widget._quizzes.length)..add(QuizzInit()),
            child: BlocBuilder<QuizzBloc, QuizzState>(
              builder: (context, state) {
                if (state is QuizzInProgress) {
                  final currentQuizz = WdgQuizzes.generate(widget._quizzes[state.currentIndex]);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///Progressbar  ----------------------------------------------
                      Container(
                        padding: const EdgeInsets.all(12),
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

                      ///Text câu hỏi -------------------------------------------
                      Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: WdgSpecialText(text: currentQuizz.quizz.question)
                      ),

                      ///Slide quizz  ----------------------------------------------
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 666),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            var right = const Offset(1.0, 0.0);
                            var left = const Offset(0.0, 5.0);
                            const center = Offset.zero;
                            next = !next;

                            var tween = Tween(
                                begin: next ? right : left,
                                end: center)
                                .chain(CurveTween(curve: Curves.easeInOutCubic));

                            animation.addStatusListener((status) {
                              if (status == AnimationStatus.completed) {
                                currentQuizz.status.isStarted.value = true;
                              }
                            });

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },

                          child: Container(
                            key: UniqueKey(),
                            child: showQuizz ? currentQuizz : null,
                          ),
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
                                  //--- Lấy kết quả ---
                                  currentQuizz.status.isChecked.value = true;
                                  var isCorrect = currentQuizz.status.isCorrect!;
                                  String title = isCorrect
                                      ? state.accolades[state.accoladesIndex]
                                      : state.encouragements[state.encouragementsIndex];

                                  //--- Âm thanh đúng/sai ---
                                  if(isCorrect) {
                                    _audio.play(Sound.correct);
                                  }
                                  else {
                                    _audio.play(Sound.wrong);
                                  }

                                  //--- Mở dialog ---
                                  _buildBottomDialogResult(
                                      context,
                                      title,
                                      currentQuizz.status.correctAnswer,
                                      isCorrect);
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
        )
    );
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
                    /// Text tiêu đề  --------------------------------------------
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// Text đáp án ---------------------------------------------
                    Text(
                      answerCorrect != null ? 'Đáp án đúng: $answerCorrect' : '',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),

                    /// Button chuyển tiếp  --------------------------------------
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
