
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/screens/learn_screens/flip_card_screen.dart';
import 'package:lap_english/ui/widgets/other/group.dart';

import '../../../../bloc/data_bloc/data_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/text_to_speak.dart';
import '../../../screens/learn_screens/quizz_screen.dart';
import '../../other/button.dart';
import '../../other/expandable_view.dart';

class WdgMenuVW<M, S, T> extends StatelessWidget {
  final List<M> _mainTopicList;
  final textToSpeakUtil = TextToSpeakUtil();

  WdgMenuVW({super.key, required List<M> mainTopics})
      : _mainTopicList = mainTopics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _mainTopicList.length,
        itemBuilder: (context, index) {
          return _buildItemMain(context, _mainTopicList[index]);
        }
    );
  }

  ///ITEM chủ đề chính  --------------------------------------------------------
  Widget _buildItemMain(BuildContext context, M mainTopic) {
    int idMainTopic = 0;
    String nameTopic = "";

    switch (mainTopic) {
      case MdlMainVocabularyTopic _: {
        idMainTopic = mainTopic.id;
        nameTopic = mainTopic.name;
        break;
      }

      case MdlMainSentenceTopic _: {
        idMainTopic = mainTopic.id;
        nameTopic = mainTopic.name;
        break;
      }
    }

    return BlocProvider(
      create: (context) => DataBloc<S>()..add(DataEventLoad<S>(args: idMainTopic)),
      child: Builder(
        builder: (context) {
          return WdgGroup(
              title: nameTopic,
              titleStyle: GoogleFonts.pangolin(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: VipColors.text(context),
              ),
              height: 1,
              opacity: 1,
              child: SizedBox(
                height: 150,
                child: BlocBuilder<DataBloc<S>, DataState>(
                  builder: (context, state) {
                    if (state is DataStateLoading) {  //-> Đang tải dữ liệu
                      return const Center(child: CircularProgressIndicator());

                    } else if (state is DataStateLoaded<S>) {//-> Đã tải xong dữ liệu
                      var subTopics = state.data;
                      _sortSubTopics(subTopics);

                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1,
                        ),
                        itemCount: subTopics.length,
                        itemBuilder: (context, index) {
                          return Align(
                              alignment: Alignment.topCenter,
                              child: _buildItemSub(context, subTopics[index])
                          );
                        },
                      );

                    } else if (state is DataStateError) { //-> Lỗi tải dữ liệu
                      return const Center(child: Text('Error loading subtopics'));
                    }

                    return const SizedBox();
                  },
                ),
              )
          );
        },
      ),
    );
  }

  ///ITEM chủ đề con  ----------------------------------------------------------
  Widget _buildItemSub(BuildContext context, S subTopic) {
    String imageUrl = "";
    bool isLearned = false;
    String name = "";

    switch(subTopic) {
      case MdlSubVocabularyTopic _: {
        imageUrl = subTopic.imageUrl;
        isLearned = subTopic.isLearned;
        name = subTopic.name;
        break;
      }

      case MdlSubSentenceTopic _: {
        imageUrl = subTopic.imageUrl;
        isLearned = subTopic.isLearned;
        name = subTopic.name;
        break;
      }
    }

    return WdgButton(
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
                          color: isLearned
                              ? VipColors.primary(context)
                              : VipColors.onPrimary(context))
                  ),
                  child: Image.network(
                    imageUrl,
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
                child: isLearned
                    ? Icon(Icons.check_circle_outline,
                        color: VipColors.primary(context), size: 18)
                    : const SizedBox.shrink(),
              ),
            ],
          ),

          const SizedBox(width: 10),

          ///TEXT tên chủ đề con ----------------------------------------------------------
          Text(name,
              style: const TextStyle(fontSize: 16),
              maxLines: 2,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  ///ITEM từ vựng hoặc câu   -----------------------------------------------------------
  Widget _itemWOrS(BuildContext context, T data, bool expanded) {
    String textW = "";
    String textMeaning = "";
    String textExpaned = "";

    switch(data) {
      case MdlWord _: {
        textW = data.word;
        textMeaning = data.meaning;
        textExpaned = "Loại: ${data.type}m \nUS: ${data.pronounceUS} \nUK: ${data.pronounceUK} \nVí dụ: ${data.example}";
        break;
      }

      case MdlSentence _: {
        textW = data.sentence;
        textMeaning = data.translation;
        break;
      }
    }

    return Column(
      children: [
        ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WdgButton(
                color: Colors.transparent,
                onTap: () {
                  textToSpeakUtil.speak(
                    textW,
                    TextToSpeakUtil.languageUK,
                    TextToSpeakUtil.rateNormal,
                  );
                },
                child: const Icon(Icons.volume_up, size: 30),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textW,
                      style: TextStyle(fontSize: 20, color: VipColors.text(context)),
                    ),
                    Text(textMeaning),
                  ],
                ),
              ),
            ],
          ),
          subtitle: expanded //-> Trạng thái mở rộng
              ? Text(textExpaned)
              : null,
        ),
        Container(
          color: Colors.grey,
          height: 1,
        )
      ],
    );

  }

  ///DIALOG hiển thị danh sách từ vựng hoặc câu ------------------------------------------
  void _showDialogWordList(BuildContext parentContext, S subTopic) {
    int idSubTopic = 0;
    bool isLearned = false;
    List<T> datas = [];

    switch(subTopic) {
      case MdlSubSentenceTopic _: {
        idSubTopic = subTopic.id;
        isLearned = subTopic.isLearned;
        break;
      }
      case MdlSubVocabularyTopic _: {
        idSubTopic = subTopic.id;
        isLearned = subTopic.isLearned;
        break;
      }
    }

    final dialogAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: Navigator.of(parentContext),
    )..forward();

    showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return BlocProvider<DataBloc<T>>(
          create: (context) => DataBloc<T>()..add(DataEventLoad<T>(args: idSubTopic)),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: AnimatedBuilder(
              animation: dialogAnimationController,
              builder: (context, child) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: dialogAnimationController,
                    curve: Curves.easeInOutSine,
                  ),
                  child: Opacity(
                    opacity: dialogAnimationController.value,
                    child: Container(
                      height: orientation == Orientation.portrait ? maxHeight * 0.66 : maxHeight * 0.8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dialogBackgroundColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
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
                                if (dialogAnimationController.isCompleted) {  //-> Thực hiện xong animation
                                  if (state is DataStateLoading<T>) {
                                    return const Center(child: CircularProgressIndicator());

                                  } else if (state is DataStateLoaded<T>) { //-> Trạng thái tải xong dữ liệu
                                    datas = state.data;

                                    return ListView.builder(
                                      itemCount: datas.length,
                                      itemBuilder: (context, index) {
                                        var data = datas[index];
                                        return WdgExpandedView(
                                          expand: _itemWOrS(context, data, true),
                                          child: _itemWOrS(context, data, false),
                                        );
                                      },
                                    );

                                  } else if (state is DataStateError) {
                                    return const Center(child: Text('Error loading words'));
                                  }
                                }

                                return const SizedBox.shrink();
                              },
                            ),
                          ),

                          /// Button học bài  --------------------------------------------------
                          FittedBox(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                if(T == MdlWord)
                                  WdgButton(
                                    buttonFit: ButtonFit.scaleDown,
                                    color: Colors.transparent,
                                    onTap: () {
                                      Navigator.push( //-> Mở quizz
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                                return FlipCardsScreen(words: datas as List<MdlWord>);
                                              }));
                                    },
                                    child: Text('Thẻ ghi nhớ', style: TextStyle(fontSize: 20, color: VipColors.primary(context)),
                                    ),
                                  ),


                                WdgButton(
                                  buttonFit: ButtonFit.scaleDown,
                                  onTap: () async {
                                    if(datas.isNotEmpty) {
                                      Navigator.pop(context); //-> Đóng dialog
                                      final result = await Navigator.push( //-> Mở quizz
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) {
                                              switch (datas) {
                                                case List<MdlWord> _:
                                                  return QuizzScreen.vocabulary(isLearned: isLearned, words: (datas as List<MdlWord>));
                                                case List<MdlSentence> _:
                                                  return QuizzScreen.sentence(isLearned: isLearned, sentences: (datas as List<MdlSentence>));
                                                default:
                                                  return const Center(child: Text('No data available or unsupported type.'));
                                              }
                                            }
                                        ),
                                      );

                                      //--- Cập nhật là đã học  ---
                                      if (parentContext.mounted && result is QuizzResult) {
                                        switch(subTopic) {
                                          case MdlSubSentenceTopic _: {
                                            subTopic.isLearned = true;
                                            break;
                                          }
                                          case MdlSubVocabularyTopic _: {
                                            subTopic.isLearned = true;
                                            break;
                                          }
                                        }
                                        parentContext.read<DataBloc<S>>().add(DataEventUpdate<S>(datas: [subTopic]));
                                      }
                                    }
                                  },
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        isLearned ? 'Ôn tập' : 'Học bài mới',
                                        style: TextStyle(fontSize: 20, color: VipColors.primary(context)),
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
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );

    //--- Đóng hiệu ứng khi dialog bị đóng  ---
    dialogAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        dialogAnimationController.dispose();
      }
    });
  }

  //=== Sắp xếp danh sách chủ đề con  ===
  void _sortSubTopics(List<S> subList) {
    switch(subList) {
      case List<MdlSubSentenceTopic> _: {
        (subList as List<MdlSubSentenceTopic>).sort((a, b) {
          if(!a.isLearned && b.isLearned) {
            return -1;
          } else if(a.isLearned && !b.isLearned) {
            return 1;
          }
          else {
            return 0;
          }});
      }

      case List<MdlSubVocabularyTopic> _: {
        (subList as List<MdlSubVocabularyTopic>).sort((a, b) {
          if(!a.isLearned && b.isLearned) {
            return -1;
          } else if(a.isLearned && !b.isLearned) {
            return 1;
          }
          else {
            return 0;
          }});
      }
    }
  }
}