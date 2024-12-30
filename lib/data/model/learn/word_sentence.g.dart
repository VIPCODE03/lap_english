// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainTopic _$MainTopicFromJson(Map<String, dynamic> json) => MainTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      MdlUnlockStatusManager.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainTopicToJson(MainTopic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };

SubTopic _$SubTopicFromJson(Map<String, dynamic> json) => SubTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imageUrl'] as String?,
      (json['mainTopicId'] as num).toInt(),
      MdlUnlockStatusManager.fromJson(json['status'] as Map<String, dynamic>),
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$SubTopicToJson(SubTopic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isLearned': instance.isLearned,
      'status': instance.status,
      'mainTopicId': instance.mainTopicId,
    };

Word _$WordFromJson(Map<String, dynamic> json) => Word(
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

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
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

Sentence _$SentenceFromJson(Map<String, dynamic> json) => Sentence(
      (json['id'] as num).toInt(),
      json['sentence'] as String,
      json['translation'] as String,
      (json['subTopicId'] as num).toInt(),
    );

Map<String, dynamic> _$SentenceToJson(Sentence instance) => <String, dynamic>{
      'id': instance.id,
      'sentence': instance.sentence,
      'translation': instance.translation,
      'subTopicId': instance.subTopicId,
    };
