import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';

class SubTopicVocabularyService extends ApiService<List<MdlSubVocabularyTopic>> {

  Future<List<MdlSubVocabularyTopic>?> fetchPage(int mainTopicId, int page, int size) async {
    return await request(
      api: '/api/v1/sub-topic/main-topic/$mainTopicId',
      datas: {
        'page': page,
        'size': size
      },
      requestType: RequestType.get,
    );
  }

  Future<bool> unlock(MdlSubVocabularyTopic subTopic) async {
    var postRequest = await request(
      api: '/api/v1/sub-topic/unlock/${subTopic.id}',
      requestType: RequestType.put,
    );
    if (postRequest != null) {
      return true;
    }
    return false;
  }

  Future<bool> completed(MdlSubVocabularyTopic subTopic) async {
    var postRequest = await request(
      api: '/api/v1/sub-topic/${subTopic.id}/complete',
      requestType: RequestType.put,
    );
    if (postRequest != null) {
      return true;
    }
    return false;
  }

  @override
  Future<List<MdlSubVocabularyTopic>?> success200(Response response) async {
    try {
      List<MdlSubVocabularyTopic> mainTopics = [];
      List<dynamic> items = response.data['data']['items'] ?? [];
      mainTopics = items.map((item) {
        item['imageUrl'] = item['blobName'];
        item['isLearned'] = item['learned'];
        return MdlSubVocabularyTopic.fromJson(item);
      }).toList();

      return mainTopics;
    }
    catch(e) {
      if (kDebugMode) {
        print('Error success200 MdlSubVocabularyTopic: $e');
      }
      return null;
    }
  }
}
