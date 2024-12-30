import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/data/model/learn/word_sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/dialogs/dialog_widget.dart';
import 'package:lap_english/ui/screens/learn_screens/flip_card_screen.dart';
import 'package:lap_english/ui/widgets/other/group.dart';
import 'package:lap_english/ui/widgets/learn/other/status_widget.dart';
import 'package:lap_english/ui/widgets/other/loading.dart';
import 'package:lap_english/ui/widgets/other/loading_item.dart';
import 'package:lap_english/utils/loaddata_link.dart';
import 'package:lap_english/utils/player_audio.dart';
import '../../../../bloc/data_bloc/data_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/text_to_speak.dart';
import '../../../screens/learn_screens/quizz_screen.dart';
import '../../../themes/size.dart';
import '../../other/button.dart';

class WdgMenuVW<T> extends StatefulWidget {
  final List<MainTopic> mainTopicList;

  const WdgMenuVW({super.key, required this.mainTopicList});

  @override
  State<StatefulWidget> createState() => _WdgMenuVWState<T>();
}

class _WdgMenuVWState<T> extends State<WdgMenuVW<T>> {
  final textToSpeakUtil = TextToSpeakUtil();
  final Map<int, List<SubTopic>> subTopicList = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.mainTopicList.length,
        itemBuilder: (context, index) {
          return _buildItemMain(context, widget.mainTopicList[index], index);
        }
    );
  }

  ///ITEM chủ đề chính  --------------------------------------------------------
  Widget _buildItemMain(BuildContext context, MainTopic mainTopic, int index) {
    return WdgStatusLock<MainTopic>(
        item: mainTopic,
        status: mainTopic.status,
        child: WdgGroup(
          title: mainTopic.name,
          height: 1,
          opacity: 1,
          child: SizedBox(
            height: 150,
            child: subTopicList.containsKey(mainTopic.id)
                ? _buildListItemSub(subTopicList[mainTopic.id]!)
                : BlocProvider(
                create: (context) => DataBloc<SubTopic>()..add(DataEventLoad<SubTopic>(args: mainTopic.id)),
                child: Builder(builder: (context) {
                  return BlocBuilder<DataBloc<SubTopic>, DataState>(
                    builder: (context, state) {
                      if (state is DataStateLoading) {//-> Đang tải dữ liệu
                        return _itemLoadingSub();

                      } else if (state is DataStateLoaded<SubTopic>) {//-> Đã tải xong dữ liệu
                        var subTopics = state.data;
                        _sortSubTopics(subTopics);
                        subTopicList[mainTopic.id] = subTopics;
                        return _buildListItemSub(subTopics);
                      }

                      return const Center(child: Text('Không có dữ liệu'));
                    },
                  );
                },
                )
            )
          )
        )
    );
  }

  ///ITEM danh sách chủ đề con  ----------------------------------------------------------
  Widget _buildListItemSub(List<SubTopic> subTopicList) {
    return GridView.builder(
      key: UniqueKey(),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
      ),
      itemCount: subTopicList.length,
      itemBuilder: (context, index) {
        return Align(
            alignment: Alignment.topCenter,
            child: _buildItemSub(context, subTopicList[index]));
      },
    );
  }

  ///ITEM chủ đề con  ----------------------------------------------------------
  Widget _buildItemSub(BuildContext context, SubTopic subTopic) {
    return WdgStatusLock<SubTopic>(
      item: subTopic,
      status: subTopic.status,
      child: WdgButton(
          color: Colors.transparent,
          onTap: () => _showDialogWordList(context, subTopic),
          child: Column(
            children: [
              Stack(
                children: [
                  ///ẢNH tải từ server  --------------------------------------------------
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 2,
                              color: subTopic.isLearned
                                  ? VipColors.primary(context)
                                  : VipColors.onPrimary(context))
                      ),
                      child: Image.network(
                        LoadDataUtil.loadImage(subTopic.imageUrl ?? ''),
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            Assets.images.dinosaur.dinosaurLearn.path,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          );
                        },
                      ),
                    ),
                  ),

                  ///ICON hoàn thành  ------------------------------------------------
                  Positioned(
                    right: 0,
                    top: 0,
                    child: subTopic.isLearned
                        ? Icon(Icons.check_circle_outline, color: VipColors.primary(context), size: 18)
                        : const SizedBox.shrink(),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              ///TEXT tên chủ đề con ----------------------------------------------------------
              Text(subTopic.name,
                  style: TextStyle(fontSize: textSize.normal),
                  maxLines: 2,
                  textAlign: TextAlign.center),
            ],
          )
      ),
    );
  }

  /// ITEM loading subtopic ----------------------------------------------------------
  Widget _itemLoadingSub() {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                WdgItemLoading(
                  child: SizedBox(height: 60, width: 60),
                ),

                WdgItemLoading(
                  child: Text('loading...'),
                )
              ],
            ));
      },
    );
  }

  ///DIALOG hiển thị danh sách từ vựng hoặc câu ------------------------------------------
  void _showDialogWordList(BuildContext parentContext, SubTopic subTopic) {
    List<T> datas = [];
    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return WdgDialog(
            color: Colors.transparent,
            title: null,
            content: BlocProvider(
                create: (context) => DataBloc<T>()..add(DataEventLoad<T>(args: subTopic.id)),
                child: Container(
                  height: isPortrait ? maxHeight * 0.66 : maxHeight * 0.8,
                  width: maxWidth / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).cardColor
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Ảnh bìa giấy  -------------------------------------------
                      Image(
                        width: maxWidth,
                        repeat: ImageRepeat.repeat,
                        height: 30,
                        image: Assets.images.cover.headbock.provider(),
                      ),

                      /// Danh sách từ vựng hoặc câu ------------------------------------------
                      Expanded(
                        child: BlocBuilder<DataBloc<T>, DataState>(
                          builder: (context, state) {
                            if (state is DataStateLoading<T>) {
                              return const WdgLoading();

                            } else if (state is DataStateLoaded<T>) {//-> Trạng thái tải xong dữ liệu
                              datas = state.data;
                              return ListView.builder(
                                itemCount: datas.length,
                                itemBuilder: (context, index) {
                                  var data = datas[index];
                                  return _ItemWidget(data: data);
                                },
                              );
                            }

                            return const Center(child: Text('Không có dữ liệu'));
                          },
                        ),
                      ),

                      /// Button học bài  --------------------------------------------------
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (T == Word)
                              WdgButton(
                                color: Colors.transparent,
                                onTap: () {
                                  if(datas.isNotEmpty) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return FlipCardsScreen(words: datas as List<Word>);
                                    }));
                                  }
                                },
                                child: Text('Thẻ ghi nhớ',
                                  style: TextStyle(
                                      fontSize: textSize.medium,
                                      color: VipColors.primary(context)
                                  ),
                                ),
                              ),

                            WdgButton(
                              onTap: () async {
                                if (datas.isNotEmpty) {
                                  Navigator.pop(context); //-> Đóng dialog
                                  var result = await Navigator.push(//-> Mở quizz
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      switch (datas) {
                                        case List<Word> _:
                                          return QuizzScreen.vocabulary(words: (datas as List<Word>), subTopic: subTopic);
                                        case List<Sentence> _:
                                          return QuizzScreen.sentence(sentences: (datas as List<Sentence>), subTopic: subTopic);
                                        default:
                                          return const Center(child: Text('No data available or unsupported type.'));
                                      }
                                    }),
                                  );

                                  if(result is QuizzResult) {
                                    setState(() {});
                                  }
                                }
                              },
                              color: Colors.transparent,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    subTopic.isLearned ? 'Ôn tập' : 'Học bài mới',
                                    style: TextStyle(
                                        fontSize: textSize.medium,
                                        color: VipColors.primary(context)
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_double_arrow_right,
                                    color: VipColors.primary(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
        );
      },
    );
  }

  //=== Sắp xếp danh sách chủ đề con  ===
  void _sortSubTopics(List<SubTopic> subList) {
    subList.sort((a, b) {
      int aPriority = (!a.isLearned && !a.status.isLocked)
          ? 0 : a.isLearned ? 2 : 1;
      int bPriority = (!b.isLearned && !b.status.isLocked)
          ? 0 : b.isLearned ? 2 : 1;
      return aPriority.compareTo(bPriority);
    });
  }
}

