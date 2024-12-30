import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lap_english/data/database/remote/service/data_service.dart';
import '../../../model/learn/grammar.dart';

class GrammarService extends ApiService {
  late _RequestType _type;

  //=== Lấy loại ngữ pháp ===
  Future<List<TypeGrammar>?> fetchTypeGrammar() async {
    _type = _RequestType.loadTypeGrammar;
    return await request(
        api: '/api/v1/type-grammar?page=0&size=50',
        requestType: RequestType.get
    );
  }

  //=== Lấy ngữ pháp theo idTypeGrammar ===
  Future<List<Grammar>?> fetchGrammarByTypeGrammarId(int typeGrammarId) async {
    _type = _RequestType.loadGrammarById;
    return await request(
        api: '/api/v1/grammar/type-grammar/$typeGrammarId',
        requestType: RequestType.get
    );
  }

  //=== Lấy cấu trúc theo id ngữ pháp ===
  Future<List<GrammaticalStructure>?> fetchStructureByGrammarId(int grammarId) async {
    _type = _RequestType.loadStructureByGrammarId;
    return await request(
        api: '/api/v1/grammatical-structure/grammar/$grammarId',
        requestType: RequestType.get
    );
  }

  //=== Lấy bài tập theo id cấu trúc ===
  Future<List<ExerciseGrammar>?> fetchExerciseGrammarByStructureId(int structureId) async {
    _type = _RequestType.loadExerciseByIdStructure;
    return await request(
        api: '/api/v1/exercise-grammar/grammatical-structure/$structureId',
        requestType: RequestType.get
    );
  }

  @override
  Future success200(Response response) async {
    try {
      switch(_type) {
        case _RequestType.loadTypeGrammar:
          List<dynamic> datas = response.data['data']['items'];
          return datas.map((data) => TypeGrammar.fromJson(data)).toList();

        case _RequestType.loadGrammarById:
          List<dynamic> datas = response.data['data'];
          return datas.map((data) => Grammar.fromJson(data)).toList();

        case _RequestType.loadStructureByGrammarId:
          List<dynamic> datas = response.data['data'];
          return datas.map((data) => GrammaticalStructure.fromJson(data)).toList();

        case _RequestType.loadExerciseByIdStructure:
          List<dynamic> datas = response.data['data']['items'];
          return datas.map((data) {
            data['quiz'] = data['customQuiz'];
            data['quiz']['type'] = switch (data['quiz']['typeQuiz'] as String) {
              'CHOOSE_ONE' => 'chooseOne',
              'SELECT' => 'select',
              'SOUND' => 'sound',
              'IMAGE' => 'image',
              'WRITE' => 'write',
              _ => 'chooseOne',
            };
            return ExerciseGrammar.fromJson(data);
          }).toList();
      }
    }
    catch(e) {
      debugPrint('Error 200 GrammarService: $e');
    }
  }
}

enum _RequestType {
  loadTypeGrammar,
  loadGrammarById,
  loadStructureByGrammarId,
  loadExerciseByIdStructure,
}