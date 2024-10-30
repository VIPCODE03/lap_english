// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      award: Reward.fromJson(json['award'] as Map<String, dynamic>),
      progress: (json['progress'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'award': instance.award.toJson(),
      'progress': instance.progress,
      'total': instance.total,
    };
