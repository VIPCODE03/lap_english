// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlDailyTask _$MdlDailyTaskFromJson(Map<String, dynamic> json) => MdlDailyTask(
      (json['id'] as num).toInt(),
      MdlTask.fromJson(json['task'] as Map<String, dynamic>),
      Reward.fromJson(json['reward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MdlDailyTaskToJson(MdlDailyTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'reward': instance.reward,
    };
