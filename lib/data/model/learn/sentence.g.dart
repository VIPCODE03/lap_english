// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainSentenceTopic _$MainSentenceTopicFromJson(Map<String, dynamic> json) =>
    MainSentenceTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['subSentenceTopics'] as List<dynamic>)
          .map((e) => SubSentenceTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainSentenceTopicToJson(MainSentenceTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subSentenceTopics': instance.subSentenceTopics,
    };

SubSentenceTopic _$SubSentenceTopicFromJson(Map<String, dynamic> json) =>
    SubSentenceTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imageUrl'] as String,
      (json['sentences'] as List<dynamic>)
          .map((e) => Sentence.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubSentenceTopicToJson(SubSentenceTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'sentences': instance.sentences,
    };

Sentence _$SentenceFromJson(Map<String, dynamic> json) => Sentence(
      (json['id'] as num).toInt(),
      json['sentence'] as String,
      json['translation'] as String,
    );

Map<String, dynamic> _$SentenceToJson(Sentence instance) => <String, dynamic>{
      'id': instance.id,
      'sentence': instance.sentence,
      'translation': instance.translation,
    };
