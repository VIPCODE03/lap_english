import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';

import '../../../model/quizz/quiz_result.dart';

class QuizService extends ApiService {
  late _RequestType _type;

  Future<dynamic> completedQuiz(QuizzResult quizResult) async {
    _type = _RequestType.completedQuiz;
    return await request(
        api: '/api/v1/sub-topic/user-quiz',
        datas: quizResult.toMap(),
        requestType: RequestType.put
    );
  }

  @override
  Future<dynamic> success200(Response response) async {
    try {
      switch(_type) {
        case _RequestType.completedQuiz:
          return response.data['data'];
      }
    }
    catch(e) {
      debugPrint('Error 200 QuizService: $e');
      return null;
    }
  }
}

enum _RequestType {
  completedQuiz
}