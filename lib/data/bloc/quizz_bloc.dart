
/*  EVENTS  */
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class QuizzEvent {}

//===   Khởi tạo  ===
class QuizzInit extends QuizzEvent {}

//===   Chuyển tiếp  ===
class QuizzNext extends QuizzEvent{}

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

  final int currentIndex;
  final double progress;
  final int accoladesIndex;
  final int encouragementsIndex;

  QuizzInProgress(this.currentIndex, this.progress,
      {this.accoladesIndex = 0,
        this.encouragementsIndex = 0
      });
}

class QuizzCompleted extends QuizzState {}

/*  BLOC  */
class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final int total;

  QuizzBloc(this.total) : super(QuizzInitial()) {

    //---   Khởi tạo  ---
    on<QuizzInit>((event, emit) {
      emit(QuizzInProgress(0, 1.0 / total));
    });

    //--- Chuyển quizz  ---
    on<QuizzNext>((event, emit) {
      if (state is QuizzInProgress) {
        final currentState = state as QuizzInProgress;
        int nextIndex = currentState.currentIndex + 1;

        if (nextIndex < total) {  //->  Vẫn còn quizz
          emit(QuizzInProgress(nextIndex, (nextIndex + 1) / total,
              accoladesIndex: currentState.accoladesIndex,
              encouragementsIndex: currentState.encouragementsIndex));
        } else {  //->  Đã hoàn thành
          emit(QuizzCompleted());
        }
      }
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
        } else {
          newEncouragementsIndex = (newEncouragementsIndex + 1) < currentState.encouragements.length
              ? newEncouragementsIndex + 1
              : currentState.encouragements.length - 1;
          newAccoladesIndex = 0;
        }

        emit(QuizzInProgress(
          currentState.currentIndex,
          currentState.progress,
          accoladesIndex: newAccoladesIndex,
          encouragementsIndex: newEncouragementsIndex,
        ));
        add(QuizzNext());
      }
    });
  }
}
