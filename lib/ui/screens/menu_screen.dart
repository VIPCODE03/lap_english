import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/grammar.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_grammar.dart';
import 'package:lap_english/ui/widgets/learn/menu/menu_word_and_sentence.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../bloc/data_bloc/data_bloc.dart';

class MenuScreen<T> extends StatefulWidget {
  final String title;
  final Type? args;
  const MenuScreen({super.key, required this.title, this.args});

  @override
  State<MenuScreen<T>> createState() => _MenuScreenState<T>();
}

class _MenuScreenState<T> extends State<MenuScreen<T>> {
  bool _isLoading = false;
  String search = "";
  bool _isSearching = false;
  late List<T> datas = [];
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    hasChanged.addListener(_updateScreen);
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(_updateScreen);
  }

  _updateScreen() {
    setState(() {});
  }

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
          style: TextStyle(fontSize: textSize.medium),
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
      body: BlocProvider(
          create: (context) => DataBloc<T>()..add(DataEventLoad<T>(args: widget.args)),
          child: BlocBuilder<DataBloc<T>, DataState>(
            builder: (context, state) {
              if (state is DataStateLoading<T>) {
                return const WdgLoading();

              } else if (state is DataStateLoaded<T>) {
                _isLoading = false;
                datas = state.data;
                if (datas.isEmpty) {
                  return const Center(child: Text('Không có dữ liệu'));
                }

                return RefreshIndicator(
                    color: VipColors.primary(context),
                    backgroundColor: VipColors.onPrimary(context),
                    onRefresh: () async {
                      if(!_isLoading) {
                        _isLoading = true;
                        context.read<DataBloc<T>>().add(DataEventLoad<T>(args: widget.args));
                      }
                    },
                    child: _buildMenu(_datas(), search)
                );
              }

              return const Center(child: Text('Đã xảy ra lỗi'));
            },
          ),
      ),
    );
  }

  Widget _buildMenu(List<T> datas, String search) {
    if (T == MainTopic) {
      if(widget.args == Word) {
        return WdgMenuVW<Word>(mainTopicList: datas as List<MainTopic>);
      }
      else {
        return WdgMenuVW<Sentence>(mainTopicList: datas as List<MainTopic>);
      }
    }
    else if (T == TypeGrammar) {
      return WdgMenuGrammar(typeGrammars: datas as List<TypeGrammar>);
    } else {
      throw Exception('Không tìm thấy loại menu');
    }
  }

  //=== Hàm lọc dữ liệu ===
  List<T> _datas() {
    if (datas is List<MainTopic>) {
      return (datas as List<MainTopic>)
          .where((data) => data.name.toLowerCase().contains(search.toLowerCase())
            && (!data.status.locked || data.status.diamond == 0 && data.status.gold == 0))
          .toList() as List<T>;
    } else if (datas is List<TypeGrammar>) {
      return datas;
    }
    return <T>[];
  }
}

