
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/database/remote/service/quiz_service.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/services/data_manager.dart';

/*  EVENTS  */
abstract class QuizzEvent {}

//===   Khởi tạo  ===
class QuizzInit extends QuizzEvent {}

//===   Chuyển tiếp  ===
class QuizzNext extends QuizzEvent{}

//===   Bỏ qua  ===
class QuizzSkip extends QuizzEvent {}

//===   Kiểm tra  ===
class QuizzCheck extends QuizzEvent {
  final bool isCorrect;
  QuizzCheck(this.isCorrect);
}

/*  STATE  */
abstract class QuizzState {}

class QuizzInitial extends QuizzState {}

class QuizzInProgress extends QuizzState {
  final accolades = [
    "Chính xác", "Làm tốt lắm", "Tuyệt vời",
    "Bạn đang học rất tốt", "5 lần liên tiếp", "Trên cả tuyệt vời",
    "Amazing",
  ];

  final encouragements = [
    "Chưa chính xác", "Không sao, hãy tiếp tục", "Tiếp tục cố gắng nhé",
    "Kiên trì sẽ làm được"
  ];

  late final Quizz currentQuizz;
  final double progress;
  int accoladesIndex;
  int encouragementsIndex;

  QuizzInProgress(this.currentQuizz, this.progress,
      {
        this.accoladesIndex = 0,
        this.encouragementsIndex = 0
      });

  updateState(bool isCorrect) {
    if (isCorrect) {
      accoladesIndex = (accoladesIndex + 1) < accolades.length
          ? accoladesIndex + 1
          : accolades.length - 1;
      encouragementsIndex = 0;
    }
    else {
      encouragementsIndex = (encouragementsIndex + 1) < encouragements.length
          ? encouragementsIndex + 1
          : encouragements.length - 1;
      accoladesIndex = 0;
    }
    return this;
  }
}

class QuizzCompleted extends QuizzState {
  final QuizzResult quizzResult;
  QuizzCompleted(this.quizzResult);
}

/*  BLOC  */
class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final dynamic object;
  late final QuizzResult quizzResult;
  final List<Quizz> quizzes;
  int total = 0;
  int newCorrectConsecutive = 0;
  late TypeQuizz typeQuizz;

  int totalWord = 0;
  int totalSentence = 0;
  int totalGrammar = 0;

  QuizzBloc(
      this.quizzes,
      this.typeQuizz,
      this.totalWord,
      this.totalSentence,
      this.totalGrammar,
      {required this.object}
      )
      : super(QuizzInitial()) {
    total = quizzes.length;
    var totalWrite = quizzes.where((quizz) => quizz.skillType == SkillType.writing).length;
    var totalListen = quizzes.where((quizz) => quizz.skillType == SkillType.listening).length;
    var totalRead = quizzes.where((quizz) => quizz.skillType == SkillType.reading).length;
    var totalSpeak = quizzes.where((quizz) => quizz.skillType == SkillType.speaking).length;

    quizzResult = QuizzResult(object: object, total, totalWrite, totalListen, totalRead, totalSpeak, typeQuizz, totalWord, totalSentence, totalGrammar);

    //---   Khởi tạo  ---
    on<QuizzInit>((event, emit) {
      emit(QuizzInProgress(quizzes.first, 1 - quizzes.length/total));
    });

    //--- Chuyển quizz  ---
    on<QuizzNext>((event, emit) {
      if (state is QuizzInProgress) {
        final currentState = state as QuizzInProgress;
        if (quizzes.isNotEmpty) {  //->  Vẫn còn quizz
          emit(QuizzInProgress(quizzes.first, 1 - quizzes.length/total,
              accoladesIndex: currentState.accoladesIndex,
              encouragementsIndex: currentState.encouragementsIndex)
          );

        } else {  //->  Đã hoàn thành
          double coefficient = (quizzResult.correct / quizzResult.total) * (total / 10).clamp(1, 2) ;
          quizzResult.bonus = (quizzResult.bonus * coefficient).toInt();
          quizzResult.pointRank += (10 * coefficient).toInt();
          QuizService().completedQuiz(quizzResult);
          emit(QuizzCompleted(quizzResult));
          if(object is SubTopic) {
            (object as SubTopic).isLearned = true;
          }
        }
      }
    });

    //--- Bỏ qua quizz  ---
    on<QuizzSkip>((event, emit) {
      int countRemovedItems = 0;
      quizzes.removeWhere((quizz) {
        if (quizz.skillType == quizzes.first.skillType) {
          countRemovedItems++;
          return true;
        }
        return false;
      });
      total -= countRemovedItems;
      add(QuizzNext());
    });

    //---   Kiểm tra  ---
    on<QuizzCheck>((event, emit) {
      if (state is QuizzInProgress) {
        final currentState = state as QuizzInProgress;
        if(event.isCorrect) {
          newCorrectConsecutive++;
        } else {
          newCorrectConsecutive = 0;
        }
        quizzResult.update(event.isCorrect, quizzes.first.skillType, newCorrectConsecutive);
        currentState.updateState(event.isCorrect);
        quizzes.removeAt(0);
        add(QuizzNext());
      }
    });
  }
}
