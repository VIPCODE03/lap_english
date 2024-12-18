import 'package:lap_english/data/model/learn/status.dart';
import '../model/learn/word_sentence.dart';

class ModelEmptyProvider {

  static MdlUnlockStatusManager status() => MdlUnlockStatusManager(gold: 0, diamond: 0, locked: true);
  static MainTopic mainSentenceTopic() => MainTopic(0, "", status());
  static MainTopic mainVocabularyTopic() => MainTopic(0, "", status());
  static Sentence sentence() => Sentence(0, '', '', 0);
  static SubTopic subTopic() => SubTopic(0, "", "", 0, status());
  static Word word() => Word(0, '', '', '', '', '', '', '', 0);
}