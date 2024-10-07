
/*  Events  */
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class QuizzEvent {}

class QuizzInit extends QuizzEvent {}

class QuizzNext extends QuizzEvent{}

class QuizzCheck extends QuizzEvent {}

/*  States  */
abstract class QuizzState {}

class QuizzInitial extends QuizzState {}

class QuizzInProgress extends QuizzState {
  final int currentIndex;
  final double progress;

  QuizzInProgress(this.currentIndex, this.progress);
}

class QuizzCompleted extends QuizzState {}

/*  Bloc  */
class QuizzBloc extends Bloc<QuizzEvent, QuizzState> {
  final int total;

  QuizzBloc(this.total) : super(QuizzInitial()) {
    on<QuizzInit>((event, emit) {
      // Khởi tạo quiz với câu hỏi đầu tiên
      emit(QuizzInProgress(0, 1.0 / total));
    });

    on<QuizzNext>((event, emit) {
      if (state is QuizzInProgress) {
        final currentState = state as QuizzInProgress;
        int nextIndex = currentState.currentIndex + 1;

        if (nextIndex < total) {
          // Chuyển sang quiz tiếp theo
          emit(QuizzInProgress(nextIndex, (nextIndex + 1) / total));
        } else {
          // Nếu đã hoàn thành, chuyển sang trạng thái hoàn thành
          emit(QuizzCompleted());
        }
      }
    });

    on<QuizzCheck>((event, emit) {
      if (state is QuizzInProgress) {
        // Logic kiểm tra câu trả lời có thể được xử lý ở đây
        // Sau đó gọi sự kiện QuizzNext để chuyển sang quiz tiếp theo
        add(QuizzNext());
      }
    });
  }
}