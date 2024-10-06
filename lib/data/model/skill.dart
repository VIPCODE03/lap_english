
class Skill {
  static const String speakking = "speakking";
  static const String writing = "writing";
  static const String listening = "listening";
  static const String reading = "reading";

  String skill;
  Skill(this.skill);
}

class Skills {
  static final Skill speakking = Skill(Skill.speakking);
  static final Skill writing = Skill(Skill.writing);
  static final Skill listening = Skill(Skill.listening);
  static final Skill reading = Skill(Skill.reading);
}