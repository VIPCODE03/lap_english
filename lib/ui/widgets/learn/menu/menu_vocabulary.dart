
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/model/learn/vocabulary.dart';
import 'package:lap_english/ui/screens/quizz_screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/text_to_speak.dart';
import '../../other/button.dart';
import '../../other/expandable_view.dart';

class WdgMenuVocabulary extends StatelessWidget {
  final List<MainVocabularyTopic> _mainTopicList;
  final textToSpeakUtil = TextToSpeakUtil();

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

  WdgMenuVocabulary.build({
    super.key,
    required List<MainVocabularyTopic> mainTopicList
  })
      : _mainTopicList = mainTopicList;

  WdgMenuVocabulary.search({
    super.key,
    required String search,
    required List<MainVocabularyTopic> mainTopicList
  })
      : _mainTopicList = mainTopicList
      .where((topic) => topic.name.toLowerCase().contains(search.toLowerCase()))
      .toList();

  ///ITEM chủ đề con  ----------------------------------------------------------
  Widget _buildItemSub(BuildContext context, SubVocabularyTopic subTopic, bool state) {
    return WdgButton(
      color: Colors.transparent,
      onTap: () => _showDialogWordList(context, subTopic.words),
      child: Column(
        children: [
          Column(
            children: [
              ///ẢNH tải từ server  --------------------------------------------------
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      color:
                          state ? Theme.of(context).primaryColor : Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(5),
                        child: Image.network(
                          subTopic.imageUrl,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
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
                      child: state ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 20),

              ///TEXT tên chủ đề con ----------------------------------------------------------
              Text(subTopic.name, style: const TextStyle(fontSize: 14), maxLines: 2, textAlign: TextAlign.center),
            ],
          ),
        ],
      ),
    );
  }

  ///ITEM chủ đề chính  --------------------------------------------------------
  Widget _buildItemMain(BuildContext context, MainVocabularyTopic mainTopic) {
    return Column(
      children: [
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    child: Text(mainTopic.name,
                        style: GoogleFonts.pangolin(
                            fontWeight: FontWeight.w900,
                            fontSize: 24  ,
                            color: Theme.of(context).primaryColor)
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
                  )
                ],
              ),
            ],
          ),
        ),

        ///GRIDVIEW danh sách chủ đề con  --------------------------------------
        const SizedBox(height: 20),
        SizedBox(
          height: 130,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 1,
            children: mainTopic.subTopics.map((subTopic) {
              return _buildItemSub(context, subTopic, mainTopic.subTopics.indexOf(subTopic) < 3 );
            }).toList(),
          ),
        ),

        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
        ),
      ],
    );
  }

  ///DIALOG hiển thị danh sách từ vựng  ------------------------------------------
  void _showDialogWordList(BuildContext context, List<Word> words) {
    //---   Tạo hiệu ứng  ---
    final  dialogAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: Navigator.of(context),
    )..forward();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: AnimatedBuilder(
              animation: dialogAnimationController,
              builder: (context, child) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: dialogAnimationController,
                    curve: Curves.fastLinearToSlowEaseIn,
                  ),
                  child: Opacity(
                    opacity: dialogAnimationController.value,
                    child: Column(
                      children: [
                        /// Ảnh bìa ----------------------------------------------------
                        Image(
                          width: MediaQuery.of(context).size.width,
                          repeat: ImageRepeat.repeat,
                          height: 50,
                          image: Assets.images.cover.headbock.provider(),
                        ),

                        /// Danh sách tạo sau --------------------------------------------
                        FutureBuilder(
                          future: Future.delayed(const Duration(milliseconds: 10)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: words.length,
                                  itemBuilder: (context, index) {
                                    var word = words[index];
                                    return WdgExpandedView(
                                      expand: _itemWord(context, word, true),
                                      child: _itemWord(context, word, false),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),

                        /// Buton học bài ---------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WdgButton(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizzScreen.vocabulary(words: words),
                                  ),
                                );
                              },
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Học bài',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
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
                );
              },
            ),
          ),
        );
      },
    );

    //--- Đóng hiệu ứng ---
    dialogAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        dialogAnimationController.dispose();
      }
    });
  }

  ///ITEM từ vựng   -----------------------------------------------------------
  Widget _itemWord(BuildContext context, Word word, bool expanded) {
    return Column(
      children: [
        ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
              child: Column(children: [
                Text(word.word, style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
                Text(word.meaning)
              ]),
          ),
          subtitle: expanded //-> Trạng thái mở rộng
              ? Text("Loại: ${word.type}m \nUS: ${word.pronounceUS} \nUK: ${word.pronounceUK} \nVí dụ: ${word.examples.first}")
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("US"),
              IconButton(
                onPressed: () {
                  textToSpeakUtil.speak(word.word, TextToSpeakUtil.languageUS,
                      TextToSpeakUtil.rateNormal);
                },
                icon: const Icon(Icons.volume_up),
              ),
              const Text("UK"),
              IconButton(
                onPressed: () {
                  textToSpeakUtil.speak(word.word, TextToSpeakUtil.languageUK,
                      TextToSpeakUtil.rateNormal);
                },
                icon: const Icon(Icons.volume_up),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 1,
        )
      ],
    );
  }
}