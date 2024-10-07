import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/model/sentence.dart';
import 'package:lap_english/ui/screens/learn_screen.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/text_to_speak.dart';
import '../../other/expandable_view.dart';

class MenuSentence extends StatelessWidget {
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

  MenuSentence.builder({
    super.key,
    required List<MainSentenceTopic> mainTopicList
  })
      : _mainTopicList = mainTopicList;


  /// ITEM chủ đề con  ----------------------------------------------------------
  Widget _buildItemSub(BuildContext context, SubSentenceTopic subTopic, bool state) {
    return InkWell(
      onTap: () => _showDialogSentenceList(context, subTopic.sentences),
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
              return _buildItemSub(context, subTopic, mainTopic.subSentenceTopics.indexOf(subTopic) < 3 );
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

  ///DIALOG hiển thị danh sách câu  ------------------------------------------
  void _showDialogSentenceList(BuildContext context, List<Sentence> sentences) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width,
                  repeat: ImageRepeat.repeat,
                  height: 50,
                  image: Assets.images.logo.left.provider(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: sentences.length,
                    itemBuilder: (context, index) {
                      var sentence = sentences[index];
                      return ExpandedView(
                        expand: _itemSentence(context, sentence),
                        child: _itemSentence(context, sentence),
                      );
                    },
                  ),
                ),
                ///BUTTON chuyển tới quizz ----------------------------------------------------
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearnScreen.sentence(sentences: sentences)
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Học bài",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
