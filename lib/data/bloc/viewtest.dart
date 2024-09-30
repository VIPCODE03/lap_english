import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'vocabulary_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Example',
      home: VocabularyPage(),
    );
  }
}

class VocabularyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vocabulary')),
      body: BlocProvider(
        create: (context) => VocabularyBloc()..add(LoadVocabulary()),
        child: BlocBuilder<VocabularyBloc, VocabularyState>(
          builder: (context, state) {
            if (state is VocabularyLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is VocabularyLoaded) {
              return ListView.builder(
                itemCount: state.topics.length,
                itemBuilder: (context, index) {
                  final topic = state.topics[index];
                  return ExpansionTile(
                    title: Text(topic.name),
                    children: topic.subTopics.map((subTopic) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(subTopic.name),
                            subtitle: Text('Số từ: ${subTopic.words.length}'),
                          ),
                          // Hiển thị danh sách từ vựng cho từng chủ đề con
                          ListView.builder(
                            shrinkWrap: true, // Để hiển thị trong ExpansionTile
                            physics: NeverScrollableScrollPhysics(), // Không cho phép cuộn
                            itemCount: subTopic.words.length,
                            itemBuilder: (context, wordIndex) {
                              final word = subTopic.words[wordIndex];
                              return ListTile(
                                title: Text(word.word),
                                subtitle: Text('Ý nghĩa: ${word.meaning}'),
                              );
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  );
                },
              );
            } else if (state is VocabularyError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('Press the button to load vocabulary.'));
          },
        ),
      ),
    );
  }
}