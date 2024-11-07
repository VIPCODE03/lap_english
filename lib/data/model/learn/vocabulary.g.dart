// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainVocabularyTopic _$MainVocabularyTopicFromJson(Map<String, dynamic> json) =>
    MainVocabularyTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['subTopics'] as List<dynamic>)
          .map((e) => SubVocabularyTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainVocabularyTopicToJson(
        MainVocabularyTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subTopics': instance.subTopics,
    };

SubVocabularyTopic _$SubVocabularyTopicFromJson(Map<String, dynamic> json) =>
    SubVocabularyTopic(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['imageUrl'] as String,
      (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$SubVocabularyTopicToJson(SubVocabularyTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'words': instance.words,
      'isLearned': instance.isLearned,
    };

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      (json['id'] as num).toInt(),
      json['word'] as String,
      json['meaning'] as String,
      json['pronounceUK'] as String,
      json['pronounceUS'] as String,
      json['type'] as String,
      json['level'] as String,
      (json['examples'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'meaning': instance.meaning,
      'pronounceUK': instance.pronounceUK,
      'pronounceUS': instance.pronounceUS,
      'type': instance.type,
      'level': instance.level,
      'examples': instance.examples,
    };
