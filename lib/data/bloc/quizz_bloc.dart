
/*  EVENTS  */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

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
  final int accoladesIndex;
  final int encouragementsIndex;

  QuizzInProgress(this.currentQuizz, this.progress,
      {this.accoladesIndex = 0,
        this.encouragementsIndex = 0
      });
}

class QuizzCompleted extends QuizzState {}

/*  BLOC  */
class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final List<Quizz> quizzes;
  int total = 0;

  QuizzBloc(this.quizzes) : super(QuizzInitial()) {
    total = quizzes.length;

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
          emit(QuizzCompleted());
        }
      }
    });

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
        int newAccoladesIndex = currentState.accoladesIndex;
        int newEncouragementsIndex = currentState.encouragementsIndex;

        //--- Tăng 1 hoặc giữ nguyên và giảm còn lại về 0 ---
        if (event.isCorrect) {
          newAccoladesIndex = (newAccoladesIndex + 1) < currentState.accolades.length
              ? newAccoladesIndex + 1
              : currentState.accolades.length - 1;
          newEncouragementsIndex = 0;
        }
        else {
          newEncouragementsIndex = (newEncouragementsIndex + 1) < currentState.encouragements.length
              ? newEncouragementsIndex + 1
              : currentState.encouragements.length - 1;
          newAccoladesIndex = 0;
        }
        emit(QuizzInProgress(
          quizzes.first,
          currentState.progress,
          accoladesIndex: newAccoladesIndex,
          encouragementsIndex: newEncouragementsIndex,
        ));

        quizzes.removeAt(0);
        add(QuizzNext());
      }
    });
  }
}
