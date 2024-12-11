import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task_and_reward/daily_task.dart';
import 'package:lap_english/data/model/user/accumulate.dart';
import 'package:lap_english/data/model/user/cumulative_point.dart';
import 'package:lap_english/data/model/user/skill.dart';
import '../task_and_reward/title.dart';

part 'user.g.dart';

/*  Người dùng  */
@JsonSerializable(explicitToJson: true)
class User {
  final String email;
  String name;
  String? avatar;

  final Skill skills;
  final List<MdlTitle> titles;
  final List<MdlDailyTask> dailyTasks;
  final CumulativePoint cumulativePoint;
  final MdlAccumulate accumulate;

  User({
    required this.name,
    required this.email,
    this.avatar,
    required this.skills,
    required this.titles,
    required this.dailyTasks,
    required this.cumulativePoint,
    required this.accumulate,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
