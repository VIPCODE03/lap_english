import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_grammar.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_word_and_sentence.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../bloc/data_bloc/data_bloc.dart';

class MenuScreen<T> extends StatefulWidget {
  final String title;
  const MenuScreen({super.key, required this.title});

  @override
  State<MenuScreen<T>> createState() => _MenuScreenState<T>();
}

class _MenuScreenState<T> extends State<MenuScreen<T>> {
  String search = "";
  bool _isSearching = false;
  late List<T> datas = [];

  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      if (_isSearching) search = "";
      _isSearching = !_isSearching;
    });
  }

  void _onSearch() {
    setState(() {
      search = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
      appBar: WdgAppBar(
        title: !_isSearching ? (search.isEmpty ? widget.title : search) : null,
        content: _isSearching
            ? TextField(
          controller: _searchController,
          maxLines: 1,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Tìm kiếm...',
            border: InputBorder.none,
          ),
          onChanged: (_) => _onSearch(),
        )
            : null,

        actions: [
          WdgButton(
            onTap: _toggleSearch,
            color: Colors.transparent,
            child: Icon(_isSearching ? Icons.close : Icons.search),
          ),

        ],
      ),

      body: datas.isNotEmpty
            ? _buildMenu(_datas(), search)
            : BlocProvider(
                create: (context) => DataBloc<T>()..add(DataEventLoad<T>()),
                child: BlocBuilder<DataBloc<T>, DataState>(
                  builder: (context, state) {
                    if (state is DataStateLoading<T>) {
                      return const Center(child: CircularProgressIndicator());

                    } else if (state is DataStateLoaded<T>) {
                      datas = state.data;
                      if(datas.isEmpty) {
                        return const Center(child: Text('Không có dữ liệu'));
                      }
                      return _buildMenu(_datas(), search); ///-> menu

                    } else if(state is DataStateError<T>) {
                      return const Center(child: Text('Không có dữ liệu'));
                    }

                    return const SizedBox.shrink();
                  },
                ),
        ),
    );
  }

  /// Xây dựng menu   ------------------------------------------------------
  Widget _buildMenu(List<T> datas, String search) {
    /// Menu từ vựng  ------------------------------------------------------
    if (T == MdlMainVocabularyTopic) {
      return WdgMenuVW<MdlMainVocabularyTopic, MdlSubVocabularyTopic, MdlWord>(
          mainTopics: datas as List<MdlMainVocabularyTopic>
      );
    }

    /// Menu câu  ------------------------------------------------------
    else if(T == MdlMainSentenceTopic) {
      return WdgMenuVW<MdlMainSentenceTopic, MdlSubSentenceTopic, MdlSentence>
        (mainTopics: datas as List<MdlMainSentenceTopic>
      );
    }

    /// Menu câu  ------------------------------------------------------
    else if(T == MdlMainSentenceTopic) {
      return WdgMenuVW<MdlMainSentenceTopic, MdlSubSentenceTopic, MdlSentence>
        (mainTopics: datas as List<MdlMainSentenceTopic>
      );
    }

    /// Menu ngữ pháp  ------------------------------------------------------
    else if(T == TypeGrammar) {
      return WdgMenuGrammar(typeGrammars: datas as List<TypeGrammar>);
    }

    else {
      throw Exception('Không tìm thấy loại menu');
    }
  }

  //=== Hàm lọc dữ liệu ===
  List<T> _datas() {
    if (datas is List<MdlMainSentenceTopic>) {
      return (datas as List<MdlMainSentenceTopic>)
          .where((data) => data.name.toLowerCase().contains(search.toLowerCase()))
          .toList() as List<T>;
    }
    else if (datas is List<MdlMainVocabularyTopic>) {
      return (datas as List<MdlMainVocabularyTopic>)
          .where((data) => data.name.toLowerCase().contains(search.toLowerCase()))
          .toList() as List<T>;
    }

    else if(datas is List<TypeGrammar>) {
      return datas;
    }

    return <T>[];
  }
}
