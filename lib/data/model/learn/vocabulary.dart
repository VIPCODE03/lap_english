import 'package:json_annotation/json_annotation.dart';

part 'vocabulary.g.dart';

/*  Chủ đề chính  */
@JsonSerializable()
class MdlMainVocabularyTopic {
  final int id;
  String name;

  MdlMainVocabularyTopic(this.id, this.name);

  factory MdlMainVocabularyTopic.fromJson(Map<String, dynamic> json) => _$MdlMainVocabularyTopicFromJson(json);

  Map<String, dynamic> toJson() => _$MdlMainVocabularyTopicToJson(this);
}

/*  Chủ đề con  */
@JsonSerializable()
class MdlSubVocabularyTopic {
  final int id;
  String name;
  String imageUrl;
  bool isLearned;
  int idMainTopic;

  MdlSubVocabularyTopic(this.id, this.name, this.imageUrl, this.idMainTopic, {this.isLearned = false});

  factory MdlSubVocabularyTopic.fromJson(Map<String, dynamic> json) => _$MdlSubVocabularyTopicFromJson(json);

  Map<String, dynamic> toJson() => _$MdlSubVocabularyTopicToJson(this);
}

/*  Từ vựng   */
@JsonSerializable()
class MdlWord {
  final int id;
  String word;
  String meaning;
  String imageUrl;
  String pronounceUK;
  String pronounceUS;
  String type;
  String level;
  String example;
  int idSubTopic;

  MdlWord(
    this.id,
    this.word,
    this.meaning,
    this.pronounceUK,
    this.pronounceUS,
    this.type,
    this.level,
    this.example,
    this.imageUrl,
    this.idSubTopic,
  );

  factory MdlWord.fromJson(Map<String, dynamic> json) => _$MdlWordFromJson(json);

  Map<String, dynamic> toJson() => _$MdlWordToJson(this);
}
