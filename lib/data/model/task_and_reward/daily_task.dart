import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task_and_reward/reward.dart';
import 'package:lap_english/data/model/task_and_reward/task.dart';

part 'daily_task.g.dart';

@JsonSerializable()
class MdlDailyTask {
  final int id;
  final MdlTask task;
  final Reward reward;

  MdlDailyTask(this.id, this.task, this.reward);

  factory MdlDailyTask.fromJson(Map<String, dynamic> json) => _$MdlDailyTaskFromJson(json);

  Map<String, dynamic> toJson() => _$MdlDailyTaskToJson(this);
}