import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

class WordService extends ApiService<List<MdlWord>> {

  Future<List<MdlWord>> fetchByIdSubTopic(int subTopicId) async {
    return await request(
        api: '/api/v1/word?word=subTopic.id:$subTopicId',
        requestType: RequestType.get
    );
  }

  @override
  Future<List<MdlWord>?> success200(Response response) async {
    try {
      var items = response.data['data']['items'] as List;
      List<MdlWord> words = items.map((item) => MdlWord.fromJson(item)).toList();
      return words;
    }
    catch(e) {
      if (kDebugMode) {
        print('Error success200 MdlWord: $e');
      }
      return null;
    }
  }
}