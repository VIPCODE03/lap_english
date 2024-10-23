import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/user/cumulative_point.dart';
import 'package:lap_english/data/model/user/skill.dart';
import 'package:lap_english/data/model/user/title.dart';

part 'user.g.dart';

/*  Người dùng  */
@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final int age;

  final Skill skills;
  final List<Title> titles;
  final CumulativePoint cumulativePoint;

  User(
      this.id,
      this.name,
      this.email,
      this.password,
      this.age,
      this.skills,
      this.titles,
      this.cumulativePoint);

  User.local(this.email, this.password)
      : id = 0,
        name = '',
        age = 0,
        skills = Skill(0.0, 0.0, 0.0, 0.0),
        titles = [],
        cumulativePoint = CumulativePoint(0, 0);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
