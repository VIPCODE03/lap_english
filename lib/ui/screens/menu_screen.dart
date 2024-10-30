import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_sentence.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_vocabulary.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

import '../../data/bloc/data_bloc/data_bloc.dart';

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
      _isSearching = !_isSearching;
      if (!_isSearching) search = "";
    });
  }

  void _onSearch() {
    setState(() {
      search = _searchController.text;
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          maxLines: 1,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Tìm kiếm...',
            border: InputBorder.none,
          ),
          onSubmitted: (_) => _onSearch(),
        )
            : Text(search.isEmpty ? widget.title : search),
        actions: [
          WdgButton(
            onTap: _toggleSearch,
            color: Colors.transparent,
            child: Icon(_isSearching ? Icons.close : Icons.search),
          ),
          if (_isSearching)
            WdgButton(
              onTap: _onSearch,
              color: Colors.transparent,
              child: const Icon(Icons.check),
            ),
        ],
      ),

      body: GestureDetector(
        onTap: () {
          if (_isSearching) _toggleSearch();
        },
        child: BlocProvider(
          create: (context) => DataBloc<T>()..add(DataEventLoad<T>()),
          child: BlocBuilder<DataBloc<T>, DataState<T>>(
            builder: (context, state) {
              if (state is DataStateLoading<T>) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DataStateLoaded<T>) {
                datas = state.data;
                return _buildMenu(datas, search); ///-> menu
              }
              return const Center(child: Text('Không có dữ liệu'));
            },
          ),
        ),
      ),
    );
  }

  /// Xây dựng menu   ------------------------------------------------------
  Widget _buildMenu(List<T> datas, String search) {

    /// Menu câu  ------------------------------------------------------
    if (T == MainSentenceTopic) {
      final mainTopicList = datas as List<MainSentenceTopic>;
      return search.isEmpty
          ? WdgMenuSentence.build(mainTopicList: mainTopicList)
          : WdgMenuSentence.search(search: search, mainTopicList: mainTopicList);

    /// Menu từ vựng  ------------------------------------------------------
    } else if (T == MainVocabularyTopic) {
      final mainTopicList = datas as List<MainVocabularyTopic>;
      return search.isEmpty
          ? WdgMenuVocabulary.build(mainTopicList: mainTopicList)
          : WdgMenuVocabulary.search(search: search, mainTopicList: mainTopicList);

    /// Không có dữ liệu  --------------------------------------------------
    } else {
      return const Center(child: Text('Không có dữ liệu'));
    }
  }
}
