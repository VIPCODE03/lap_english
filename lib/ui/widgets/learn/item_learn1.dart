
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lap_english/data/model/vocabulary.dart';
import 'package:lap_english/ui/screens/login_screen.dart';

class ListViewVocabulary extends StatelessWidget {
  final List<MainVocabularyTopic> _mainTopicList;

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

  const ListViewVocabulary.builder({
    super.key,
    required List<MainVocabularyTopic> mainTopicList
  })
      : _mainTopicList = mainTopicList;


  ///ITEM chủ đề con  ----------------------------------------------------------
  Widget _buildItemSub(BuildContext context, SubVocabularyTopic subTopic, bool state) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),)),
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
              Text(
                subTopic.name,
                style: const TextStyle(fontSize: 14),
              ),
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
          height: 125                                                                  ,
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
}