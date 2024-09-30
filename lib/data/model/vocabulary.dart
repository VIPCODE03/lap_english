import 'package:json_annotation/json_annotation.dart';

part 'vocabulary.g.dart';

/*  Chủ đề chính  */
@JsonSerializable()
class MainVocabularyTopic {
  int id;
  String name;
  List<SubVocabularyTopic> subTopics;

  MainVocabularyTopic(this.id, this.name, this.subTopics);

  factory MainVocabularyTopic.fromJson(Map<String, dynamic> json) => _$MainVocabularyTopicFromJson(json);

  Map<String, dynamic> toJson() => _$MainVocabularyTopicToJson(this);
}

/*  Chủ đề con  */
@JsonSerializable()
class SubVocabularyTopic {
  int id;
  String name;
  List<Word> words;

  SubVocabularyTopic(this.id, this.name, this.words);

  factory SubVocabularyTopic.fromJson(Map<String, dynamic> json) => _$SubVocabularyTopicFromJson(json);

  Map<String, dynamic> toJson() => _$SubVocabularyTopicToJson(this);
}

/*  Từ vựng   */
@JsonSerializable()
class Word {
  int id;
  String word;
  String meaning;
  String pronounceUK;
  String pronounceUS;
  String type;
  String level;
  List<String> examples;

  Word(this.id, this.word, this.meaning, this.pronounceUK, this.pronounceUS,
      this.type, this.level, this.examples);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
