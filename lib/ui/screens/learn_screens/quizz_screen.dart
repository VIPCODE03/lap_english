import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/dialogs/dialog_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizzes_widget.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';
import 'package:lap_english/utils/player_audio.dart';
import '../../../bloc/quizz_bloc.dart';
import '../../../data/model/quizz/quizz.dart';
import '../../../data/model/user/skill.dart';
import '../../themes/size.dart';
import '../../widgets/learn/quiz/z_quizz_result.dart';
import '../../widgets/other/button.dart';

class QuizzScreen extends StatefulWidget {
  final Future<List<Quizz>> _quizzes;
  final dynamic _object;
  final TypeQuizz _typeQuizz;

  final int _totalWord;
  final int _totalSentence;
  final int _totalGrammar;

  QuizzScreen.vocabulary({super.key, required List<Word> words, required SubTopic subTopic})
    :
        _object = subTopic,
        _typeQuizz = TypeQuizz.quizzVocabulary,
        _totalWord = words.length,
        _totalSentence = 0,
        _totalGrammar = 0,
        _quizzes = Quizzes.generateQuizzVocabulary(mode: QuizzMode.basic, words: words);

  QuizzScreen.sentence({super.key, required List<Sentence> sentences, required SubTopic subTopic})
      :
        _object = subTopic,
        _typeQuizz = TypeQuizz.quizzSentence,
        _totalWord = 0,
        _totalSentence = sentences.length,
        _totalGrammar = 0,
        _quizzes = Quizzes.generateQuizzSentence(mode: QuizzMode.basic, sentences: sentences);

  QuizzScreen.grammar({super.key, required List<GrammaticalStructure> structures, required Grammar grammar})
      :
        _object = grammar,
        _typeQuizz = TypeQuizz.quizGrammar,
        _totalWord = 0,
        _totalSentence = 0,
        _totalGrammar = structures.length,
        _quizzes = Quizzes.generateQuizGrammar(structures: structures);

  @override
  State<StatefulWidget> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  List<Quizz>? _quizzes;
  late QuizzBloc _quizzBloc;

  final AudioPlayerUtil _audio = AudioPlayerUtil();
  bool _noAudio = false;

  bool showQuizz = false;
  bool next = false;
  bool isNext = true;
  late WdgQuizz currentQuizz;

  double progress = 0;

  @override
  void initState() {
    super.initState();

    widget._quizzes.then((quizzes) {
      //--- Cập nhật sau khi bắt đầu  ---
      Future.delayed(const Duration(seconds: 1), () {
        if (!showQuizz) {
          setState(() {
            showQuizz = true;
          });
        }
      });

      setState(() {
        _quizzes = quizzes;
        _quizzBloc = QuizzBloc(
            quizzes..shuffle(),
            widget._typeQuizz,
            widget._totalWord,
            widget._totalSentence,
            widget._totalGrammar,
            object: widget._object
        )..add(QuizzInit());
      });
    }).catchError((error) {
      setState(() {
        _quizzes = null;
      });
    });
  }

