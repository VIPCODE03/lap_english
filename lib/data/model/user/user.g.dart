// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      skills: Skill.fromJson(json['skills'] as Map<String, dynamic>),
      titles: (json['titles'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
      cumulativePoint: CumulativePoint.fromJson(
          json['cumulativePoint'] as Map<String, dynamic>),
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'skills': instance.skills.toJson(),
      'titles': instance.titles.map((e) => e.toJson()).toList(),
      'cumulativePoint': instance.cumulativePoint.toJson(),
      'task': instance.task.toJson(),
    };
