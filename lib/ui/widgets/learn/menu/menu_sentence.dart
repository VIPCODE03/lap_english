import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/learn/sentence.dart';
import 'package:lap_english/data/model/quizz/quizz.dart';
import 'package:lap_english/services/task_service.dart';
import 'package:lap_english/ui/screens/quizz_screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/text_to_speak.dart';
import '../../other/button.dart';
import '../../other/expandable_view.dart';

class WdgMenuSentence extends StatelessWidget {
  final List<MainSentenceTopic> _mainTopicList;
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

  WdgMenuSentence.build({
    super.key,
    required List<MainSentenceTopic> mainTopicList
  })
      : _mainTopicList = mainTopicList;

  WdgMenuSentence.search({
    super.key,
    required String search,
    required List<MainSentenceTopic> mainTopicList
  })
      : _mainTopicList = mainTopicList
          .where((topic) => topic.name.toLowerCase().contains(search.toLowerCase()))
          .toList();

  /// ITEM chủ đề chính  --------------------------------------------------------
  Widget _buildItemMain(BuildContext context, MainSentenceTopic mainTopic) {
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
                            fontSize: 24,
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
            children: mainTopic.subSentenceTopics.map((subTopic) {
              return _buildItemSub(context, subTopic, subTopic.isLearned);
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

  /// ITEM chủ đề con  ----------------------------------------------------------
  Widget _buildItemSub(BuildContext context, SubSentenceTopic subTopic, bool state) {
    return WdgButton(
      color: Colors.transparent,
      onTap: () => _showDialogSentenceList(context, subTopic),
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
                      color: state ? Theme.of(context).primaryColor : Colors.grey,
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

  ///DIALOG hiển thị danh sách câu  ------------------------------------------
  void _showDialogSentenceList(BuildContext parentContext, SubSentenceTopic subTopic) {
    //---   Tạo hiệu ứng  ---
    final  dialogAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: Navigator.of(parentContext),
    )..forward();

    showDialog(
      context: parentContext,
      builder: (context) {
        return Dialog(
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
                          borderRadius: BorderRadius.circular(20)
                      ),
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
                        if(dialogAnimationController.isCompleted)
                          Expanded(
                            child: ListView.builder(
                                itemCount: subTopic.sentences.length,
                                itemBuilder: (context, index) {
                                  var word = subTopic.sentences[index];
                                  return WdgExpandedView(
                                    expand: _itemSentence(context, word),
                                    child: _itemSentence(context, word),
                                  );
                                },
                              ),
                          ),

                          /// Buton học bài ---------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WdgButton(
                              onTap: () async {
                                Navigator.pop(context);
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizzScreen.sentence(subTopic: subTopic),
                                  ),
                                );

                                if (result is QuizzResult) {
                                  if(parentContext.mounted) {
                                    subTopic.isLearned = true;
                                    parentContext.read<DataBloc<MainSentenceTopic>>().add(DataEventUpdate(datas: _mainTopicList));
                                  }
                                }
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
                  )
                );
              },
          ),
        );
        },
    );
  }

  /// ITEM câu  -----------------------------------------------------------
  Widget _itemSentence(BuildContext context, Sentence sentence) {
    return Column(
      children: [
        ListTile(
            title: Text(sentence.sentence, style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
            subtitle:Text(sentence.translation)
          ),
        Container(
          color: Colors.grey,
          height: 1,
        )
      ],
    );
  }
}
