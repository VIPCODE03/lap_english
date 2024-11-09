
import 'package:json_annotation/json_annotation.dart';

part 'sentence.g.dart';

/* Chủ đề chính */
@JsonSerializable()
class MdlMainSentenceTopic {
  final int id;
  String name;

  MdlMainSentenceTopic(this.id, this.name, );

  factory MdlMainSentenceTopic.fromJson(Map<String, dynamic> json) => _$MdlMainSentenceTopicFromJson(json);
  Map<String, dynamic> toJson() => _$MdlMainSentenceTopicToJson(this);
}

/* Chủ đề con */
@JsonSerializable()
class MdlSubSentenceTopic {
  final int id;
  String name;
  String imageUrl;
  bool isLearned;
  int idMainTopic;

  MdlSubSentenceTopic(this.id, this.name, this.imageUrl, this.idMainTopic, {this.isLearned = false});

  factory MdlSubSentenceTopic.fromJson(Map<String, dynamic> json) => _$MdlSubSentenceTopicFromJson(json);
  Map<String, dynamic> toJson() => _$MdlSubSentenceTopicToJson(this);
}

/* Câu */
@JsonSerializable()
class MdlSentence {
  final int id;
  String sentence;
  String translation;
  int idSubTopic;

  MdlSentence(this.id, this.sentence, this.translation, this.idSubTopic);

  factory MdlSentence.fromJson(Map<String, dynamic> json) => _$MdlSentenceFromJson(json);
  Map<String, dynamic> toJson() => _$MdlSentenceToJson(this);
}
