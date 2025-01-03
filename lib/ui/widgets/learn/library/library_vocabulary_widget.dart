import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/services/bot.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/learn/other/status_widget.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lap_english/ui/widgets/other/loading_item.dart';

import '../../../../gen/assets.gen.dart';

class WdgLibraryMainTopic<T> extends StatefulWidget {
  const WdgLibraryMainTopic({super.key});

  @override
  State<StatefulWidget> createState() => _WdgLibraryVocabularyState<T>();
}

class _WdgLibraryVocabularyState<T> extends State<WdgLibraryMainTopic<T>> with AutomaticKeepAliveClientMixin {
  final List<MainTopic> suggests = [];
  final List<MainTopic> allMainTopic = [];
  bool _isCompleted = false;

  void _suggestAI(List<MainTopic> allMainTopic) async {
    GeminiAI bot = GeminiAI(model: GeminiAI.flash);

    try {
      var textTrain = await rootBundle.loadString(Assets.trainbot.trainSearchVocabulary);
      String mainTopics = '';
      for(var mainTopic in allMainTopic) {
        mainTopics += ' ${mainTopic.id} - ${mainTopic.name}';
      }
      String suggestList = await bot.ask(
          '$textTrain \n'
              'Danh sách chủ đề: $mainTopics '
              'Thông tin user: ${CacheManager().getInfoUser()}')
          ?? '';

      List<int> result = suggestList.split(',').map((e) => int.parse(e.trim())).toList();
      suggests.addAll(allMainTopic.where((element) => result.contains(element.id)));
      allMainTopic.removeWhere((element) => result.contains(element.id));
      setState(() {
        _isCompleted = true;
      });
    }
    catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => DataBloc<MainTopic>()..add(DataEventLoad<MainTopic>(args: T)),
      child: BlocBuilder<DataBloc<MainTopic>, DataState>(
          builder: (context, state) {
        if(state is DataStateLoading) {
          return const WdgLoading();
        }

        else if(state is DataStateLoaded<MainTopic>) {
          if(!_isCompleted) {
            allMainTopic.addAll(state.data.where((mainTopic) => mainTopic.status.locked
                && (mainTopic.status.gold > 0 || mainTopic.status.diamond > 0)).toList());
            _suggestAI(allMainTopic);
            return _itemLoading();
          }
          else {
            return ListView(
              children: [
                _item(context, 'Gợi ý', suggests),

                _item(context, 'Tất cả', allMainTopic)
              ],
            );
          }
        }

        else if(state is DataStateError) {
          return const Center(child: Text('Lỗi tải dữ liệu'));
        }

        return const SizedBox.shrink();
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _item(BuildContext context, String title, List<MainTopic> mainTopicList) {
    return WdgGroup(
      title: title,
      alignment: Alignment.center,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: mainTopicList.map((mainTopic) {
          return Container(
            margin: const EdgeInsets.all(10),
            width: 66,
            child: WdgStatusLock<MainTopic>(
              item: mainTopic,
              status: mainTopic.status,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: VipColors.getRandomColor(context, 66),
                    ),
                  ),
                  Text(
                    mainTopic.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _itemLoading() {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
              width: 66,
              child: WdgItemLoading(),
            ),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(8, (index) {
                return const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 66,
                      width: 66,
                      child: WdgItemLoading(),
                    ),
                    SizedBox(
                      height: 20,
                      width: 66,
                      child: WdgItemLoading(),
                    ),
                  ],
                );
              }),
            )
          ],
        )
      ],
    );
  }
}

class WdgLibrarySentence extends StatelessWidget {
  const WdgLibrarySentence({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('${Random().nextInt(100)}'));
  }
}