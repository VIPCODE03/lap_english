import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task/task.dart';
import 'package:lap_english/data/model/user/cumulative_point.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/data/model/user/title.dart';

part 'user.g.dart';

/*  Người dùng  */
@JsonSerializable(explicitToJson: true)
class User {
  final String email;
  String name;
  String? avatar;

  final Skill skills;
  final List<Title> titles;
  final CumulativePoint cumulativePoint;
  final Task task;

  User({
    required this.name,
    required this.email,
    this.avatar,
    required this.skills,
    required this.titles,
    required this.cumulativePoint,
    required this.task,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
