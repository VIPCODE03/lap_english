import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/vocabulary_bloc.dart';
import 'package:lap_english/ui/widgets/learn/item_learn1.dart';

class LearnVocabularyScreen extends StatelessWidget {
  const LearnVocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Học từ vựng'),
      ),
      body: BlocProvider(
        create: (context) => VocabularyBloc()..add(LoadVocabulary()),
        child: BlocBuilder<VocabularyBloc, VocabularyState>(
          builder: (context, state) {

            if (state is VocabularyLoading) {
              ///Progress Bar --------------------------------------------------
              return const Center(child: CircularProgressIndicator());

            } else if (state is VocabularyLoaded) {
              ///ListViewVocabulary --------------------------------------------
              return ListViewVocabulary.builder(mainTopicList: state.topics);
            }

            return const Center(
                child: Text('Press the button to load vocabulary.'));
          },
        ),
      ),
    );
  }
}
