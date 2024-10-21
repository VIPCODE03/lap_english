import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/vocabulary_bloc.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_vocabulary.dart';


class MenuVocabularyScreen extends StatelessWidget {
  const MenuVocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Từ vựng theo chủ đề'),
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
              return WdgMenuVocabulary.build(mainTopicList: state.topics);
            }

            return const Center(
                child: Text('Không có dữ liệu'));
          },
        ),
      ),
    );
  }
}

