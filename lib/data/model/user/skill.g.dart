// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      (json['reading'] as num).toDouble(),
      (json['writing'] as num).toDouble(),
      (json['listening'] as num).toDouble(),
      (json['speaking'] as num).toDouble(),
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'reading': instance.reading,
      'writing': instance.writing,
      'speaking': instance.speaking,
      'listening': instance.listening,
    };
