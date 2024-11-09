
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/text_to_speak.dart';
import '../../../screens/quizz_screen.dart';
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
        padding: EdgeInsets.zero,
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
        mainTopic as MdlMainVocabularyTopic;
        idMainTopic = mainTopic.id;
        nameTopic = mainTopic.name;
        break;
      }

      case MdlMainSentenceTopic _: {
        mainTopic as MdlMainSentenceTopic;
        idMainTopic = mainTopic.id;
        nameTopic = mainTopic.name;
        break;
      }
    }

    return BlocProvider(
      create: (context) => DataBloc<S>()..add(DataEventLoad<S>(args: idMainTopic)),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),

              /// Tên chủ đề  --------------------------------------------------
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            nameTopic,
                            style: GoogleFonts.pangolin(
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "2/5",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Hộp danh sách chủ đề con  ------------------------------------
              SizedBox(
                height: 145,
                child: BlocBuilder<DataBloc<S>, DataState>(
                  builder: (context, state) {
                    if (state is DataStateLoading) {  //-> Đang tải dữ liệu
                      return const Center(child: CircularProgressIndicator());

                    } else if (state is DataStateLoaded<S>) { //-> Đã tải xong dữ liệu
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
                          return _buildItemSub(context, subTopics[index]);
                        },
                      );

                    } else if (state is DataStateError) { //-> Lỗi tải dữ liệu
                      return const Center(child: Text('Error loading subtopics'));
                    }

                    return const SizedBox();
                  },
                ),
              ),

              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ],
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
        subTopic as MdlSubVocabularyTopic;
        imageUrl = subTopic.imageUrl;
        isLearned = subTopic.isLearned;
        name = subTopic.name;
        break;
      }

      case MdlSubSentenceTopic _: {
        subTopic as MdlSubSentenceTopic;
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
          ///ẢNH tải từ server  --------------------------------------------------
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  color: isLearned
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(5),
                    child: Image.network(
                      "https://thuthuatnhanh.com/wp-content/uploads/2020/03/anh-hoat-hinh-nam-de-thuong.jpg",
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
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
              ),

              ///ICON hoàn thành  ------------------------------------------------
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: isLearned
                      ? const Icon(Icons.check, color: Colors.white, size: 18)
                      : null,
                ),
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
        var word = data as MdlWord;
        textW = word.word;
        textMeaning = word.meaning;
        textExpaned = "Loại: ${word.type}m \nUS: ${word.pronounceUS} \nUK: ${word.pronounceUK} \nVí dụ: ${word.example}";
        break;
      }

      case MdlSentence _: {
        var sentence = data as MdlSentence;
        textW = sentence.sentence;
        textMeaning = sentence.translation;
        break;
      }
    }

    return Column(
      children: [
        ListTile(
          title: SizedBox(
            child: Wrap(direction: Axis.vertical, children: [
              Text(textW,
                  style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)
              ),
              Text(textMeaning)
            ]),
          ),
          subtitle: expanded //-> Trạng thái mở rộng
              ? Text(textExpaned)
              : null,
          trailing: WdgButton(
            color: Colors.transparent,
            onTap: () {
              textToSpeakUtil.speak(textW, TextToSpeakUtil.languageUK,
                  TextToSpeakUtil.rateNormal);
            },
            child: const Icon(Icons.volume_up, size: 30),
          ),
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
        subTopic as MdlSubSentenceTopic;
        idSubTopic = subTopic.id;
        isLearned = subTopic.isLearned;
        break;
      }
      case MdlSubVocabularyTopic _: {
        subTopic as MdlSubVocabularyTopic;
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
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dialogBackgroundColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [

                          /// Ảnh bìa giấy  -------------------------------------------
                          Image(
                            width: MediaQuery.of(context).size.width,
                            repeat: ImageRepeat.repeat,
                            height: 50,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              WdgButton(
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
                                          (subTopic as MdlSubSentenceTopic).isLearned = true;
                                          break;
                                        }
                                        case MdlSubVocabularyTopic _: {
                                          (subTopic as MdlSubVocabularyTopic).isLearned = true;
                                          break;
                                        }
                                      }
                                      parentContext.read<DataBloc<S>>().add(DataEventUpdate<S>(datas: [subTopic]));
                                    }
                                  }
                                },
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      isLearned ? 'Ôn tập' : 'Học bài mới',
                                      style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                                    ),
                                    Icon(
                                      Icons.keyboard_double_arrow_right,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

    // Đóng hiệu ứng khi dialog bị đóng
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