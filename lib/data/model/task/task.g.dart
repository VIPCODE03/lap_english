// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      rollCall: RollCall.fromJson(json['rollCall'] as Map<String, dynamic>),
      dailyTasks: (json['dailyTasks'] as List<dynamic>)
          .map((e) => DailyTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'dailyTasks': instance.dailyTasks.map((e) => e.toJson()).toList(),
      'rollCall': instance.rollCall.toJson(),
    };
