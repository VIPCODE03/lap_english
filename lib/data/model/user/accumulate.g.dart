// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accumulate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlAccumulate _$MdlAccumulateFromJson(Map<String, dynamic> json) =>
    MdlAccumulate(
      (json['words'] as num).toInt(),
      (json['sentences'] as num).toInt(),
      (json['titles'] as num).toInt(),
      (json['daysLearned'] as num).toInt(),
    );

Map<String, dynamic> _$MdlAccumulateToJson(MdlAccumulate instance) =>
    <String, dynamic>{
      'words': instance.words,
      'daysLearned': instance.daysLearned,
      'sentences': instance.sentences,
      'titles': instance.titles,
    };
