import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/learn/status.dart';

part 'vocabulary.g.dart';

/*  Chủ đề chính  */
@JsonSerializable()
class MdlMainVocabularyTopic {
  final int id;
  String name;
  MdlUnlockStatusManager status;

  MdlMainVocabularyTopic(this.id, this.name, this.status);

  factory MdlMainVocabularyTopic.fromJson(Map<String, dynamic> json) => _$MdlMainVocabularyTopicFromJson(json);

  Map<String, dynamic> toJson() => _$MdlMainVocabularyTopicToJson(this);
}

/*  Chủ đề con  */
@JsonSerializable()
class MdlSubVocabularyTopic {
  final int id;
  String name;
  String? imageUrl;
  bool isLearned;
  MdlUnlockStatusManager status;
  int mainTopicId;

  MdlSubVocabularyTopic(this.id, this.name, this.imageUrl, this.mainTopicId, this.status ,{this.isLearned = false});

  factory MdlSubVocabularyTopic.fromJson(Map<String, dynamic> json) => _$MdlSubVocabularyTopicFromJson(json);

  Map<String, dynamic> toJson() => _$MdlSubVocabularyTopicToJson(this);
}

/*  Từ vựng   */
@JsonSerializable()
class MdlWord {
  final int id;
  final String word;
  final String meaning;
  final String pronounceUK;
  final String pronounceUS;
  final String type;
  final String level;
  final String example;
  final int subTopicId;
  final String? imageBlobName;
  final String? audioUkBlobName;
  final String? audioUsBlobName;

  MdlWord(
    this.id,
    this.word,
    this.meaning,
    this.pronounceUK,
    this.pronounceUS,
    this.type,
    this.level,
    this.example,
    this.subTopicId,
  {
    this.imageBlobName,
    this.audioUkBlobName,
    this.audioUsBlobName
  }
  );

  factory MdlWord.fromJson(Map<String, dynamic> json) => _$MdlWordFromJson(json);

  Map<String, dynamic> toJson() => _$MdlWordToJson(this);
}
