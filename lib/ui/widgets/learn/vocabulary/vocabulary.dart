import 'package:flutter/material.dart';

import '../../../../data/model/vocabulary.dart';

class LearnVocabularyWidget extends StatefulWidget {
  final List<Word> words;

  const LearnVocabularyWidget({super.key, required this.words});

  @override
  State<StatefulWidget> createState() => _LearnVocabularyWidgetState();

}

class _LearnVocabularyWidgetState extends State<LearnVocabularyWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Học Từ Vựng'),
      ),
      body: ListView.builder(
        itemCount: widget.words.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.words[index].toJson().toString()),
          );
        },
      ),
    );
  }

}
