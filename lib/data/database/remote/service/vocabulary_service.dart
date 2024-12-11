import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

class MainTopicVocabularyService extends ApiService<List<MdlMainVocabularyTopic>> {
  late _TypeMainRequest _type;

  Future<List<MdlMainVocabularyTopic>?> fetchAll() async {
    _type = _TypeMainRequest.fetchAll;
    return await request(
      api: '/api/v1/main-topic/list/word',
      requestType: RequestType.get,
    );
  }

  Future<bool> fetchPage(int page, int size) async {
    _type = _TypeMainRequest.fetchPage;
    var postRequest = await request(
      api: '/api/v1/main-topic?maintopic=isWord%3Atrue',
      requestType: RequestType.get,
    );
    if (postRequest != null) {
      return true;
    }
    return false;
  }

  Future<bool> unlock(MdlMainVocabularyTopic mainTopic) async {
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
  Future<List<MdlMainVocabularyTopic>?> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeMainRequest.update:
          return null;
        case _TypeMainRequest.unlock:
          return null;
        case _TypeMainRequest.fetchAll:
          var items = response.data['data'] as List;
          List<MdlMainVocabularyTopic> mainTopics = items.map((mainTopic)
          => MdlMainVocabularyTopic.fromJson(mainTopic)).toList();
          return mainTopics;

        case _TypeMainRequest.fetchPage:
          var items = response.data['data'] as List;
          List<MdlMainVocabularyTopic> mainTopics = items.map((mainTopic)
          => MdlMainVocabularyTopic.fromJson(mainTopic)).toList();
          return mainTopics;
      }
    }
    catch(e) {
      if (kDebugMode) {
        print('Error success200 mainVocabulary: $e');
      }
      return null;
    }
  }
}

class MainTopicSentenceService extends ApiService<List<MdlMainSentenceTopic>> {
  late _TypeMainRequest _type;

  Future<List<MdlMainSentenceTopic>?> fetchAll() async {
    _type = _TypeMainRequest.fetchAll;
    return await request(
      api: '/api/v1/main-topic/list/sentence',
      requestType: RequestType.get,
    );
  }

  Future<bool> fetchPage(int page, int size) async {
    _type = _TypeMainRequest.fetchPage;
    var postRequest = await request(
      api: '/api/v1/main-topic?maintopic=isSentence%3Atrue',
      requestType: RequestType.get,
    );
    if (postRequest != null) {
      return true;
    }
    return false;
  }

  Future<bool> unlock(MdlMainSentenceTopic mainTopic) async {
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
  Future<List<MdlMainSentenceTopic>?> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeMainRequest.update:
          return null;
        case _TypeMainRequest.unlock:
          return null;
        case _TypeMainRequest.fetchAll:
          var items = response.data['data'] as List;
          List<MdlMainSentenceTopic> mainTopics = items.map((mainTopic)
          => MdlMainSentenceTopic.fromJson(mainTopic)).toList();
          return mainTopics;

        case _TypeMainRequest.fetchPage:
          var items = response.data['data'] as List;
          List<MdlMainSentenceTopic> mainTopics = items.map((mainTopic)
          => MdlMainSentenceTopic.fromJson(mainTopic)).toList();
          return mainTopics;
      }
    }
    catch(e) {
      if (kDebugMode) {
        print('Error success200 MdlMainSentenceTopic: $e');
      }
      return null;
    }
  }
}

enum _TypeMainRequest {update, unlock, fetchAll, fetchPage}