import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';

class MainTopicService extends ApiService {
  late _TypeMainRequest _type;

  Future<List<MainTopic>?> fetchAll(Type type) async {
    _type = _TypeMainRequest.fetchAll;
    return await request(
      api: type == Word
          ? '/api/v1/main-topic/list/word'
          : '/api/v1/main-topic/list/sentence',
      requestType: RequestType.get,
    );
  }

  Future<List<MainTopic>?> fetchPage({required int page,required int size, required Type type}) async {
    _type = _TypeMainRequest.fetchPage;
    return await request(
      api: type == Word
          ? '/api/v1/main-topic?maintopic=isWord%3Atrue'
          : '/api/v1/main-topic/list/sentence',
      requestType: RequestType.get,
    );
  }

  Future<bool> unlock(MainTopic mainTopic) async {
    _type = _TypeMainRequest.unlock;
    var postRequest = await request(
      api: '/api/v1/main-topic/unlock/${mainTopic.id}',
      requestType: RequestType.put,
    );
    if (postRequest != null) {
      return true;
    }
    return false;
  }

  @override
  Future<List<MainTopic>?> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeMainRequest.update:
          return null;
        case _TypeMainRequest.unlock:
          return null;
        case _TypeMainRequest.fetchAll:
          var items = response.data['data'] as List;
          List<MainTopic> mainTopics = items.map((mainTopic) => MainTopic.fromJson(mainTopic)).toList();
          return mainTopics;

        case _TypeMainRequest.fetchPage:
          var items = response.data['data'] as List;
          List<MainTopic> mainTopics = items.map((mainTopic)
          => MainTopic.fromJson(mainTopic)).toList();
          return mainTopics;
      }
    }
    catch(e) {
      if (kDebugMode) {
        print('Error success200 mainTopic: $e');
      }
      return null;
    }
  }
}

enum _TypeMainRequest {update, unlock, fetchAll, fetchPage}