// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlMainSentenceTopic _$MdlMainSentenceTopicFromJson(
        Map<String, dynamic> json) =>
    MdlMainSentenceTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$MdlMainSentenceTopicToJson(
        MdlMainSentenceTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MdlSubSentenceTopic _$MdlSubSentenceTopicFromJson(Map<String, dynamic> json) =>
    MdlSubSentenceTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imageUrl'] as String,
      (json['idMainTopic'] as num).toInt(),
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$MdlSubSentenceTopicToJson(
        MdlSubSentenceTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isLearned': instance.isLearned,
      'idMainTopic': instance.idMainTopic,
    };

MdlSentence _$MdlSentenceFromJson(Map<String, dynamic> json) => MdlSentence(
      (json['id'] as num).toInt(),
      json['sentence'] as String,
      json['translation'] as String,
      (json['idSubTopic'] as num).toInt(),
    );

Map<String, dynamic> _$MdlSentenceToJson(MdlSentence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentence': instance.sentence,
      'translation': instance.translation,
      'idSubTopic': instance.idSubTopic,
    };
