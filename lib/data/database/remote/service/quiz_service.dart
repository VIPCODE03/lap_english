import 'package:dio/dio.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

class QuizService extends ApiService {

  Future<void> completedQuiz(QuizzResult quizResult) async {
    await request(
        api: '/api/v1/sub-topic/user-quiz',
        datas: quizResult.toMap(),
        requestType: RequestType.put
    );
    return;
  }

  @override
  Future<dynamic> success200(Response response) async {
    return null;
  }
}