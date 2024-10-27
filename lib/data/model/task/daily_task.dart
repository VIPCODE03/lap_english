
import 'package:json_annotation/json_annotation.dart';

import '../reward.dart';

part 'daily_task.g.dart';

@JsonSerializable()
class DailyTask {
  final int taskId;
  final String description;
  int progress;
  int total;
  Reward reward;

  DailyTask(
      this.taskId,
      this.description,
      this.progress,
      this.total,
      this.reward,
      );

  factory DailyTask.fromJson(Map<String, dynamic> json) => _$DailyTaskFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTaskToJson(this);
}