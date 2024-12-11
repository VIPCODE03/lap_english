
import 'package:lap_english/data/model/learn/status.dart';

import '../model/learn/sentence.dart';
import '../model/learn/vocabulary.dart';

class ModelEmptyProvider {

  static MdlUnlockStatusManager status() => MdlUnlockStatusManager(gold: 0, diamond: 0, locked: true);
  static MdlSubSentenceTopic subSentenceTopic() => MdlSubSentenceTopic(0, "", "", 0, status());
  static MdlMainSentenceTopic mainSentenceTopic() => MdlMainSentenceTopic(0, '', status());
  static MdlSentence sentence() => MdlSentence(0, '', '', 0);

  static MdlMainVocabularyTopic mainVocabularyTopic() => MdlMainVocabularyTopic(0, "", status());
  static MdlSubVocabularyTopic subVocabularyTopic() => MdlSubVocabularyTopic(0, "", "", 0, status());
  static MdlWord word() => MdlWord(0, '', '', '', '', '', '', '', 0);
}