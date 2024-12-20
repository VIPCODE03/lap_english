import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';

import '../../../model/learn/grammar.dart';

class GrammarService extends ApiService {
  late _RequestType _type;

  Future<List<TypeGrammar>?> fetchTypeGrammar() async {
    _type = _RequestType.loadTypeGrammar;
    return await request(
        api: '/api/v1/type-grammar?page=0&size=50',
        requestType: RequestType.get
    );
  }

  @override
  Future success200(Response response) async {
    try {
      switch(_type) {
        case _RequestType.loadTypeGrammar:

      }
    }
    catch(e) {
      debugPrint('Error 200 GrammarService: $e');
      return null;
    }
  }
}

enum _RequestType {
  loadTypeGrammar
}