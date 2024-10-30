// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTask _$DailyTaskFromJson(Map<String, dynamic> json) => DailyTask(
      (json['taskId'] as num).toInt(),
      json['description'] as String,
      (json['progress'] as num).toInt(),
      (json['total'] as num).toInt(),
      Reward.fromJson(json['reward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyTaskToJson(DailyTask instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'description': instance.description,
      'progress': instance.progress,
      'total': instance.total,
      'reward': instance.reward,
    };