  @override
  Widget build(BuildContext quizContext) {
    if (_quizzes == null || _quizzes!.isEmpty) {
      if(!showQuizz) {
        return const WdgScaffold(
          appBar: WdgAppBar(),
          body: Center(child: Text('Không có dữ liệu')),
        );
      }
    }

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (isTrue, dynamic) async {
          if (ModalRoute.of(quizContext)?.isCurrent == true) {
            _showExitConfirmationDialog(quizContext);
          }},

        child: BlocProvider.value(value: _quizzBloc,
          child: BlocBuilder<QuizzBloc, QuizzState>(
            builder: (context, state) {
              if (state is QuizzInProgress) {
                bool isNextQuiz = false;
                if (isNext) {
                  currentQuizz = WdgQuizzes.generate(state.currentQuizz);
                  progress = state.progress;
                  isNext = false;
                  isNextQuiz = true;
                }

                return WdgScaffold(
                    appBar: WdgAppBar(
                      onBack: () {
                        _noAudio = true;
                        _showExitConfirmationDialog(quizContext);
                      },
                      content: SizedBox(
                          height: textSize.title / 1.25,
                          child: WdgAnimatedProgressBar(value: state.progress)),
                    ),
                    body: Column(
                      children: [
                        ///Text câu hỏi -------------------------------------------
                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: WdgSpecialText(text: currentQuizz.quizz.question, size: textSize.medium),
                        ),

                        ///Slide quizz  ----------------------------------------------
                        Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 666),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                var right = const Offset(0.5, 0.0);
                                var left = const Offset(-10.0, 0.0);
                                const center = Offset.zero;
                                if(isNextQuiz) {
                                  next = !next;
                                }

                                var tween = Tween(begin: next ? right : left, end: center)
                                    .chain(CurveTween(curve: Curves.easeInOutCubic));

                                animation.addStatusListener((status) {
                                  if (status == AnimationStatus.completed) {
                                    if (showQuizz) {
                                      isNextQuiz = false;
                                      currentQuizz.status.isStarted.value = true;
                                    }
                                  }
                                });

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                );
                              },
                              child: SizedBox(
                                key: showQuizz ? currentQuizz.keyID : UniqueKey(),
                                child: showQuizz
                                    ? currentQuizz
                                    : const Center(
                                        child: Text('Start',
                                            style: TextStyle(fontSize: 30)),
                                      ),
                          ),
                        )),

                        /// Button skip quizz nói hoặc nghe ----------------------------------
                        if ((currentQuizz.quizz.skillType == SkillType.speaking || currentQuizz.quizz.skillType == SkillType.listening) && showQuizz)
                          SizedBox(
                              width: maxWidth,
                              child: WdgButton(
                                color: Colors.transparent,
                                onTap: () {
                                  isNext = true;
                                  context.read<QuizzBloc>().add(QuizzSkip());
                                },
                                child: Text(
                                  currentQuizz.quizz.skillType == SkillType.speaking
                                      ? 'Hiện tại không nói được'
                                      : 'Hiện tại không nghe được',
                                  style: TextStyle(
                                      fontSize: textSize.normal,
                                      color: Colors.grey.withAlpha(70)),
                                ),
                              )
                          ),

                        ///Button kiểm tra  ------------------------------------------
                        Container(
                            constraints: BoxConstraints(
                              minHeight: (isTablet || isPortrait) ? textSize.special * 3 : textSize.special * 1.5
                            ),
                            width: (isTablet || !isPortrait) ? (maxWidth / 1.66) : maxWidth * 0.66,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: ValueListenableBuilder<bool>(
                              valueListenable: currentQuizz.status.isAnswered,
                              builder: (context, value, child) {
                                return WdgButton(
                                    onTap: () {
                                      if (value) {
                                        //--- Lấy kết quả ---
                                        currentQuizz.status.isChecked.value =
                                            true;
                                        var isCorrect =
                                            currentQuizz.status.isCorrect!;
                                        String title = isCorrect
                                            ? state
                                                .accolades[state.accoladesIndex]
                                            : state.encouragements[
                                                state.encouragementsIndex];

                                        //--- Âm thanh đúng/sai ---
                                        if (!_noAudio) {
                                          isCorrect
                                              ? _audio.playFromAsset(Assets.sounds.correct)
                                              : _audio.playFromAsset(Assets.sounds.wrong);
                                        }

                                        //--- Mở dialog ---
                                        _buildBottomDialogResult(context, title, currentQuizz.status.correctAnswer, isCorrect);
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    color: value
                                        ? VipColors.primary(context)
                                        : Colors.grey,
                                    alpha: 75,
                                    child: Text('Kiểm tra',
                                        style: TextStyle(fontSize: textSize.special,),
                                    ),
                                );
                              },
                            )),
                      ],
                    ));
              } else if (state is QuizzCompleted) {
                return WdgQuizzResult(quizzResult: state.quizzResult);
              }

              return const WdgLoading();
            },
          ),
        ));
  }

  ///Dialog kết quả ------------------------------------------------------------
  void _buildBottomDialogResult(BuildContext parentContext, String title, String? answerCorrect, bool isCorrect) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: parentContext,
      useSafeArea: true,
      sheetAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 200)),
      constraints: BoxConstraints(
        minWidth: maxWidth,
      ),
      builder: (context) {
        return PopScope(
          canPop: false,
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Ảnh  ----------------------------------
                /*Positioned(
                top: -66,
                right: 0,
                child: Image.asset(
                  isCorrect
                      ? Assets.images.dinosaur.dinosaurOk.path
                      : Assets.images.dinosaur.dinosaurQuestion.path,
                  height: 150,
                ),
              ),*/

                /// Nội dung ----------------------------------------------------
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Tiêu đề -------------------------------------------------
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSize.title,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 10),

                      /// Đáp án đúng ---------------------------------------------
                      if (answerCorrect != null && answerCorrect.isNotEmpty)
                        Text(
                          answerCorrect,
                          style: TextStyle(fontSize: textSize.normal, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),

                      const SizedBox(height: 15),

                      /// Nút bấm tiếp tục ----------------------------------------
                      Container(
                        constraints: BoxConstraints(
                            minHeight: (isTablet || isPortrait) ? textSize.special * 3 : textSize.special * 1.5
                        ),
                        width: (isTablet || !isPortrait) ? (maxWidth / 1.66) : maxWidth * 0.66,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: WdgButton(
                          onTap: () {
                            isNext = true;
                            currentQuizz.status.isEnd.value = true;
                            parentContext.read<QuizzBloc>().add(QuizzCheck(isCorrect));
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(12),
                          color: isCorrect ? Colors.green : Colors.red,
                          child: Text(
                            'Tiếp tục',
                            style: TextStyle(fontSize: textSize.special),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Show dialog xác nhận thoát  ----------------------------------------------
  void _showExitConfirmationDialog(BuildContext parentContext) {
    showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return WdgDialog(
              border: true,
              shadow: true,
              crossAxisAlignment: CrossAxisAlignment.center,
              title: Text('Xác nhận thoát', style: TextStyle(fontSize: textSize.title)),
              content: Text('Bạn sẽ mất tiến trình', style: TextStyle(fontSize: textSize.normal)),
              actions: [
                WdgButton(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(parentContext);
                  },
                  color: Colors.transparent,
                  child: Text('Thoát', style: TextStyle(color: Colors.red, fontSize: textSize.medium)),
                ),
                WdgButton(
                  onTap: () => Navigator.pop(context),
                  color: Colors.transparent,
                  child: Text('Tiếp tục học', style: TextStyle(color: Colors.green, fontSize: textSize.medium)),
                ),
              ]
          );
        },
    );
  }

}
