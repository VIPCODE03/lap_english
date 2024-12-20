// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skills _$SkillsFromJson(Map<String, dynamic> json) => Skills(
      (json['reading'] as num).toDouble(),
      (json['writing'] as num).toDouble(),
      (json['listening'] as num).toDouble(),
      (json['speaking'] as num).toDouble(),
    );

Map<String, dynamic> _$SkillsToJson(Skills instance) => <String, dynamic>{
      'reading': instance.reading,
      'writing': instance.writing,
      'speaking': instance.speaking,
      'listening': instance.listening,
    };
