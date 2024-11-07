import 'package:json_annotation/json_annotation.dart';

part 'sentence.g.dart';

/* Chủ đề chính */
@JsonSerializable()
class MainSentenceTopic {
  int id;
  String name;
  List<SubSentenceTopic> subSentenceTopics;

  MainSentenceTopic(this.id, this.name, this.subSentenceTopics);

  factory MainSentenceTopic.fromJson(Map<String, dynamic> json) => _$MainSentenceTopicFromJson(json);
  Map<String, dynamic> toJson() => _$MainSentenceTopicToJson(this);
}

/* Chủ đề con */
@JsonSerializable()
class SubSentenceTopic {
  final int id;
  String name;
  String imageUrl;
  List<Sentence> sentences;
  bool isLearned;

  SubSentenceTopic(this.id, this.name, this.imageUrl, this.sentences, {this.isLearned = false});

  factory SubSentenceTopic.fromJson(Map<String, dynamic> json) => _$SubSentenceTopicFromJson(json);
  Map<String, dynamic> toJson() => _$SubSentenceTopicToJson(this);
}

/* Câu */
@JsonSerializable()
class Sentence {
  int id;
  String sentence;
  String translation;

  Sentence(this.id, this.sentence, this.translation);

  factory Sentence.fromJson(Map<String, dynamic> json) => _$SentenceFromJson(json);
  Map<String, dynamic> toJson() => _$SentenceToJson(this);
}
