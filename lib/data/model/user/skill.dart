import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill {
  final double reading;
  final double writing;
  final double speaking;
  final double listening;

  Skill(this.reading, this.writing, this.listening, this.speaking);

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);

  static String skillName(SkillType skillType) {
    switch (skillType) {
      case SkillType.reading:
        return "Kĩ năng đọc";
      case SkillType.writing:
        return "Kĩ năng viết";
      case SkillType.listening:
        return "Kĩ năng nghe";
      case SkillType.speaking:
        return "Kĩ năng nói";
    }
  }
}

enum SkillType { reading, writing, listening, speaking }
