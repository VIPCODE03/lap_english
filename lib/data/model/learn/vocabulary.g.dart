// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlMainVocabularyTopic _$MdlMainVocabularyTopicFromJson(
        Map<String, dynamic> json) =>
    MdlMainVocabularyTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$MdlMainVocabularyTopicToJson(
        MdlMainVocabularyTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MdlSubVocabularyTopic _$MdlSubVocabularyTopicFromJson(
        Map<String, dynamic> json) =>
    MdlSubVocabularyTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imageUrl'] as String,
      (json['idMainTopic'] as num).toInt(),
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$MdlSubVocabularyTopicToJson(
        MdlSubVocabularyTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isLearned': instance.isLearned,
      'idMainTopic': instance.idMainTopic,
    };

MdlWord _$MdlWordFromJson(Map<String, dynamic> json) => MdlWord(
      (json['id'] as num).toInt(),
      json['word'] as String,
      json['meaning'] as String,
      json['pronounceUK'] as String,
      json['pronounceUS'] as String,
      json['type'] as String,
      json['level'] as String,
      json['example'] as String,
      (json['idSubTopic'] as num).toInt(),
    );

Map<String, dynamic> _$MdlWordToJson(MdlWord instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'meaning': instance.meaning,
      'pronounceUK': instance.pronounceUK,
      'pronounceUS': instance.pronounceUS,
      'type': instance.type,
      'level': instance.level,
      'example': instance.example,
      'idSubTopic': instance.idSubTopic,
    };
