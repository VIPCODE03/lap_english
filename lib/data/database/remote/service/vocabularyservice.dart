import 'dart:convert';
import 'package:lap_english/data/database/remote/api/api.dart';
import '../../../model/learn/vocabulary.dart';
import 'package:http/http.dart' as http;

class VocabularyService {

  Future<List<MdlMainVocabularyTopic>> fetchMainTopic() async {
    String url = '${ApiBase.data}api/v1/main-topic?page=0&size=20&sort=id,desc';
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var responseBody = utf8.decode(response.bodyBytes);

        Map<String, dynamic> responseData = jsonDecode(responseBody);
        var items = responseData['data']['items'] as List;

        List<MdlMainVocabularyTopic> mainTopics = items.map((mainTopic) => MdlMainVocabularyTopic.fromJson(mainTopic)).toList();
        return mainTopics;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<MdlSubVocabularyTopic>> fetchSubTopic(int mainTopicId) async {
    String url = '${ApiBase.data}api/v1/sub-topic/main-topic/$mainTopicId?page=0&size=10';
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var responseBody = utf8.decode(response.bodyBytes);

        Map<String, dynamic> responseData = jsonDecode(responseBody);
        var items = responseData['data']['items'] as List;

        List<MdlSubVocabularyTopic> words = items.map((item) => MdlSubVocabularyTopic.fromJson(item)).toList();
        return words;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<MdlWord>> fetchWord(int subTopicId) async {
    String url = '${ApiBase.data}api/v1/word?page=0&size=50&word=subTopic.id:$subTopicId,sort=word,desc';
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var responseBody = utf8.decode(response.bodyBytes);

        Map<String, dynamic> responseData = jsonDecode(responseBody);
        var items = responseData['data']['items'] as List;

        List<MdlWord> words = items.map((item) => MdlWord.fromJson(item)).toList();
        return words;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}