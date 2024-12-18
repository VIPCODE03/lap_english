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
          MdlUnlockStatusManager.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MdlMainVocabularyTopicToJson(
        MdlMainVocabularyTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };

MdlSubVocabularyTopic _$MdlSubVocabularyTopicFromJson(
        Map<String, dynamic> json) =>
    MdlSubVocabularyTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imageUrl'] as String,
      (json['mainTopicId'] as num).toInt(),
          MdlUnlockStatusManager.fromJson(json['status'] as Map<String, dynamic>),
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$MdlSubVocabularyTopicToJson(
        MdlSubVocabularyTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isLearned': instance.isLearned,
      'status': instance.status,
      'mainTopicId': instance.mainTopicId,
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
      (json['subTopicId'] as num).toInt(),
      imageBlobName: json['imageBlobName'] as String?,
      audioUkBlobName: json['audioUkBlobName'] as String?,
      audioUsBlobName: json['audioUsBlobName'] as String?,
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
      'subTopicId': instance.subTopicId,
      'imageBlobName': instance.imageBlobName,
      'audioUkBlobName': instance.audioUkBlobName,
      'audioUsBlobName': instance.audioUsBlobName,
    };
