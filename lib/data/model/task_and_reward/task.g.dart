// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MdlTask _$MdlTaskFromJson(Map<String, dynamic> json) => MdlTask(
      description: json['description'] as String,
      progress: (json['progress'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      completed: json['completed'] as bool,
      type: $enumDecode(_$TypeTaskEnumMap, json['type']),
      keyFunUpdate: json['keyFunUpdate'] as String,
    );

Map<String, dynamic> _$MdlTaskToJson(MdlTask instance) => <String, dynamic>{
      'description': instance.description,
      'progress': instance.progress,
      'total': instance.total,
      'completed': instance.completed,
      'type': _$TypeTaskEnumMap[instance.type]!,
      'keyFunUpdate': instance.keyFunUpdate,
    };

const _$TypeTaskEnumMap = {
  TypeTask.taskQuizz: 'taskQuizz',
  TypeTask.taskTitle: 'taskTitle',
  TypeTask.taskLogin: 'taskLogin',
};
