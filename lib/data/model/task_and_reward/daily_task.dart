import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task_and_reward/reward.dart';
import 'package:lap_english/data/model/task_and_reward/task.dart';

import '../../provider/task_provider.dart';

part 'daily_task.g.dart';

@JsonSerializable()
class MdlDailyTask {
  MdlTask task;
  Reward reward;

  MdlDailyTask(
      this.task,
      this.reward,
      );

  factory MdlDailyTask.fromJson(Map<String, dynamic> json) => _$MdlDailyTaskFromJson(json);

  Map<String, dynamic> toJson() => _$MdlDailyTaskToJson(this);

  //=== Tạo nhiệm vụ mới  ===
  static List<MdlDailyTask> create() {
    List<MdlTask> tasks = TaskProvider.createDailyTask();
    return tasks.map((task) => MdlDailyTask(
        task,
        Reward(
            quantity: Random().nextInt(16).clamp(5, 15),
            rewardType: RewardType.gold,
            isRewardClaimed: false
        ))
    ).toList();
  }
}