///ITEM từ vựng hoặc câu   -----------------------------------------------------------
class _ItemWidget<T> extends StatefulWidget {
  final T data;

  const _ItemWidget({required this.data});

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<_ItemWidget> {
  late ExpansionTileController controller;

  String textW = "";
  String textMeaning = "";
  String textExpaned = "";
  String soundUrl = "";

  @override
  void initState() {
    super.initState();
    controller = ExpansionTileController();

    switch (widget.data) {
      case Word _: {
        textW = widget.data.word;
        textMeaning = widget.data.meaning;
        textExpaned = "Loại: ${widget.data.type}m \nUS: ${widget.data.pronounceUS} \nUK: ${widget.data.pronounceUK} \nVí dụ: ${widget.data.example}";
        soundUrl = (Random().nextBool() ? widget.data.audioUsBlobName : widget.data.audioUkBlobName) ?? "";
        break;
      }
      case Sentence _: {
        textW = widget.data.sentence;
        textMeaning = widget.data.translation;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          controller: controller,
          showTrailingIcon: false,
          shape: Border.all(width: 0),
          expansionAnimationStyle: AnimationStyle(
            curve: Curves.easeOutSine,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WdgButton(
                color: Colors.transparent,
                onTap: () {
                  if (soundUrl.isNotEmpty) {
                    AudioPlayerUtil().playFromUrl(LoadDataUtil.loadSound(soundUrl));
                  } else {
                    TextToSpeakUtil().speak(textW, TextToSpeakUtil.languageUK, TextToSpeakUtil.rateNormal);
                  }
                },
                child: const Icon(Icons.volume_up, size: 30, color: Colors.grey),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textW,
                    style: TextStyle(fontSize: textSize.medium, color: VipColors.text(context)),
                  ),
                  Text(
                    textMeaning,
                    style: TextStyle(color: Colors.grey, fontSize: textSize.normal),
                  ),
                ],
              ),
            ],
          ),
          children: [
            GestureDetector(
              onTap: () => controller.collapse(),
              child: Container(
                color: Colors.transparent,
                width: maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.topLeft,
                child: Text(textExpaned, style: TextStyle(color: Colors.grey, fontSize: textSize.normal)),
              ),
            ),
          ],
        ),
        Container(
          color: Colors.grey,
          height: 1,
        ),
      ],
    );
  }
}

