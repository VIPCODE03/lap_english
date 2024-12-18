import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/learn/status.dart';

part 'word_sentence.g.dart';

@JsonSerializable()
class MainTopic {
  final int id;
  String name;
  MdlUnlockStatusManager status;

  MainTopic(
      this.id,
      this.name,
      this.status);

  factory MainTopic.fromJson(Map<String, dynamic> json) => _$MainTopicFromJson(json);
  Map<String, dynamic> toJson() => _$MainTopicToJson(this);
}

@JsonSerializable()
class SubTopic {
  final int id;
  String name;
  String? imageUrl;
  bool isLearned;
  MdlUnlockStatusManager status;
  int mainTopicId;

  SubTopic(this.id, this.name, this.imageUrl, this.mainTopicId, this.status, {this.isLearned = false});

  factory SubTopic.fromJson(Map<String, dynamic> json) => _$SubTopicFromJson(json);
  Map<String, dynamic> toJson() => _$SubTopicToJson(this);
}

/*  Từ vựng   */
@JsonSerializable()
class Word {
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

  Word(
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
      });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}

/* Câu */
@JsonSerializable()
class Sentence {
  final int id;
  String sentence;
  String translation;
  int idSubTopic;

  Sentence(this.id, this.sentence, this.translation, this.idSubTopic);

  factory Sentence.fromJson(Map<String, dynamic> json) => _$SentenceFromJson(json);
  Map<String, dynamic> toJson() => _$SentenceToJson(this);
}