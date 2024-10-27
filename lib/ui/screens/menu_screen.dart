import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_sentence.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_vocabulary.dart';

import '../../data/bloc/data_bloc/data_bloc.dart';

class MenuScreen<T> extends StatelessWidget {
  final String title;
  const MenuScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => DataBloc<T>()..add(DataEventLoad<T>()),
        child: BlocBuilder<DataBloc<T>, DataState<T>>(
          builder: (context, state) {
            if (state is DataStateLoading<T>) {
              /// Progress Bar  --------------------------------------------------
              return const Center(child: CircularProgressIndicator());
            } else if (state is DataStateLoaded<T>) {
              /// Menu câu  -----------------------------------------------------
              if (T == MainSentenceTopic) {
                return WdgMenuSentence.build(
                    mainTopicList: state.data as List<MainSentenceTopic>
                );

              /// Menu từ vựng  -----------------------------------------------------
              } else if (T == MainVocabularyTopic) {
                return WdgMenuVocabulary.build(
                    mainTopicList:  state.data as List<MainVocabularyTopic>
                );
              }
            }
            return const Center(child: Text('Không có dữ liệu'));
          },
        ),
      ),
    );
  }
}
