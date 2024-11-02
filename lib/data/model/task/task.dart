
import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task/daily_task.dart';
import 'package:lap_english/data/model/task/roll_call.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task {
  final List<DailyTask> dailyTasks;
  final RollCall rollCall;

  Task({
    required this.rollCall,
    required this.dailyTasks,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

