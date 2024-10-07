import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/bloc/sentence_bloc.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_sentence.dart';

class MenuSentenceScreen extends StatelessWidget {
  const MenuSentenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Câu theo chủ đề'),
      ),
      body: BlocProvider(
        create: (context) => SentenceBloc()..add(LoadSentence()),
        child: BlocBuilder<SentenceBloc, SentenceState>(
          builder: (context, state) {
            if (state is SentenceLoading) {
              ///Progress Bar --------------------------------------------------
              return const Center(child: CircularProgressIndicator());
            } else if (state is SentenceLoaded) {
              ///ListViewSentence ---------------------------------------------
              return MenuSentence.builder(mainTopicList: state.topics);
            }

            return const Center(
                child: Text('Không có dữ liệu'));
          },
        ),
      ),
    );
  }
}
