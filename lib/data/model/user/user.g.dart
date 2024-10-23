// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['email'] as String,
      json['password'] as String,
      (json['age'] as num).toInt(),
      Skill.fromJson(json['skills'] as Map<String, dynamic>),
      (json['titles'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
      CumulativePoint.fromJson(json['cumulativePoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'skills': instance.skills.toJson(),
      'titles': instance.titles.map((e) => e.toJson()).toList(),
      'cumulativePoint': instance.cumulativePoint.toJson(),
    };
