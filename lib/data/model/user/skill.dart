import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skills {
  double reading;
  double writing;
  double speaking;
  double listening;

  Skills(this.reading, this.writing, this.listening, this.speaking);

  factory Skills.fromJson(Map<String, dynamic> json) => _$SkillsFromJson(json);

  Map<String, dynamic> toJson() => _$SkillsToJson(this);

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

enum SkillType {
  reading,
  writing,
  listening,
  speaking
}
