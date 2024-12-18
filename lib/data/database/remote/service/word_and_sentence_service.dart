import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';

class WordService extends ApiService {
  late _TypeRequest _type;

  Future<List<Word>?> fetchByIdSubTopic(int subTopicId) async {
    _type = _TypeRequest.fetchByIdSubTopic;
    return await request(
        api: '/api/v1/word?word=subTopic.id:$subTopicId',
        requestType: RequestType.get
    );
  }

  @override
  Future<dynamic> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeRequest.fetchByIdSubTopic:
          var items = response.data['data']['items'] as List;
          return items.map((item) => Word.fromJson(item)).toList();
      }
    }
    catch(e) {
      debugPrint('Error success200 WordService: $e');
      return null;
    }
  }
}

class SentenceService extends ApiService {
  late _TypeRequest _type;

  Future<List<Sentence>?> fetchByIdSubTopic(int subTopicId) async {
    _type = _TypeRequest.fetchByIdSubTopic;
    return await request(
        api: '/api/v1/word?word=subTopic.id:$subTopicId',
        requestType: RequestType.get
    );
  }

  @override
  Future<dynamic> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeRequest.fetchByIdSubTopic:
          var items = response.data['data']['items'] as List;
          return items.map((item) => Sentence.fromJson(item)).toList();
      }
    }
    catch(e) {
      debugPrint('Error success200 SentenceService: $e');
      return null;
    }
  }
}

enum _TypeRequest {
  fetchByIdSubTopic,
}