/*  Các kĩ năng */
class Skill {
  double reading;
  double writing;
  double speaking;
  double listening;

  Skill(
      this.reading,
      this.writing,
      this.listening,
      this.speaking
      );

  static String skillName(SkillType skillType) {
    switch(skillType) {
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
  speaking,
}

