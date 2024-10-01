
import 'package:flutter/cupertino.dart';
import 'package:lap_english/data/model/vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/vocabulary/vocabulary.dart';

class LearnVocabularyScreen extends StatelessWidget {
  final List<Word> words;
  final int _mode;

  const LearnVocabularyScreen.normal({super.key, required this.words}) : _mode = 1;

  const LearnVocabularyScreen.advanced({super.key, required this.words}) : _mode = 2;

  @override
  Widget build(BuildContext context) {
    if(_mode == 1) {
      return LearnVocabularyWidget(words: words);
    }
    else if(_mode == 2) {
      return LearnVocabularyWidget(words: words);
    }
    else {
      return LearnVocabularyWidget(words: words);
    }
  }
}