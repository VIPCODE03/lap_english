
/*  Chủ đề chính  */
class MainVocabularyTopic {
  int id;
  String name;
  List<SubVocabularyTopic> subTopics;

  MainVocabularyTopic(this.id, this.name, this.subTopics);
}

/*  Chủ đề con  */
class SubVocabularyTopic {
  int id;
  String name;
  List<Word> words;

  SubVocabularyTopic(this.id, this.name, this.words);
}

/*  Từ vựng   */
class Word {
  int id;
  String word;
  String meaning;
  String pronounceUK;
  String pronounceUS;
  String type;
  String level;
  List<String> examples;

  Word(this.id, this.word, this.meaning, this.pronounceUK, this.pronounceUS,
      this.type, this.level, this.examples);
}