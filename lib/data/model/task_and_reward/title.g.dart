// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlTitle _$MdlTitleFromJson(Map<String, dynamic> json) => MdlTitle(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      task: MdlTask.fromJson(json['task'] as Map<String, dynamic>),
      award: Reward.fromJson(json['award'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MdlTitleToJson(MdlTitle instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'task': instance.task.toJson(),
      'award': instance.award.toJson(),
    };
