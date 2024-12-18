import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';

class SubTopicService extends ApiService {
  late _TypeSubRequest _type;

  Future<List<SubTopic>?> fetchPage(int mainTopicId, int page, int size) async {
    _type = _TypeSubRequest.fetchPage;
    return await request(
      api: '/api/v1/sub-topic/main-topic/$mainTopicId',
      datas: {
        'page': page,
        'size': size
      },
      requestType: RequestType.get,
    );
  }

  //=== Lấy dữ liệu theo id ===
  Future<SubTopic?> fetchById(int subTopicId) async {
    _type = _TypeSubRequest.fetchById;
    var postRequest = await request(
      api: '/api/v1/sub-topic/$subTopicId',
      requestType: RequestType.get,
    );
    if (postRequest is List<SubTopic>?) {
      return postRequest?.first;
    }
    return null;
  }

  //=== Mở khóa chủ đề ===
  Future<bool> unlock(SubTopic subTopic) async {
    _type = _TypeSubRequest.unlock;
    var newRequest = await request(
      api: '/api/v1/sub-topic/unlock/${subTopic.id}',
      requestType: RequestType.put,
    );
    if(newRequest != null) {
      return newRequest;
    }
    return false;
  }

  //=== Hoàn thành chủ đề ===
  Future<bool?> completed(SubTopic subTopic) async {
    _type = _TypeSubRequest.completed;
    var postRequest = await request(
      api: '/api/v1/sub-topic/${subTopic.id}/complete',
      requestType: RequestType.put,
    );
    if (postRequest is List<SubTopic>?) {
      return postRequest?.first.isLearned;
    }
    return false;
  }

  @override
  Future<dynamic> success200(Response response) async {
    try {
      switch(_type) {
        case _TypeSubRequest.fetchPage:
          List<SubTopic> mainTopics = [];
          List<dynamic> items = response.data['data']['items'] ?? [];
          mainTopics = items.map((item) {
            item['imageUrl'] = item['blobName'];
            item['isLearned'] = item['learned'];
            return SubTopic.fromJson(item);
          }).toList();
          return mainTopics;

        case _TypeSubRequest.unlock:
          return response.data['data'];

        case _TypeSubRequest.completed:
          return null;

        case _TypeSubRequest.fetchById:
          Map<String, dynamic> data = response.data['data'];
          return [SubTopic.fromJson(data)];
      }
    }
    catch(e) {
      debugPrint('Error success200 SubTopicService: $e');
      return null;
    }
  }
}

enum _TypeSubRequest {
  fetchPage, unlock, completed, fetchById
}
