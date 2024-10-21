import 'package:lap_english/data/model/skill.dart';
import 'package:lap_english/data/model/title.dart';

/*  Người dùng  */
class User {
  late final int id;
  late final String name;
  final String email;
  final String password;
  late final int age;

  late final Skill skills;
  late final List<Title> titles;

  User(
      this.id,
      this.name,
      this.email,
      this.password,
      this.age,
      this.skills,
      this.titles,
      );

  User.local(this.email, this.password);
}