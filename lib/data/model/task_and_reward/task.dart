import 'package:json_annotation/json_annotation.dart';

import '../../../services/task_service.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class MdlTask {
  final String description;
  double progress;
  final double total;
  bool completed;
  final TypeTask type;
  final String keyFunUpdate;

  MdlTask({
    required this.description,
    required this.progress,
    required this.total,
    required this.completed,
    required this.type,
    required this.keyFunUpdate,
  });

  void updateTask(dynamic data) {
    if (!completed) {
      TaskProvider.funUpdate[keyFunUpdate]!(this, data);
      if(progress == total) completed = true;
    }
  }

  factory MdlTask.fromJson(Map<String, dynamic> json) => _$MdlTaskFromJson(json);

  Map<String, dynamic> toJson() => _$MdlTaskToJson(this);
}

enum TypeTask {
  taskQuizz,
  taskTitle,
  taskLogin,
}

