
/*  Chủ đề chính  */
class MainSentenceTopic {
  int id;
  String name;
  List<SubSentenceTopic> subSentenceTopics;

  MainSentenceTopic(this.id, this.name, this.subSentenceTopics);
}

/*  Chủ đề con  */
class SubSentenceTopic {
  int id;
  String name;
  List<Sentence> sentences;

  SubSentenceTopic(this.id, this.name, this.sentences);
}

/*  Câu   */
class Sentence {
  int id;
  String sentence;
  String translation;

  Sentence(this.id, this.sentence, this.translation);
}