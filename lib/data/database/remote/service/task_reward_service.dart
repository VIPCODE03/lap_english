import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';

class RewardService extends ApiService {
  late _TypeRequest _type;

  Future<bool> getReward(int dailyTaskId) async {
    _type = _TypeRequest.getReward;
    var newRequest = await request(
        api: '/api/v1/daily-task/claim-reward/$dailyTaskId',
        requestType: RequestType.post
    );
    if(newRequest != null) return true;
    return false;
  }

  @override
  Future success200(Response response) async {
    try {
      switch(_type) {
        case _TypeRequest.getReward:
          return true;
      }
    }
    catch(e) {
      debugPrint('Error 200 Reward: $e');
    }
  }
}

enum _TypeRequest {
  getReward
}