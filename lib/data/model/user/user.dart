import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/task/task.dart';
import 'package:lap_english/data/model/user/cumulative_point.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/data/model/user/title.dart';

part 'user.g.dart';

/*  Người dùng  */
@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String email;
  String password;
  String name;
  int age;

  final Skill skills;
  final List<Title> titles;
  final CumulativePoint cumulativePoint;
  final Task task;

  User(
      this.id,
      this.name,
      this.email,
      this.password,
      this.age,
      this.skills,
      this.titles,
      this.cumulativePoint,
      this.task
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
