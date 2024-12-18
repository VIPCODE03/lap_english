import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/dialogs/dialog_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizz_widget.dart';
import 'package:lap_english/ui/widgets/learn/quiz/a_quizzes_widget.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
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
  final TypeQuizz _typeQuizz;
  final bool _isLearned;
  final bool _isCustom;

  final int _totalWord;
  final int _totalSentence;
  final int _totalGrammar;

  QuizzScreen.vocabulary({super.key, required List<MdlWord> words, required bool isLearned})
    :
        _typeQuizz = TypeQuizz.quizzVocabulary,
        _totalWord = words.length,
        _totalSentence = 0,
        _totalGrammar = 0,
        _isLearned = isLearned,
        _isCustom = false,
      _quizzes = Quizzes.generateQuizzVocabulary(mode: QuizzMode.basic, words: words);

  QuizzScreen.sentence({super.key, required List<MdlSentence> sentences, required bool isLearned})
      :
        _typeQuizz = TypeQuizz.quizzSentence,
        _totalWord = 0,
        _totalSentence = sentences.length,
        _totalGrammar = 0,
        _isLearned = isLearned,
        _isCustom = false,
      _quizzes = Quizzes.generateQuizzSentence(mode: QuizzMode.basic, sentences: sentences);

  QuizzScreen.grammar({super.key, required List<GrammaticalStructure> structures})
      :
        _typeQuizz = TypeQuizz.quizGrammar,
        _totalWord = 0,
        _totalSentence = 0,
        _totalGrammar = structures.length,
        _isLearned = false,
        _isCustom = true,
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
      Future.delayed(const Duration(seconds: 2), () {
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
            widget._typeQuizz, widget._isLearned, widget._totalWord, widget._totalSentence, widget._totalGrammar)
          ..add(QuizzInit());
      });
    }).catchError((error) {
      setState(() {
        _quizzes = null;
      });
    });
  }

  @override
  Widget build(BuildContext quizContext) {
    //--- Đang tải hoặc lỗi ---
    if (_quizzes == null) {
      return const WdgScaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    //--- Không có dữ liệu  ---
    if (_quizzes!.isEmpty) {
      if(!showQuizz) {
        return const WdgScaffold(
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

        child: BlocProvider.value(
          value: _quizzBloc,
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
                          height: isTablet
                              ? isPortrait
                                  ? maxHeight * 0.04
                                  : 30
                              : isPortrait
                                  ? maxHeight * 0.03
                                  : 20,
                          child: WdgAnimatedProgressBar(value: state.progress)),
                    ),
                    body: Column(
                      children: [
                        ///Text kĩ năng -------------------------------------------
                          Container(
                              margin: const EdgeInsets.all(3),
                              alignment: Alignment.centerLeft,
                              child: FittedBox(
                                child: Text(
                                  Skill.skillName(currentQuizz.quizz.skillType),
                                  style: TextStyle(
                                      fontSize: textSize.normal,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )),

                        ///Text câu hỏi -------------------------------------------
                        Container(
                          margin: const EdgeInsets.all(3),
                          alignment: Alignment.centerLeft,
                          child: WdgSpecialText(text: currentQuizz.quizz.question),
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
                          FittedBox(
                            child: SizedBox(
                                height: orientation == Orientation.portrait
                                    ? maxHeight * 0.03
                                    : maxHeight * 0.07,
                                width: maxWidth,
                                child: WdgButton(
                                  buttonFit: ButtonFit.scaleDown,
                                  color: Colors.transparent,
                                  onTap: () {
                                    isNext = true;
                                    context.read<QuizzBloc>().add(QuizzSkip());
                                  },
                                  child: Text(
                                    currentQuizz.quizz.skillType ==
                                            SkillType.speaking
                                        ? 'Hiện tại không nói được'
                                        : 'Hiện tại không nghe được',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey.withAlpha(70)),
                                  ),
                                )),
                          ),

                        ///Button kiểm tra  ------------------------------------------
                        Container(
                          constraints: BoxConstraints(
                            minHeight: textSize.specical * 2
                          ),
                            width: (isTablet || !isPortrait) ? (maxWidth / 1.66) : maxWidth * 0.66,
                            margin: const EdgeInsets.symmetric(vertical: 15),
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
                                          if (isCorrect) {
                                            _audio.playFromAsset(
                                                Assets.sounds.correct);
                                          } else {
                                            _audio.playFromAsset(
                                                Assets.sounds.wrong);
                                          }
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
                                        ? VipColors.primary(context)
                                        : Colors.grey,
                                    alpha: 75,
                                    child: Text(
                                        'Kiểm tra',
                                        style: TextStyle(
                                          fontSize: textSize.specical,
                                        ),
                                      ),
                                    );
                              },
                            )),
                      ],
                    ));
              } else if (state is QuizzCompleted) {
                return WdgQuizzResult(quizzResult: state.quizzResult);
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }

  ///Dialog kết quả ------------------------------------------------------------
  void _buildBottomDialogResult(BuildContext parentContext, String title, String? answerCorrect, bool isCorrect) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      constraints: BoxConstraints(
        maxWidth: (isTablet || !isPortrait) ? maxWidth / 1.66 : maxWidth,
      ),
      context: parentContext,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: SizedBox(
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

                      /// Button chuyển tiếp  --------------------------------------
                      Container(
                          constraints: BoxConstraints(
                              minHeight: textSize.specical * 2
                          ),
                          width: maxWidth * 0.66,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: WdgButton(
                            onTap: () {
                              isNext = true;
                              currentQuizz.status.isEnd.value = true;
                              parentContext.read<QuizzBloc>().add(QuizzCheck(isCorrect));  //-> Check
                              Navigator.pop(context); //->  Đóng BottomSheet
                            },
                            borderRadius: BorderRadius.circular(12),
                            color: isCorrect ? Colors.green : Colors.red,
                            child: Text(
                              'Tiếp tục',
                              style: TextStyle(fontSize: textSize.specical),
                            ),
                          )
                      ),
                    ],
                  ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              title: const Text('Xác nhận thoát', style: TextStyle(fontSize: 24)),
              content: const Text('Bạn sẽ mất tiến trình', style: TextStyle(fontSize: 18)),
              actions: [
                WdgButton(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(parentContext);
                  },
                  color: Colors.transparent,
                  child: const Text('Thoát', style: TextStyle(color: Colors.red, fontSize: 20)),
                ),
                WdgButton(
                  onTap: () => Navigator.pop(context),
                  color: Colors.transparent,
                  child: const Text('Tiếp tục học', style: TextStyle(color: Colors.green, fontSize: 20)),
                ),
              ]
          );
        },
    );
  }

}
